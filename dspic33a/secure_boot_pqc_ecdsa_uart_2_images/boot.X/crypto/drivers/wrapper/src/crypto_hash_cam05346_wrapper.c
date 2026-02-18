/**************************************************************************
  Crypto Framework Library Source

  Company:
    Microchip Technology Inc.

  File Name:
    crypto_hash_cam05346_wrapper.c

  Summary:
    Crypto Framework Library wrapper file for hardware SHA.

  Description:
    This source file contains the wrapper interface to access the SHA
    hardware driver for Microchip microcontrollers.
**************************************************************************/

//DOM-IGNORE-BEGIN
/*
Copyright (C) 2025, Microchip Technology Inc., and its subsidiaries. All rights reserved.

The software and documentation is provided by microchip and its contributors
"as is" and any express, implied or statutory warranties, including, but not
limited to, the implied warranties of merchantability, fitness for a particular
purpose and non-infringement of third party intellectual property rights are
disclaimed to the fullest extent permitted by law. In no event shall microchip
or its contributors be liable for any direct, indirect, incidental, special,
exemplary, or consequential damages (including, but not limited to, procurement
of substitute goods or services; loss of use, data, or profits; or business
interruption) however caused and on any theory of liability, whether in contract,
strict liability, or tort (including negligence or otherwise) arising in any way
out of the use of the software and documentation, even if advised of the
possibility of such damage.

Except as expressly permitted hereunder and subject to the applicable license terms
for any third-party software incorporated in the software and any applicable open
source software license terms, no license or other rights, whether express or
implied, are granted under any patent or other intellectual property rights of
Microchip or any third party.
*/
//DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <string.h>
#include "crypto/drivers/wrapper/crypto_hash_cam05346_wrapper.h"
#include "crypto/drivers/wrapper/crypto_cam05346_wrapper.h"

// *****************************************************************************
// *****************************************************************************
// Section: File scope functions
// *****************************************************************************
// *****************************************************************************

/**
 * @brief Initialize the CAM library's AES interrupt handlers.
 */
static void lDRV_CRYPTO_HASH_InterruptSetup(void)
{
    (void)Crypto_Int_Hw_Register_Handler(CRYPTO1_INT, DRV_CRYPTO_HASH_IsrHelper);
    (void)Crypto_Int_Hw_Enable(CRYPTO1_INT);
}


// *****************************************************************************
// *****************************************************************************
// Section: Hash Algorithms Common Interface Implementation
// *****************************************************************************
// *****************************************************************************

crypto_Hash_Status_E Crypto_Hash_Hw_Sha_GetAlgorithm(crypto_Hash_Algo_E shaAlgorithm, HASHCON_MODE *mode)
{
    crypto_Hash_Status_E status = CRYPTO_HASH_ERROR_FAIL;

    switch(shaAlgorithm)
    {
        case CRYPTO_HASH_SHA1:
            *mode = MODE_SHA1;
            status = CRYPTO_HASH_SUCCESS;
            break;
        case CRYPTO_HASH_SHA2_224:
            *mode = MODE_SHA224;
            status = CRYPTO_HASH_SUCCESS;
            break;
        case CRYPTO_HASH_SHA2_256:
            *mode = MODE_SHA256;
            status = CRYPTO_HASH_SUCCESS;
            break;
        case CRYPTO_HASH_SHA2_384:
            *mode = MODE_SHA384;
            status = CRYPTO_HASH_SUCCESS;
            break;
        case CRYPTO_HASH_SHA2_512:
            *mode = MODE_SHA512;
            status = CRYPTO_HASH_SUCCESS;
            break;
        default:
            status = CRYPTO_HASH_ERROR_ALGO;
            break;
    }

    return status;
}

crypto_Hash_Status_E Crypto_Hash_Hw_Sha_GetDigestLength(crypto_Hash_Algo_E shaAlgorithm, uint32_t *digestLength)
{
    crypto_Hash_Status_E status = CRYPTO_HASH_SUCCESS;

    switch(shaAlgorithm)
    {
        case CRYPTO_HASH_SHA1:
            *digestLength = 20;
            break;
        case CRYPTO_HASH_SHA2_224:
            *digestLength = 28;
            break;
        case CRYPTO_HASH_SHA2_256:
            *digestLength = 32;
            break;
        case CRYPTO_HASH_SHA2_384:
            *digestLength = 48;
            break;
        case CRYPTO_HASH_SHA2_512:
            *digestLength = 64;
            break;
        default:
            *digestLength = 0;
            status = CRYPTO_HASH_ERROR_ALGO;
            break;
    }

    return status;
}

