/*
Copyright (c) [2012-2025] Microchip Technology Inc.  

    All rights reserved.

    You are permitted to use the accompanying software and its derivatives 
    with Microchip products. See the Microchip license agreement accompanying 
    this software, if any, for additional info regarding your rights and 
    obligations.
    
    MICROCHIP SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT 
    WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT 
    LIMITATION, ANY WARRANTY OF MERCHANTABILITY, TITLE, NON-INFRINGEMENT 
    AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP OR ITS
    LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT, NEGLIGENCE, STRICT 
    LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER LEGAL EQUITABLE 
    THEORY FOR ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES INCLUDING BUT NOT 
    LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES, 
    OR OTHER SIMILAR COSTS. 
    
    To the fullest extend allowed by law, Microchip and its licensors 
    liability will not exceed the amount of fees, if any, that you paid 
    directly to Microchip to use this software. 
    
    THIRD PARTY SOFTWARE:  Notwithstanding anything to the contrary, any 
    third party software accompanying this software is subject to the terms 
    and conditions of the third party's license agreement.  To the extent 
    required by third party licenses covering such third party software, 
    the terms of such license will apply in lieu of the terms provided in 
    this notice or applicable license.  To the extent the terms of such 
    third party licenses prohibit any of the restrictions described here, 
    such restrictions will not apply to such third party software.
*/
#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#include "./user_settings.h"

#include "mdfu_verification.h"
#include "mdfu_partition_header.h"
#include "mdfu_config.h"
#include "mdfu_partition.h"

#include "user_settings.h"

#include "user_settings.h"

/* Included from the ../crypto/common_crypto project include path */
#include "crypto_digsign.h"
#include "crypto_common.h"
#include "crypto_hash.h"

/* Included from the ../crypto/drivers/wrapper project include path */
#include "crypto_digisign_cam05346_wrapper.h"

/* Included from the ../crypto/wolfssl/wolfssl/wolfcrypt project include path */
#include "dilithium.h"
#include "error-crypt.h"

#define MEMCMP_EQUAL            0
#define SHA384_DIGEST_LENGTH    48UL
#define SHA512_DIGEST_LENGTH    64UL
#define SHA512_BLOCK_SIZE       128UL
#define SHA384_BLOCK_SIZE       128UL

#define P384_PUBLIC_KEY_SIZE            97UL
#define P384_SIGNATURE_SIZE             96UL

#define ML_DSA_87_PUBLIC_KEY_ORIGIN     0x81A064
#define ML_DSA_87_SIGNATURE_ORIGIN      0x84D064

extern struct MDFU_PARTITION keystore;
static enum MDFU_VERIFY_CODE MDFU_VerifyHeaderAuthenticityP384(struct MDFU_PARTITION const * const partition);
static enum MDFU_VERIFY_CODE MDFU_VerifyHeaderAuthenticityMLDSA87(struct MDFU_PARTITION const * const partition);

/**
 * @brief   Verifies the authenticity of the partition header.  NOTE - the 
 *          contents of the header are not checked, only the headers authenticity.  
 * @param   struct PARTITION* partition - the partition to authenticate header of.
 * @return  enum MDFU_VERIFY_CODE - code of result. MDFU_VERIFY_CODE_SUCCESS if 
 *          header is authenticated.  
 */
enum MDFU_VERIFY_CODE MDFU_VerifyHeaderAuthenticity(struct MDFU_PARTITION const * const partition)
{      
    enum MDFU_VERIFY_CODE returnCode = MDFU_VERIFY_CODE_INVALID_PARTITION;
    enum MDFU_VERIFY_CODE p384VerifyCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
    enum MDFU_VERIFY_CODE mldsaVerifyCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
    
    p384VerifyCode = MDFU_VerifyHeaderAuthenticityP384(partition);
    
    if(p384VerifyCode == MDFU_VERIFY_CODE_SUCCESS)
    {
        mldsaVerifyCode = MDFU_VerifyHeaderAuthenticityMLDSA87(partition);
    } 
    
