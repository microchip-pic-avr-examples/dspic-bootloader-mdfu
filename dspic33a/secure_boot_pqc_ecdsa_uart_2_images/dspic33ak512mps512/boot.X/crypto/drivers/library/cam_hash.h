/**************************************************************************
  Crypto Framework Library Source

  Company:
    Microchip Technology Inc.

  File Name:
    cam_hash.h

  Summary:
    Crypto Framework Library interface file for CAM/HSM-Lite Hashing.

  Description:
    This header file contains the interface that make up the CAM/HSM-Lite Hashing hardware
    driver for the Microchip microcontrollers equipped with a Crypto Accelerator Module.
**************************************************************************/
/*
Copyright (C) 2026 Microchip Technology Inc., and its subsidiaries. All rights reserved.

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

/**
 * Crypto Framework Library Source
 * 
 * @file cam_hash.h
 * @defgroup  hash HASH
 * @brief This header file contains the interface that make up the CAM/HSM-Lite Hashing hardware driver for the Microchip microcontrollers equipped with a Crypto Accelerator Module.
 *
 */

#ifndef CAM_HASH_H
#define	CAM_HASH_H

#ifdef __cplusplus  // Provide C++ Compatibility
    extern "C" {
#endif

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include "cam_version.h"
#include "cam_device.h"

// *****************************************************************************
// *****************************************************************************
// Section: HASH Common Data Types
// *****************************************************************************
// *****************************************************************************

/**
 * @ingroup hash
 * @enum HASH_ERROR
 * 
 * This enumeration defines the various error states that can occur during
 * hash operations.
 */
typedef enum HASH_ERROR
{
    HASH_NO_ERROR = 0,                     /**< No error occurred */
    HASH_CONTEXT_ERROR = 1,                /**< Error with the hash context */
    HASH_INVALID_MODE_ERROR = 2,           /**< Invalid hash mode specified */
    HASH_INITIALIZE_ERROR = 6,             /**< Error during initialization */
    HASH_READ_ERROR = 7,                   /**< Error during read operation */
    HASH_UPDATE_ERROR = 8,                 /**< Error during update operation */
    HASH_STATE_ERROR = 9,                  /**< Error with the hash state */
    HASH_EXECUTE_ERROR = 10,               /**< Error during execution */
    HASH_OPERATION_IS_NOT_ACTIVE = 11,     /**< No active hash operation */
    HASH_OPERATION_IS_ACTIVE = 12,         /**< Hash operation is currently active */

    #if defined(CAM_HW_VERSION) && (CAM_HW_VERSION == CAM_06048)

    HASH_CONTEXT_MODE_MISMATCH_ERROR = 13  /**< Context is initialized for a different mode than the API supports */

    #endif

} HASH_ERROR;

/**
 * @ingroup hash
 * @enum HASHCON_MODE
 * 
 * This enumeration defines the various hashing modes supported by the
 * hashing driver.
 */
typedef enum HASHCON_MODE
{
    MODE_SHA1   = 1,     /**< SHA-1 hashing mode */
    MODE_SHA224 = 2,     /**< SHA2-224 hashing mode */
    MODE_SHA256 = 3,     /**< SHA2-256 hashing mode */
    MODE_SHA384 = 4,     /**< SHA2-384 hashing mode */
    MODE_SHA512 = 5,     /**< SHA2-512 hashing mode */

    #if defined(CAM_HW_VERSION) && (CAM_HW_VERSION == CAM_06048)

    MODE_SHA3_224 = 6,   /**< SHA3-224 hashing mode */
    MODE_SHA3_256 = 7,   /**< SHA3-256 hashing mode */
    MODE_SHA3_384 = 8,   /**< SHA3-384 hashing mode */
    MODE_SHA3_512 = 9,   /**< SHA3-512 hashing mode */
    MODE_SHAKE128 = 10,  /**< SHAKE128 hashing mode */
    MODE_SHAKE256 = 11   /**< SHAKE256 hashing mode */

    #endif

} HASHCON_MODE;


// *****************************************************************************
// *****************************************************************************
// Section: SHA Common Interface
// *****************************************************************************
// *****************************************************************************

/**
 * @ingroup hash
 * 
 * This function handles the interrupt service routine for the hash operations.
 * 
 * @return None.
 */
void DRV_CRYPTO_HASH_IsrHelper(void);

/**
 * @ingroup hash
 * 
 * This function initializes a new hash operation with the specified SHA mode.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param mode The HASHCON_MODE to use.
 * @retval HASH_NO_ERROR            Success.
 * @retval HASH_CONTEXT_ERROR       Invalid or corrupted hash context.
 * @retval HASH_INVALID_MODE_ERROR  Unsupported or incorrect hash mode.
 * @retval HASH_INITIALIZE_ERROR    Failure during hash initialization.
 * @note Reinitializing a HASH operation in progress will void the previous operation.
 */
HASH_ERROR DRV_CRYPTO_HASH_Initialize(void *contextData, HASHCON_MODE mode);

/**
 * @ingroup hash
 * 
 * This function adds data to the ongoing SHA hash operation.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param data The data to add to the operation.
 * @param dataLength The length of the data.
 * @retval HASH_NO_ERROR          Success.
 * @retval HASH_CONTEXT_ERROR     Invalid or corrupted hash context.
 * @retval HASH_INITIALIZE_ERROR  Failure during hash initialization.
 * @retval HASH_STATE_ERROR       Invalid or unexpected hash state.
 * @retval HASH_UPDATE_ERROR      Failure while updating the hash.
 * @note A HASH operation must be in progress (initialized by DRV_CRYPTO_HASH_Initialize()).
 */
HASH_ERROR DRV_CRYPTO_HASH_Update(void *contextData, uint8_t *data, uint32_t dataLength);

/**
 * @ingroup hash
 * 
 * This function finalizes the SHA hash operation and generates the digest.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param digest Buffer to contain the digest.
 * @param digestLength The size of the digest buffer.
 * @retval HASH_NO_ERROR          Success.
 * @retval HASH_CONTEXT_ERROR     Invalid or corrupted hash context.
 * @retval HASH_INITIALIZE_ERROR  Failure during hash initialization.
 * @retval HASH_STATE_ERROR       Invalid or unexpected hash state.
 * @retval HASH_EXECUTE_ERROR     Failure during hash execution.
 * @note A hash operation must be in progress (initialized by DRV_CRYPTO_HASH_Initialize()).
 */
HASH_ERROR DRV_CRYPTO_HASH_Final(void *contextData, const uint8_t *digest, uint32_t digestLength);

/**
 * @ingroup hash
 * 
 * This function performs a complete SHA hash operation and generates a digest.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param mode The HASHCON_MODE to use.
 * @param data The data to add to the operation.
 * @param dataLength The length of the data.
 * @param digest Buffer to contain the digest.
 * @param digestLength The size of the digest buffer.
 * @retval HASH_NO_ERROR          Success.
 * @retval HASH_CONTEXT_ERROR     Invalid or corrupted hash context.
 * @retval HASH_INITIALIZE_ERROR  Failure during hash initialization.
 * @retval HASH_STATE_ERROR       Invalid or unexpected hash state.
 * @retval HASH_EXECUTE_ERROR     Failure during hash execution.
 */
HASH_ERROR DRV_CRYPTO_HASH_Digest(void *contextData, HASHCON_MODE mode,
    const uint8_t *data, uint32_t dataLength,
    const uint8_t *digest, uint32_t digestLength);

#if defined(CAM_HW_VERSION) && (CAM_HW_VERSION == CAM_06048)

/**
 * @ingroup hash
 * 
 * This function initializes a new hash operation with the specified SHAKE mode.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param mode The HASHCON_MODE to use.
 * @param digestLength The length of the result SHAKE digest to be generated.
 * @retval HASH_NO_ERROR            Success.
 * @retval HASH_CONTEXT_ERROR       Invalid or corrupted hash context.
 * @retval HASH_INVALID_MODE_ERROR  Unsupported or incorrect hash mode.
 * @retval HASH_INITIALIZE_ERROR    Failure during hash initialization.
 * @note Reinitializing a HASH operation in progress will void the previous operation.
 */
HASH_ERROR DRV_CRYPTO_HASH_SHAKE_Initialize(void *contextData, HASHCON_MODE mode, uint16_t digestLength);

/**
 * @ingroup hash
 * 
 * This function adds data to the ongoing SHAKE hash operation.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param data The data to add to the operation.
 * @param dataLength The length of the data.
 * @retval HASH_NO_ERROR          Success.
 * @retval HASH_CONTEXT_ERROR     Invalid or corrupted hash context.
 * @retval HASH_INITIALIZE_ERROR  Failure during hash initialization.
 * @retval HASH_STATE_ERROR       Invalid or unexpected hash state.
 * @retval HASH_UPDATE_ERROR      Failure while updating the hash.
 * @note A HASH operation must be in progress (initialized by DRV_CRYPTO_HASH_SHAKE_Initialize()).
 */
HASH_ERROR DRV_CRYPTO_HASH_SHAKE_Update(void *contextData, uint8_t *data, uint32_t dataLength);

/**
 * @ingroup hash
 * 
 * This function finalizes the SHAKE hash operation and generates the digest.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param digest Buffer to contain the digest.
 * @retval HASH_NO_ERROR          Success.
 * @retval HASH_CONTEXT_ERROR     Invalid or corrupted hash context.
 * @retval HASH_INITIALIZE_ERROR  Failure during hash initialization.
 * @retval HASH_STATE_ERROR       Invalid or unexpected hash state.
 * @retval HASH_EXECUTE_ERROR     Failure during hash execution.
 * @note A hash operation must be in progress (initialized by DRV_CRYPTO_HASH_SHAKE_Initialize()).
 */
HASH_ERROR DRV_CRYPTO_HASH_SHAKE_Final(void *contextData, const uint8_t *digest);

/**
 * @ingroup hash
 * 
 * This function performs a complete SHAKE hash operation and generates a digest.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param mode The HASHCON_MODE to use.
 * @param data The data to add to the operation.
 * @param dataLength The length of the data.
 * @param digest Buffer to contain the digest.
 * @param digestLength The size of the digest buffer.
 * @retval HASH_NO_ERROR          Success.
 * @retval HASH_CONTEXT_ERROR     Invalid or corrupted hash context.
 * @retval HASH_INITIALIZE_ERROR  Failure during hash initialization.
 * @retval HASH_STATE_ERROR       Invalid or unexpected hash state.
 * @retval HASH_EXECUTE_ERROR     Failure during hash execution.
 */
HASH_ERROR DRV_CRYPTO_HASH_SHAKE_Digest(void *contextData, HASHCON_MODE mode,
    const uint8_t *data, uint32_t dataLength,
    const uint8_t *digest, uint16_t digestLength);

#endif

/**
 * @ingroup hash
 * 
 * This function checks if a hash operation is currently active.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @param active Pointer to value to contain the active/inactive status.
 * @retval HASH_NO_ERROR          Success.
 * @retval HASH_CONTEXT_ERROR     Invalid or corrupted hash context.
 * @retval HASH_INITIALIZE_ERROR  Failure during hash initialization.
 * @note This sets the value pointed to by active to HASH_OPERATION_IS_ACTIVE
 *       or HASH_OPERATION_IS_NOT_ACTIVE.
 */
HASH_ERROR DRV_CRYPTO_HASH_IsActive(void *contextData, HASH_ERROR *active);

/**
 * @ingroup hash
 * 
 * This function retrieves the size of the hash context block.
 * 
 * @param contextData A pointer to the context block that contains the hash context data.
 * @return Size of the hash context block in bytes.
 * @note A NULL \p contextData pointer will return the maximum context block size.
 */
uint32_t DRV_CRYPTO_HASH_GetContextSize(void *contextData);

// *****************************************************************************
// *****************************************************************************
// Section: SHA CAM/HSM-Lite Device Support
// *****************************************************************************
// *****************************************************************************

/** @cond INTERNAL */
/**
 * @ingroup hash
 * @brief Function prototype for the HASH ISR helper.
 * 
 * This function is specific to the currently defined hardware version for the HASH ISR helper.
 * If the hardware version is not defined, this function will not be available.
 */
void MPROTO(DRV_CRYPTO_HASH_IsrHelper)(void);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_IsrHelper
 * @brief Macro to create a device-specific function prototype for the HASH ISR helper.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for the HASH ISR helper.
 */
#define DRV_CRYPTO_HASH_IsrHelper MPROTO(DRV_CRYPTO_HASH_IsrHelper)

/**
 * @ingroup hash
 * @brief Function prototype for the HASH initialization.
 * 
 * This function is specific to the currently defined hardware version for initializing a hash operation.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_Initialize)(void *contextData, HASHCON_MODE mode);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_Initialize
 * @brief Macro to create a device-specific function prototype for the HASH initialization.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for initializing a hash operation.
 */
#define DRV_CRYPTO_HASH_Initialize MPROTO(DRV_CRYPTO_HASH_Initialize)

/**
 * @ingroup hash
 * @brief Function prototype for the HASH update.
 * 
 * This function is specific to the currently defined hardware version for updating a hash operation.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_Update)(void *contextData, uint8_t *data, uint32_t dataLength);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_Update
 * @brief Macro to create a device-specific function prototype for the HASH update.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for updating a hash operation.
 */
#define DRV_CRYPTO_HASH_Update MPROTO(DRV_CRYPTO_HASH_Update)

/**
 * @ingroup hash
 * @brief Function prototype for the HASH finalization.
 * 
 * This function is specific to the currently defined hardware version for finalizing a hash operation.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_Final)(void *contextData, const uint8_t * digest, uint32_t digestLength);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_Final
 * @brief Macro to create a device-specific function prototype for the HASH finalization.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for finalizing a hash operation.
 */
#define DRV_CRYPTO_HASH_Final MPROTO(DRV_CRYPTO_HASH_Final)

/**
 * @ingroup hash
 * @brief Function prototype for the HASH digest.
 * 
 * This function is specific to the currently defined hardware version for generating a hash digest.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_Digest)(void *contextData, HASHCON_MODE mode, const uint8_t *data, 
    uint32_t dataLength, const uint8_t * digest, uint32_t digestLength);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_Digest
 * @brief Macro to create a device-specific function prototype for the HASH digest.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for generating a hash digest.
 */
#define DRV_CRYPTO_HASH_Digest MPROTO(DRV_CRYPTO_HASH_Digest)

/**
 * @ingroup hash
 * @brief Function prototype for checking HASH activity.
 * 
 * This function is specific to the currently defined hardware version for checking if a hash operation is active.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_IsActive)(void *contextData, HASH_ERROR *active);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_IsActive
 * @brief Macro to create a device-specific function prototype for checking HASH activity.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for checking if a hash operation is active.
 */
#define DRV_CRYPTO_HASH_IsActive MPROTO(DRV_CRYPTO_HASH_IsActive)

/**
 * @ingroup hash
 * @brief Function prototype for getting HASH context size.
 * 
 * This function is specific to the currently defined hardware version for retrieving the size of the hash context block.
 * If the hardware version is not defined, this function will not be available.
 */
uint32_t MPROTO(DRV_CRYPTO_HASH_GetContextSize)(void *contextData);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_GetContextSize
 * @brief Macro to create a device-specific function prototype for getting HASH context size.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for retrieving the size of the hash context block.
 */
#define DRV_CRYPTO_HASH_GetContextSize MPROTO(DRV_CRYPTO_HASH_GetContextSize)

#if defined(CAM_HW_VERSION) && (CAM_HW_VERSION == CAM_06048)

/**
 * @ingroup hash
 * @brief Function prototype for the SHAKE HASH initialization.
 * 
 * This function is specific to the currently defined hardware version for initializing a hash operation.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_SHAKE_Initialize)(void *contextData, HASHCON_MODE mode, uint16_t digestLength);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_SHAKE_Initialize
 * @brief Macro to create a device-specific function prototype for the SHAKE HASH initialization.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for initializing a SHAKE hash operation.
 */
#define DRV_CRYPTO_HASH_SHAKE_Initialize MPROTO(DRV_CRYPTO_HASH_SHAKE_Initialize)

/**
 * @ingroup hash
 * @brief Function prototype for the SHAKE HASH update.
 * 
 * This function is specific to the currently defined hardware version for updating a hash operation.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_SHAKE_Update)(void *contextData, uint8_t *data, uint32_t dataLength);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_SHAKE_Update
 * @brief Macro to create a device-specific function prototype for the SHAKE HASH update.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for updating a SHAKE hash operation.
 */
#define DRV_CRYPTO_HASH_SHAKE_Update MPROTO(DRV_CRYPTO_HASH_SHAKE_Update)

/**
 * @ingroup hash
 * @brief Function prototype for the SHAKE HASH finalization.
 * 
 * This function is specific to the currently defined hardware version for finalizing a hash operation.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_SHAKE_Final)(void *contextData, const uint8_t *digest);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_SHAKE_Final
 * @brief Macro to create a device-specific function prototype for the SHAKE HASH finalization.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for finalizing a SHAKE hash operation.
 */
#define DRV_CRYPTO_HASH_SHAKE_Final MPROTO(DRV_CRYPTO_HASH_SHAKE_Final)

/**
 * @ingroup hash
 * @brief Function prototype for the SHAKE HASH digest.
 * 
 * This function is specific to the currently defined hardware version for generating a hash digest.
 * If the hardware version is not defined, this function will not be available.
 */
HASH_ERROR MPROTO(DRV_CRYPTO_HASH_SHAKE_Digest)(void *contextData, HASHCON_MODE mode,
    const uint8_t *data, uint32_t dataLength,
    const uint8_t * digest, uint16_t digestLength);

/**
 * @ingroup hash
 * @def DRV_CRYPTO_HASH_SHAKE_Digest
 * @brief Macro to create a device-specific function prototype for the SHAKE HASH digest.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for generating a SHAKE hash digest.
 */
#define DRV_CRYPTO_HASH_SHAKE_Digest MPROTO(DRV_CRYPTO_HASH_SHAKE_Digest)

#endif
/** @endcond */

#ifdef __cplusplus  // Provide C++ Compatibility
    }
#endif

#endif	/* CAM_HASH_H */