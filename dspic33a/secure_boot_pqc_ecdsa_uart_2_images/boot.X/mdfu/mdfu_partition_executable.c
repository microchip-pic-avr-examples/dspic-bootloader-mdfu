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
#include "mdfu_partition_executable.h"
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

#if ((MDFU_CONFIG_EXECUTABLE_DATA_ORIGIN % 0x40U) != 0)
#error "The executable partition start address/the IVTBASE address must be "  "0x40U" " aligned. \
Refer to the Register Summary and the Interrupt Vector Base Address Register sections in the datasheet for details. https://www.microchip.com/en-us/product/dsPIC33AK128MC106#Documentation"
#endif

#if ((MDFU_CONFIG_EXECUTABLE_HEADER_ORIGIN + MDFU_CONFIG_HEADER_LENGTH) != MDFU_CONFIG_EXECUTABLE_DATA_ORIGIN)
#error "The exectuable partition header must immediately follow the executable partition header verification value. Please adjust the header address or the header verification address."
#endif

#ifndef EXECUTABLE_MEMORY
#define EXECUTABLE_MEMORY executableMemory
static uint8_t executableMemory[MDFU_CONFIG_PARTITION_SIZE] __attribute__((address(MDFU_CONFIG_EXECUTABLE_ORIGIN), space(prog), noload));
#endif

/* Used by the test harness, ignored in production */
#ifndef USER_EXECUTABLE_VALUE
#define USER_EXECUTABLE_VALUE
#endif

#define MAX_COPY_BUFFER_LENGTH MDFU_CONFIG_MAX_COMMAND_DATA_LENGTH

extern const struct FLASH_REGION flashRegion2;

static size_t Read(uint32_t offset, size_t length, void *buffer);
static enum MDFU_PARTITION_STATUS Write(uint32_t address, size_t length, uint8_t const *const data);
static enum MDFU_PARTITION_STATUS Erase(void);
static enum MDFU_PARTITION_STATUS Copy(const struct MDFU_PARTITION *source);
static enum MDFU_PARTITION_STATUS Run(void);
static enum MDFU_PARTITION_STATUS ModeChange(enum MDFU_PARTITION_MODE mode);
static enum MDFU_PARTITION_STATUS Hash(enum MDFU_PARTITION_HASH_ALGORITHM algorithm, uint32_t offset, uint32_t length, uint8_t *digest);
static bool ArgumentsAreInvalid(uint32_t offset, uint32_t length, void const * const pointer);
static bool HashIsSupported(enum MDFU_PARTITION_HASH_ALGORITHM algorithm);

const struct MDFU_PARTITION executable = {
    .read = &Read,
    .write = &Write,
    .erase = &Erase,
    .copy = &Copy,
    .run = &Run,
    .modeChange = &ModeChange,
    .hash = &Hash};

extern enum MDFU_PARTITION_STATUS EXECUTABLE_ReadOnly(void);
extern enum MDFU_PARTITION_STATUS EXECUTABLE_ReadWrite(void);
extern enum MDFU_PARTITION_STATUS EXECUTABLE_Executable(void);

/* Hardware specific implementations */
#ifdef __XC__
static inline void IVT_Relocate(void *ivt)
{
    __builtin_setIVTBASE(ivt);
}

static inline void IRT_Disable(void)
{
    IRTCTRLbits.DONE = 1;
}
#endif

/**
 * @brief    Reads the specified memory from the executable partition
 * @param    uint32_t offset - offset into the partition to start reading from
 * @param    size_t length - amount of data to read from partition
 * @param    void* buffer - pointer to where to write the data that is read
 * @return   size_t - the amount of data actually read
 */
