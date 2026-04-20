/*
Copyright (c) [2025] Microchip Technology Inc.  

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

#include <string.h>
#include <stdint.h>

#include "mdfu_partition.h"
#include "mdfu_partition_download.h"
#include "mdfu_internal_flash.h"
#include "mdfu_config.h"
#include "critical_region.h"
#include "flash_region.h"

/* Included from the crypto/common_crypto project include path */
#include "crypto_common.h"
#include "crypto_hash.h"

#ifdef __XC__
#include <xc.h>
#endif

#if ((MDFU_CONFIG_DOWNLOAD_HEADER_ORIGIN + MDFU_CONFIG_HEADER_LENGTH) != MDFU_CONFIG_DOWNLOAD_DATA_ORIGIN)
#error "The download partition header must immediately follow the download partition header verification value. Please adjust the header address or the header verification address."
#endif

#ifndef DOWNLOAD_MEMORY
#define DOWNLOAD_MEMORY downloadMemory
static uint8_t downloadMemory[MDFU_CONFIG_PARTITION_SIZE] __attribute__((address(MDFU_CONFIG_DOWNLOAD_ORIGIN), space(prog), noload));
#endif

extern const struct FLASH_REGION flashRegion3;

static size_t Read(uint32_t offset, size_t length, void* buffer);
static enum MDFU_PARTITION_STATUS Write(uint32_t address, size_t length, uint8_t const * const data);
static enum MDFU_PARTITION_STATUS Erase(void);
static enum MDFU_PARTITION_STATUS Copy(const struct MDFU_PARTITION* source);
static enum MDFU_PARTITION_STATUS Run(void);
static enum MDFU_PARTITION_STATUS ModeChange(enum MDFU_PARTITION_MODE mode);
static enum MDFU_PARTITION_STATUS Hash(enum MDFU_PARTITION_HASH_ALGORITHM algorithm, uint32_t offset, uint32_t length, uint8_t *digest);
static bool ArgumentsAreInvalid(uint32_t offset, uint32_t length, void const * const pointer);
static bool HashIsSupported(enum MDFU_PARTITION_HASH_ALGORITHM algorithm);

const struct MDFU_PARTITION download = {
    .read = &Read,
    .write = &Write,
    .erase = &Erase,
    .copy = &Copy,
    .run = &Run,
    .modeChange = &ModeChange,
    .hash = &Hash
};

/**
 * @brief    Reads the specified memory from the download partition
 * @param    uint32_t offset - offset into the partition to start reading from
 * @param    size_t length - amount of data to read from partition
 * @param    void* buffer - pointer to where to write the data that is read
 * @return   size_t - the amount of data actually read
 */
static size_t Read(uint32_t offset, size_t length, void* buffer)
{    
    size_t actualLength = length;
            
    if(ArgumentsAreInvalid(offset, length, buffer))
    {
        actualLength = 0;
    } 
    else 
    {
        (void)memcpy(buffer, &DOWNLOAD_MEMORY[offset], actualLength);
    }
    
    return actualLength;
}

/**
 * @brief    Writes data to the specified address in memory. This is to be called by the client's MDFU Firmware Update Layer when 
 *           a write chunk command has been received from the MDFU Command Processor Layer
 * @param    uint32_t offset - offset for the write operation.  Must be aligned to hardware write requirements.
 * @param    size_t length - Number of bytes to be written
 * @param    uint8_t const * const - Pointer to the buffer containing data to be written
 * @return   Status indicating if the write operation was successful and if not, what error occurred 
 */
static enum MDFU_PARTITION_STATUS Write(uint32_t offset, size_t length, uint8_t const * const data)
{
    enum MDFU_PARTITION_STATUS status;
    
    if(ArgumentsAreInvalid(offset, length, data))
    {
        status = MDFU_PARTITION_STATUS_INVALID_ARGUMENT;
    } 
    else if(MDFU_INTERNAL_FLASH_Write(MDFU_CONFIG_DOWNLOAD_ORIGIN + offset, length, data))
    {
        status = MDFU_PARTITION_STATUS_SUCCESS; 
    }
    else
    {
        status = MDFU_PARTITION_STATUS_OPERATION_FAILED;
    }