    if(mldsaVerifyCode  == MDFU_VERIFY_CODE_SUCCESS)
    {
        returnCode = MDFU_VERIFY_CODE_SUCCESS;
    }
    else
    {
        /*There is an error in either verify. The most helpful return codes are 
        at a lesser negative number so return them first.
         */
        returnCode = (p384VerifyCode < mldsaVerifyCode) ? p384VerifyCode : mldsaVerifyCode;
    }
    
    return returnCode;
}

/**
 * @brief   Verifies the integrity of the partition data.  NOTE - must verify 
 *          the authenticity of the partition header before calling this function.
 * @param   struct PARTITION* partition - the partition to integrity check.
 * @return  enum MDFU_VERIFY_CODE - code of result. MDFU_VERIFY_CODE_SUCCESS if 
 *          partition integrity check passes.  
 */
enum MDFU_VERIFY_CODE MDFU_VerifyPartitionIntegrity(struct MDFU_PARTITION const * const partition)
{
    enum MDFU_VERIFY_CODE returnCode = MDFU_VERIFY_CODE_INVALID_PARTITION;

    if (partition != NULL) {
        uint32_t codeSize = 0;
        uint8_t calculatedDigest[SHA512_DIGEST_LENGTH];
        uint8_t expectedDigest[SHA512_DIGEST_LENGTH];

        if ((MDFU_HeaderItemBufferRead(partition, MDFU_PARTITION_HEADER_INTEGRITY, sizeof (expectedDigest), &expectedDigest) != sizeof (expectedDigest)) ||
                (MDFU_HeaderItemBufferRead(partition, MDFU_PARTITION_HEADER_DATA_SIZE, sizeof (uint32_t), &codeSize) != sizeof (uint32_t))) {
            returnCode = MDFU_VERIFY_CODE_INVALID_HEADER;
        }
        else if(partition->hash(MDFU_PARTITION_HASH_ALGORITHM_SHA2_512, MDFU_CONFIG_DATA_OFFSET, codeSize, calculatedDigest) != MDFU_PARTITION_STATUS_SUCCESS){
            returnCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
        } else if(memcmp(calculatedDigest, expectedDigest, sizeof(expectedDigest)) != MEMCMP_EQUAL){
            returnCode = MDFU_VERIFY_CODE_INVALID_INTEGRITY_CHECK;
        } else {
            returnCode = MDFU_VERIFY_CODE_SUCCESS;
        }
    }
    
    return returnCode;
}

/**
 * @brief    Verifies the authenticity of the partition header and if authentic, 
 *           then verifies the integrity of the partition data.
 * @param    struct PARTITION* partition - the partition to verify.
 * @return   enum MDFU_VERIFY_CODE - code of result. MDFU_VERIFY_CODE_SUCCESS if 
 *           both checks are successful.
 */
enum MDFU_VERIFY_CODE MDFU_Verify(struct MDFU_PARTITION const * const partition) 
{        
    enum MDFU_VERIFY_CODE result = MDFU_VERIFY_CODE_INVALID_PARTITION;
        
    if(partition != NULL){
        result = MDFU_VerifyHeaderAuthenticity(partition);
        if (result == MDFU_VERIFY_CODE_SUCCESS)
        {
            result = MDFU_VerifyPartitionIntegrity(partition);
        }
    }

    return result;
}

/**
 * @brief   Verifies the authenticity of the partition header.  NOTE - the 
 *          contents of the header are not checked, only the headers authenticity.  
 * @param   struct PARTITION* partition - the partition to authenticate header of.
 * @return  enum MDFU_VERIFY_CODE - code of result. MDFU_VERIFY_CODE_SUCCESS if 
 *          header is authenticated.  
 */
static enum MDFU_VERIFY_CODE MDFU_VerifyHeaderAuthenticityP384(struct MDFU_PARTITION const * const partition)
{
    enum MDFU_VERIFY_CODE returnCode = MDFU_VERIFY_CODE_INVALID_PARTITION;    
    