static size_t Read(uint32_t offset, size_t length, void *buffer)
{
    size_t actualLength = length;
            
    if(ArgumentsAreInvalid(offset, length, buffer))
    {
        actualLength = 0;
    } 
    else 
    {
        (void)memcpy(buffer, &EXECUTABLE_MEMORY[offset], actualLength);
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
static enum MDFU_PARTITION_STATUS Write(uint32_t offset, size_t length, uint8_t const *const data)
{
    enum MDFU_PARTITION_STATUS status;

    if (ArgumentsAreInvalid(offset, length, data))
    {
        status = MDFU_PARTITION_STATUS_INVALID_ARGUMENT;
    }
    else if (MDFU_INTERNAL_FLASH_Write(MDFU_CONFIG_EXECUTABLE_ORIGIN + offset, length, data))
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
 * @brief    Erases the entire executable partition in preparation for write operations. This is to be called by the client's
 *           MDFU Firmware Update Layer when a start transfer command has been received from the MDFU Command Processor Layer
 * @return   Status indicating if the erase operation was successful
 */
static enum MDFU_PARTITION_STATUS Erase(void)
{
    enum MDFU_PARTITION_STATUS status = MDFU_PARTITION_STATUS_SUCCESS;

    if (MDFU_INTERNAL_FLASH_BlockErase(MDFU_CONFIG_EXECUTABLE_ORIGIN, MDFU_CONFIG_PARTITION_SIZE) == false)
    {
        status = MDFU_PARTITION_STATUS_OPERATION_FAILED;
    }

    return status;
}

/**
 * @brief    Copy takes the content of the source partition and copies it into this partition.
 * @param    struct MDFU_PARTITION const * const - Pointer to the partition to be copied
 * @return   Status indicating if the copy operation was successful
 */
static enum MDFU_PARTITION_STATUS Copy(const struct MDFU_PARTITION *source)
{
    enum MDFU_PARTITION_STATUS status = MDFU_PARTITION_STATUS_OPERATION_FAILED;
    uint32_t copyOffset = 0;
    uint8_t copyBuffer[MAX_COPY_BUFFER_LENGTH];
    uint32_t readSize = MAX_COPY_BUFFER_LENGTH;

    if (source == NULL)
    {
        status = MDFU_PARTITION_STATUS_INVALID_ARGUMENT;
    }
    else
    {
        status = Erase();
        while ((status == MDFU_PARTITION_STATUS_SUCCESS) &&
               (copyOffset < MDFU_CONFIG_PARTITION_SIZE) &&
               (readSize > 0UL))
        {
            readSize = source->read(copyOffset, readSize, &copyBuffer);
            if (readSize > 0UL)
            {
                status = Write(copyOffset, readSize, copyBuffer);
                copyOffset = copyOffset + readSize;
            }
        }
    }

    // Check if full copy completed successfully
    if ((status == MDFU_PARTITION_STATUS_SUCCESS) &&
        (copyOffset != MDFU_CONFIG_PARTITION_SIZE))
    {
        status = MDFU_PARTITION_STATUS_OPERATION_FAILED;
    }

    return status;
}

/**
 * @brief    Run will attempt to switch from the current bootloader to running the image stored
 *           in this partition.
 * @return   Status indicating if the run failed.
 */
static enum MDFU_PARTITION_STATUS Run(void)
{
    /*
     * Declare a file-scoped, constant, volatile function pointer named
     * 'user_executable', and a file-scoped, constant, volatile void pointer
     * named 'ivtLocation'. These pointers are set to the program memory (flash)
     * address defined by MDFU_CONFIG_EXECUTABLE_DATA_ORIGIN, which is the entry
     * point of the executable partition, and the location of the executable IVT. 
     * The 'space(prog)' attribute specifies that the pointer refers to program
     * memory (flash), not data memory (RAM).
     * The 'noload' attribute instructs the linker not to initialize this
     * variable at startup.
     * The USER_EXECUTABLE_VALUE attribute is used by the test harness and is not
     * use in production enviornment.
     *
     * By calling 'user_executable()', the bootloader transfers execution to the
     * user application.
     */
    static void (*volatile const user_executable)(void) __attribute__((address(MDFU_CONFIG_EXECUTABLE_DATA_ORIGIN), space(prog), noload)) USER_EXECUTABLE_VALUE;
    static void *volatile const ivtLocation __attribute__((address(MDFU_CONFIG_EXECUTABLE_DATA_ORIGIN), space(prog), noload)) USER_EXECUTABLE_VALUE;

    /* Update the location of the interrupt vector table. */
    IVT_Relocate(ivtLocation);

    /* Disable IRT access before transferring control to the executable.
    *
    * NOTE: The datasheet advises that the IRT should not fetch memory from a non-IRT
    * section before the DONE bit is set. To achieve this, it recommends placing
    * at least a 32-byte buffer between the executable IRT section and any
    * executable non-IRT sections. The keystore, although classified as IRT, is
    * non-executable and thus serves as the recommended buffer. */
    IRT_Disable();

    user_executable();

    /* We should never reach this so report a failure. */
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

    if (mode == (enum MDFU_PARTITION_MODE)(MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_WRITE))
    {
        enum FLASH_REGION_PERMISSION permissions = (FLASH_REGION_PERMISSION_READ_ENABLED & FLASH_REGION_PERMISSION_WRITE_ENABLED);
        status = flashRegion2.permissionsSet(permissions, false) ? MDFU_PARTITION_STATUS_SUCCESS : MDFU_PARTITION_STATUS_LOCKED;
    }
    else if (mode == (enum MDFU_PARTITION_MODE)(MDFU_PARTITION_MODE_EXECUTABLE & MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_LOCKED))
    {
        enum FLASH_REGION_PERMISSION permissions = (FLASH_REGION_PERMISSION_EXECUTION_ENABLED & FLASH_REGION_PERMISSION_READ_ENABLED);
        status = flashRegion2.permissionsSet(permissions, true) ? MDFU_PARTITION_STATUS_SUCCESS : MDFU_PARTITION_STATUS_LOCKED;
    }
    else if (mode == (enum MDFU_PARTITION_MODE)(MDFU_PARTITION_MODE_READ))
    {
        enum FLASH_REGION_PERMISSION permissions = (FLASH_REGION_PERMISSION_READ_ENABLED);
        status = flashRegion2.permissionsSet(permissions, false) ? MDFU_PARTITION_STATUS_SUCCESS : MDFU_PARTITION_STATUS_LOCKED;
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
        uint8_t *hashAddress = (uint8_t*) (&EXECUTABLE_MEMORY[offset]);
        crypto_Hash_Algo_E cryptoHashAlgorithm = (algorithm == MDFU_PARTITION_HASH_ALGORITHM_SHA2_384 ? CRYPTO_HASH_SHA2_384 : CRYPTO_HASH_SHA2_512);
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
            (offset >= MDFU_CONFIG_PARTITION_SIZE) ||
            (length > MDFU_CONFIG_PARTITION_SIZE) ||
            (endOffset > MDFU_CONFIG_PARTITION_SIZE));
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