    return status;
}

/**
 * @brief    Erases the entire download partition in preparation for write operations. This is to be called by the client's 
 *           MDFU Firmware Update Layer when a start transfer command has been received from the MDFU Command Processor Layer
 * @return   Status indicating if the erase operation was successful
 */
static enum MDFU_PARTITION_STATUS Erase(void)
{
    enum MDFU_PARTITION_STATUS status = MDFU_PARTITION_STATUS_SUCCESS;
    
    if(MDFU_INTERNAL_FLASH_BlockErase(MDFU_CONFIG_DOWNLOAD_ORIGIN, MDFU_CONFIG_PARTITION_SIZE) == false)
    { 
        status = MDFU_PARTITION_STATUS_OPERATION_FAILED; 
    }
    
    return status;
}

/**
* @brief    Copy not implemented for this partition.
* @param    struct MDFU_PARTITION const * const - Pointer to the partition to be copied
* @return   Status indicating if the copy operation was successful
*/
static enum MDFU_PARTITION_STATUS Copy(const struct MDFU_PARTITION* source)
{    
    /* Unused parameters */
    (void)source;
    
    return MDFU_PARTITION_STATUS_OPERATION_FAILED;
}

/**
* @brief    Run not implemented for this partition.
* @return   Status indicating run failed not implemented on this partition.
*/
static enum MDFU_PARTITION_STATUS Run(void)
{    
    return MDFU_PARTITION_STATUS_OPERATION_FAILED;
}

/**
 * @brief    Changes the mode of operation of the partition
 * @param    enum MDFU_PARTITION_MODE mode - the mode of operation to set the drive 
 *           into.  This is the logical AND of all of the modes required (of type 
 *           enum MDFU_PARTITION_MODE).  For example:
 *               ModeChange (MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_WRITE);
 * @return   enum MDFU_PARTITION_STATUS - status of the requested mode change
 */
static enum MDFU_PARTITION_STATUS ModeChange(enum MDFU_PARTITION_MODE mode)
{   
    enum MDFU_PARTITION_STATUS status = MDFU_PARTITION_STATUS_MODE_UNSUPPORTED;

    CRITICAL_REGION_Begin();
    
    if(mode == (MDFU_PARTITION_MODE_READ))
    {    
        enum FLASH_REGION_PERMISSION permissions = (FLASH_REGION_PERMISSION_READ_ENABLED);
        status = flashRegion3.permissionsSet(permissions, false) ? MDFU_PARTITION_STATUS_SUCCESS : MDFU_PARTITION_STATUS_LOCKED;
    }
    else if(mode == (enum MDFU_PARTITION_MODE)(MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_WRITE))
    {    
        enum FLASH_REGION_PERMISSION permissions = (FLASH_REGION_PERMISSION_READ_ENABLED & FLASH_REGION_PERMISSION_WRITE_ENABLED);
        status = flashRegion3.permissionsSet(permissions, false) ? MDFU_PARTITION_STATUS_SUCCESS : MDFU_PARTITION_STATUS_LOCKED;
    }
    else if(mode == (enum MDFU_PARTITION_MODE)(MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_LOCKED))
    {    
        enum FLASH_REGION_PERMISSION permissions = (FLASH_REGION_PERMISSION_READ_ENABLED);
        status = flashRegion3.permissionsSet(permissions, true) ? MDFU_PARTITION_STATUS_SUCCESS : MDFU_PARTITION_STATUS_LOCKED;
    }
    else if(mode == (enum MDFU_PARTITION_MODE)(MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_WRITE & MDFU_PARTITION_MODE_LOCKED))
    {           
        enum FLASH_REGION_PERMISSION permissions = (FLASH_REGION_PERMISSION_READ_ENABLED & FLASH_REGION_PERMISSION_WRITE_ENABLED);
        status = flashRegion3.permissionsSet(permissions, true) ? MDFU_PARTITION_STATUS_SUCCESS : MDFU_PARTITION_STATUS_LOCKED;
    }
    else
    {
    }
    