    if (partition != NULL)
    {
        static uint8_t headerDigest[SHA384_DIGEST_LENGTH];
        static uint8_t signature[P384_SIGNATURE_SIZE];
        static uint8_t publicKey[P384_PUBLIC_KEY_SIZE];
        int8_t hashStatus = 0;
        
        if (keystore.read(MDFU_CONFIG_KEYSTORE_P384_PUBLIC_KEY_OFFSET, P384_PUBLIC_KEY_SIZE, publicKey) != P384_PUBLIC_KEY_SIZE) {
            returnCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
        } else if (partition->read(MDFU_CONFIG_SIGNATURE_P384_OFFSET, P384_SIGNATURE_SIZE, signature) != P384_SIGNATURE_SIZE){
            returnCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
        } else if(partition->hash(MDFU_PARTITION_HASH_ALGORITHM_SHA2_384, MDFU_CONFIG_HEADER_OFFSET, MDFU_CONFIG_HEADER_LENGTH, headerDigest) != MDFU_PARTITION_STATUS_SUCCESS){
            returnCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
        } else if (Crypto_DigiSign_Ecdsa_Verify(CRYPTO_HANDLER_HW_INTERNAL, headerDigest, sizeof(headerDigest), signature, sizeof(signature), publicKey, sizeof(publicKey), &hashStatus, CRYPTO_ECC_CURVE_P384, 0x1U) != CRYPTO_DIGISIGN_SUCCESS){
            returnCode = MDFU_VERIFY_CODE_INVALID_SIGNATURE;
        } else {
            returnCode = MDFU_VERIFY_CODE_SUCCESS;
        }
    }
   
    return returnCode;
}

/**
 * @brief   Verifies the authenticity of the partition header.  NOTE - the 
 *          contents of the header are not checked, only the headers authenticity.  
 * @param   struct PARTITION* partition - the partition to authenticate header of.
 * @return  enum MDFU_VERIFY_CODE - code of result. MDFU_VERIFY_CODE_SUCCESS if 
 *          header is authenticated.  
 */
static enum MDFU_VERIFY_CODE MDFU_VerifyHeaderAuthenticityMLDSA87(struct MDFU_PARTITION const * const partition)
{
    enum MDFU_VERIFY_CODE returnCode = MDFU_VERIFY_CODE_INVALID_PARTITION;    
    
    if (partition != NULL)
    {
        static uint8_t header[MDFU_CONFIG_HEADER_LENGTH];
        static uint8_t signature[DILITHIUM_ML_DSA_87_SIG_SIZE];
        static uint8_t publicKey[DILITHIUM_ML_DSA_87_PUB_KEY_SIZE];
        int status = 0;
        static dilithium_key key;
        
        (void)wc_MlDsaKey_SetParams(&key, WC_ML_DSA_87);
        
        if (keystore.read(MDFU_CONFIG_KEYSTORE_MLDSA87_PUBLIC_KEY_OFFSET, DILITHIUM_ML_DSA_87_PUB_KEY_SIZE, publicKey) != (size_t)DILITHIUM_ML_DSA_87_PUB_KEY_SIZE){
            returnCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
        } else if (partition->read(MDFU_CONFIG_SIGNATURE_MLDSA87_OFFSET, DILITHIUM_ML_DSA_87_SIG_SIZE, signature) != (size_t)DILITHIUM_ML_DSA_87_SIG_SIZE){
            returnCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
        } else if (partition->read(MDFU_CONFIG_HEADER_OFFSET, MDFU_CONFIG_HEADER_LENGTH, header) != MDFU_CONFIG_HEADER_LENGTH){
            returnCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
        } else if ((wc_MlDsaKey_ImportPubRaw(&key, publicKey, DILITHIUM_ML_DSA_87_PUB_KEY_SIZE) != 0)){
            returnCode = MDFU_VERIFY_CODE_FAILURE_UNKNOWN;
        } else if ((wc_dilithium_verify_ctx_msg(signature, DILITHIUM_ML_DSA_87_SIG_SIZE, (const byte*)NULL, 0, (const byte*) header, MDFU_CONFIG_HEADER_LENGTH, &status, &key)) != 0){
            returnCode = MDFU_VERIFY_CODE_INVALID_SIGNATURE;
        } else if(status != 1){
            returnCode = MDFU_VERIFY_CODE_INVALID_SIGNATURE;
        } else {
            returnCode = MDFU_VERIFY_CODE_SUCCESS;
        }
    }
   
    return returnCode;
}