crypto_Hash_Status_E Crypto_Hash_Hw_Sha_Init(void *shaInitCtx,
        crypto_Hash_Algo_E shaAlgorithm)
{
    /* MISRA C:2012 Rule 11.5 deviation:
    * Reason: Conversion from void* to the HASH context defined by the
    *         CAM Hardware Driver pre-compiled library is required since
    *         the library does not have access to the upper context structures
    *         defined by the Crypto APIs.
    */
    /* cppcheck-suppress misra-c2012-11.5 */
    CRYPTO_HASH_HW_CONTEXT *shaCtx = (CRYPTO_HASH_HW_CONTEXT*) shaInitCtx;
    HASHCON_MODE mode;
    crypto_Hash_Status_E status = CRYPTO_HASH_ERROR_FAIL;
    HASH_ERROR hashStatus = HASH_INITIALIZE_ERROR;

    status = Crypto_Hash_Hw_Sha_GetAlgorithm(shaAlgorithm, &mode);

    if (status == CRYPTO_HASH_SUCCESS)
    {
        shaCtx->algorithm = shaAlgorithm;
        (void)memset(shaCtx->contextData, 0, sizeof(shaCtx->contextData));
        hashStatus = DRV_CRYPTO_HASH_Initialize(shaCtx->contextData, mode);
    }

    if (hashStatus == HASH_NO_ERROR)
    {
        lDRV_CRYPTO_HASH_InterruptSetup();
    }
    else
    {
        status = CRYPTO_HASH_ERROR_FAIL;
    }

    return status;
}

crypto_Hash_Status_E Crypto_Hash_Hw_Sha_Update(void *shaUpdateCtx,
    uint8_t *data, uint32_t dataLen)
{
   /* MISRA C:2012 Rule 11.5 deviation:
    * Reason: Conversion from void* to the HASH context defined by the
    *         CAM Hardware Driver pre-compiled library is required since
    *         the library does not have access to the upper context structures
    *         defined by the Crypto APIs.
    */
    /* cppcheck-suppress misra-c2012-11.5 */
    CRYPTO_HASH_HW_CONTEXT *shaCtx = (CRYPTO_HASH_HW_CONTEXT*) shaUpdateCtx;
    crypto_Hash_Status_E status = CRYPTO_HASH_ERROR_FAIL;
    HASH_ERROR hashStatus;
    HASH_ERROR hashActive;

    hashStatus = DRV_CRYPTO_HASH_IsActive(shaCtx->contextData, &hashActive);
    if ((hashStatus == HASH_NO_ERROR) && (hashActive == HASH_OPERATION_IS_ACTIVE))
    {
        hashStatus = DRV_CRYPTO_HASH_Update(shaCtx->contextData, data, dataLen);

        if (hashStatus == HASH_NO_ERROR)
        {
            status = CRYPTO_HASH_SUCCESS;
        }
    }

    return status;
}

crypto_Hash_Status_E Crypto_Hash_Hw_Sha_Final(void *shaFinalCtx,
    uint8_t *digest)
{
    /* MISRA C:2012 Rule 11.5 deviation:
    * Reason: Conversion from void* to the HASH context defined by the
    *         CAM Hardware Driver pre-compiled library is required since
    *         the library does not have access to the upper context structures
    *         defined by the Crypto APIs.
    */
    /* cppcheck-suppress misra-c2012-11.5 */
    CRYPTO_HASH_HW_CONTEXT *shaCtx = (CRYPTO_HASH_HW_CONTEXT*) shaFinalCtx;
    crypto_Hash_Status_E status = CRYPTO_HASH_ERROR_FAIL;
    HASH_ERROR hashStatus;
    HASH_ERROR hashActive;
    uint32_t digestLength = 0;

    hashStatus = DRV_CRYPTO_HASH_IsActive(shaCtx->contextData, &hashActive);
    if ((hashStatus == HASH_NO_ERROR) && (hashActive == HASH_OPERATION_IS_ACTIVE))
    {
        status = Crypto_Hash_Hw_Sha_GetDigestLength(shaCtx->algorithm, &digestLength);
    }

    if (status == CRYPTO_HASH_SUCCESS)
    {
        hashStatus = DRV_CRYPTO_HASH_Final(shaCtx->contextData, digest, digestLength);
        if (hashStatus != HASH_NO_ERROR)
        {
            status = CRYPTO_HASH_ERROR_FAIL;
        }
    }

    return status;
}

crypto_Hash_Status_E Crypto_Hash_Hw_Sha_Digest(uint8_t *data, uint32_t dataLen,
    uint8_t *digest, crypto_Hash_Algo_E shaAlgorithm_en)
{
    HASHCON_MODE mode;
    crypto_Hash_Status_E status = CRYPTO_HASH_ERROR_FAIL;
    CRYPTO_HASH_HW_DIGEST_CONTEXT shaDigestCtx;

    status = Crypto_Hash_Hw_Sha_GetAlgorithm(shaAlgorithm_en, &mode);

    if (status == CRYPTO_HASH_SUCCESS)
    {
        HASH_ERROR hashStatus = HASH_INITIALIZE_ERROR;
        uint32_t digestLength = 0;

        lDRV_CRYPTO_HASH_InterruptSetup();

        shaDigestCtx.algorithm = shaAlgorithm_en;
        (void)memset(shaDigestCtx.contextData, 0, sizeof(shaDigestCtx.contextData));

        if (CRYPTO_HASH_SUCCESS == Crypto_Hash_Hw_Sha_GetDigestLength(shaDigestCtx.algorithm, &digestLength))
        {
            hashStatus = DRV_CRYPTO_HASH_Digest(shaDigestCtx.contextData, mode, data, dataLen, digest, digestLength);
        }

        if (hashStatus != HASH_NO_ERROR)
        {
            status = CRYPTO_HASH_ERROR_FAIL;
        }
    }

    return status;
}