    CRITICAL_REGION_End();
    
    return status;
}

/**
 * @brief      Hashes the requested block of partition memory
 * @param[in]  enum MDFU_PARTITION_HASH_ALGORITHM algorithm - the hash
 *             algorithm to use.  
 *           
 *             If the algorithm passed is not supported by the partition, 
 *             the function will return MDFU_PARTITION_STATUS_INVALID_ARGUMENT
 *           
 *             If there was an error during operation, the function will
 *             return MDFU_PARTITION_STATUS_OPERATION_FAILED
 * @param[in]  uint32_t offset - the starting offset where to start the hash
 * @param[in]  uint32_t length - amount of data to hash
 * @param[out] uint8_t *digest - the output buffer where to store the
 *             resulting digest from the hash operation.  
 * 
 * @return     enum PARTITION_STATUS - status result of the operation
 */
static enum MDFU_PARTITION_STATUS Hash(enum MDFU_PARTITION_HASH_ALGORITHM algorithm, uint32_t offset, uint32_t length, uint8_t *digest) {
    enum MDFU_PARTITION_STATUS returnCode = MDFU_PARTITION_STATUS_OPERATION_FAILED;

    if (!HashIsSupported(algorithm)) {
        returnCode = MDFU_PARTITION_STATUS_INVALID_ARGUMENT;
    } else if (ArgumentsAreInvalid(offset, length, digest)) {
        returnCode = MDFU_PARTITION_STATUS_INVALID_ARGUMENT;
    } else {
        uint8_t* hashAddress = (uint8_t*) (&DOWNLOAD_MEMORY[offset]);
        crypto_Hash_Algo_E cryptoHashAlgorithm = ((algorithm == MDFU_PARTITION_HASH_ALGORITHM_SHA2_384) ? CRYPTO_HASH_SHA2_384 : CRYPTO_HASH_SHA2_512);
        if (Crypto_Hash_Sha_Digest(CRYPTO_HANDLER_HW_INTERNAL, hashAddress, length, digest, cryptoHashAlgorithm, 1U) == CRYPTO_HASH_SUCCESS) {
            returnCode = MDFU_PARTITION_STATUS_SUCCESS;
        }
    }

    return returnCode;
}

/**
 * @brief    Checks if the arguments given for offset length and pointer to data are invalid
 * @param    uint32_t offset - offset into partition should be less than partition length
 * @param    size_t length - Number of bytes should be less than partition length
 * @param    void * pointer - Pointer should be non-null value
 * @return   boolean result of above rules including if values sum to in this partition
 */
static bool ArgumentsAreInvalid(uint32_t offset, uint32_t length, void const * const pointer)
{
    /* This is important to cast/store to a uint32_t for testing to verify any possible
     * roll-over effects of (offset + length) with varying sizes of size_t.
     */
    const uint32_t endOffset = offset + length;

    return  ((NULL == pointer) ||
            (offset >= (uint32_t)MDFU_CONFIG_PARTITION_SIZE) ||
            (length > (uint32_t)MDFU_CONFIG_PARTITION_SIZE) ||
            (endOffset > (uint32_t)MDFU_CONFIG_PARTITION_SIZE));
} 

/**
 * @brief    Checks if the provided algorithm is supported in code
 * @param    enum MDFU_PARTITION_HASH_ALGORITHM algorithm - hash algorithm
 * @return   true if the algorithm is supported otherwise false
 */
static bool HashIsSupported(enum MDFU_PARTITION_HASH_ALGORITHM algorithm)
{
    return (algorithm == MDFU_PARTITION_HASH_ALGORITHM_SHA2_384) || 
            (algorithm == MDFU_PARTITION_HASH_ALGORITHM_SHA2_512);   
}