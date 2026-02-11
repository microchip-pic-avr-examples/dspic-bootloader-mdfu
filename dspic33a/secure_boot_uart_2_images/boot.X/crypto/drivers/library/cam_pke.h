/**************************************************************************
  Crypto Framework Library Source

  Company:
    Microchip Technology Inc.

  File Name:
    cam_pke.h

  Summary:
    Common enums and structures used with PKE operations.

  Description:
    This header file defines the enumerations and structures for the ECDSA and ECDH  
    hardware drivers for Microchip microcontrollers equipped with a Crypto Accelerator Module.
**************************************************************************/

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

/**
 * Crypto Framework Library Source
 * 
 * @file cam_pke.h
 * @defgroup  pke PKE
 * 
 * @brief This header file defines the enumerations and structures for the ECDSA and ECDH hardware drivers for the Microchip microcontrollers equipped with a Crypto Accelerator Module.
 *
 */

#ifndef CAM_PKE_H
#define	CAM_PKE_H

#ifdef __cplusplus  // Provide C++ Compatibility
    extern "C" {
#endif
    
// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "cam_version.h"
#include "cam_device.h"
#include <stdbool.h>
    
// *****************************************************************************
// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************
// *****************************************************************************

/**
 * @ingroup pke
 * @typedef CRYPTO_PKE_RESULT
 * @brief This enumeration represents the result of the CAM PKE operation.
 */
typedef enum {
    CRYPTO_PKE_RESULT_SUCCESS = 0U,             /**< Operation successful  */
    CRYPTO_PKE_RESULT_INIT_FAIL = 1U,           /**< Initialization failed  */
    CRYPTO_PKE_ERROR_PUBKEYCOMPRESS = 2U,       /**< Public key compression error  */
    CRYPTO_PKE_RESULT_ERROR_CURVE = 3U,         /**< Curve error  */
    CRYPTO_PKE_RESULT_ERROR_RNG = 4U,           /**< RNG error  */
    CRYPTO_PKE_RESULT_ERROR_FAIL = 5U,          /**< General operation failure  */
    CRYPTO_PKE_RESULT_IDLE = 6U,                /**< PKE is ready for a new operation */
    CRYPTO_PKE_RESULT_BUSY = 7U,                /**< PKE operation is in progress */
} CRYPTO_PKE_RESULT;

/**
 * @ingroup pke
 * @typedef PKE_ECC_CURVE
 * @brief This enumeration represents the ECC curves supported by the CAM PKE driver.
 */
typedef enum
{
  NO_CURVE = 0, /**< No curve selected  */
  P256 = 1,    /**< P-256 curve  */
  P384 = 2,    /**< P-384 curve  */
  P521 = 3,    /**< P-521 curve  */
  P192 = 4,    /**< P-192 curve  */
} PKE_ECC_CURVE;

/**
 * @ingroup pke
 * @typedef PKE_OPERATION_TYPE
 * @brief This enumeration represents the operation that triggered an interrupt.
 */
typedef enum
{
    CRYPTO_PKE_OPERATION_VERIFY,
    CRYPTO_PKE_OPERATION_SIGN,
    CRYPTO_PKE_OPERATION_UNKNOWN,
} PKE_OPERATION_TYPE;

/**
 * @ingroup pke
 * @typedef PKE_OPERATIONS
 * @brief This enumeration represents the type of operation that the PKE engine must complete.
 */
typedef enum
{
    DEFAULT,                     /**< Default operation  */
    PKE_CLEAR_MEMORY,           /**< Clear memory operation  */
    ECDSA_SIGNATURE_GENERATION, /**< ECDSA signature generation operation  */
    ECDSA_SIGNATURE_VERIFICATION,/**< ECDSA signature verification operation  */
    ECDH_ECC_MULTIPLY,         /**< ECDH ECC multiplication operation  */
} PKE_OPERATIONS;

/**
 * @ingroup pke
 * @typedef struct PKE_DATA
 * @brief This struct is used to store input/output values.
 */
typedef struct
{
    uint8_t* data; /**< @brief List of values used as an input or output  */
    uint32_t size; /**< @brief Size of the list being stored  */
} PKE_DATA;

/**
 * @ingroup pke
 * @typedef struct PKE_KEY_DATA
 * @brief This struct is used to store key data.
 */
typedef struct
{
    uint8_t* x;    /**< @brief X component of the public key.*/
    uint8_t* y;    /**< @brief Y component of the public key.*/
    uint32_t size; /**< @brief Size of an individual key component.*/
} PKE_KEY_DATA;

/**
 * @ingroup pke
 * @typedef struct PKE_CONFIG
 * @brief This struct stores the inputs and configuration options for the PKE.
 */
typedef struct
{
    PKE_OPERATIONS operation; /**< @brief Operation the PKE needs to compute.*/
    PKE_DATA operand1;        /**< @brief PKE_DATA Input/output value storage for operand 1.*/
    PKE_DATA operand2;        /**< @brief PKE_DATA Input/output value storage for operand 2.*/
    PKE_DATA operand3;        /**< @brief PKE_DATA Input/output value storage for operand 3.*/
    PKE_KEY_DATA publicKey;   /**< @brief PKE_KEY_DATA Public key storage.*/
    uint8_t operandSize;      /**< @brief Size of the input/output operands being used.*/
    PKE_ECC_CURVE curve;      /**< @brief Enum for the curve type being used.*/
} PKE_CONFIG;


// *****************************************************************************
// *****************************************************************************
// Section: PKE Common Interface
// *****************************************************************************
// *****************************************************************************

/**
 * @ingroup pke
 * @brief Resets the interrupt state for the PKE operations.
 * @param None.
 * @return None.
 */
void DRV_CRYPTO_PKE_IsrHelper(void);

/**
 *  @brief Clear the memory stored by the PKE engine.
 **/
void DRV_CRYPTO_PKE_ClearMemory(void);

/**
 *  @brief Sets up the PKE engine to default starting settings.
 *  @note Sets the pkeRam, microcode, memory offsets and additional modulus locations used by the engine.
 **/
void DRV_CRYPTO_PKE_SetupEngine(void);

/**
 *  @brief Non-blocking of the clear memory function.
 **/
void DRV_CRYPTO_PKE_ClearMemory_NoWait(void);

/**
 *  @brief Gets the operation type that was previously set.
 *  @return returns CRYPTO_PKE_OPERATION_VERIFY or CRYPTO_PKE_OPERATION_SIGN based on the operation completed.
 **/
PKE_OPERATION_TYPE DRV_CRYPTO_PKE_OperationCompleteGet(void);

// *****************************************************************************
// *****************************************************************************
// Section: PKE CAM Device Support
// *****************************************************************************
// *****************************************************************************

/** @cond INTERNAL */
/**
 * @ingroup pke
 * @brief Function prototype for the PKE ISR helper.
 * 
 * This function is specific to the currently defined hardware version for the PKE ISR helper.
 * If the hardware version is not defined, this function will not be available.
 */
void MPROTO(DRV_CRYPTO_PKE_IsrHelper)(void);

/**
 * @ingroup pke
 * @def DRV_CRYPTO_PKE_IsrHelper
 * @brief Macro to create a device-specific function prototype.
 * 
 * This macro generates a function prototype that is specific to the
 * currently defined hardware version. It allows the creation of
 * device-specific implementations of the PKE functions based on the
 * defined CAM hardware version.
 */
#define DRV_CRYPTO_PKE_IsrHelper MPROTO(DRV_CRYPTO_PKE_IsrHelper)

/**
 * @ingroup pke
 * @brief Function prototype for the PKE clear memory.
 * 
 * This function is specific to the currently defined hardware version for the PKE Clear Memory.
 * If the hardware version is not defined, this function will not be available.
 */
void MPROTO(DRV_CRYPTO_PKE_ClearMemory)(void);

/**
 * @ingroup pke
 * @def DRV_CRYPTO_PKE_ClearMemory
 * @brief Macro to create a device-specific function prototype.
 * 
 * This macro generates a function prototype that is specific to the
 * currently defined hardware version. It allows the creation of
 * device-specific implementations of the PKE functions based on the
 * defined CAM hardware version.
 */
#define DRV_CRYPTO_PKE_ClearMemory MPROTO(DRV_CRYPTO_PKE_ClearMemory)

/**
 * @ingroup pke
 * @brief Function prototype for the PKE setup engine.
 * 
 * This function is specific to the currently defined hardware version for the PKE setup engine.
 * If the hardware version is not defined, this function will not be available.
 */
void MPROTO(DRV_CRYPTO_PKE_SetupEngine)(void);

/**
 * @ingroup pke
 * @def DRV_CRYPTO_PKE_SetupEngine
 * @brief Macro to create a device-specific function prototype.
 * 
 * This macro generates a function prototype that is specific to the
 * currently defined hardware version. It allows the creation of
 * device-specific implementations of the PKE functions based on the
 * defined CAM hardware version.
 */
#define DRV_CRYPTO_PKE_SetupEngine MPROTO(DRV_CRYPTO_PKE_SetupEngine)

/**
 * @ingroup pke
 * @brief Function prototype for the PKE Clear Memory No Wait.
 * 
 * This function is specific to the currently defined hardware version for the PKE clear memory no wait.
 * If the hardware version is not defined, this function will not be available.
 */
void MPROTO(DRV_CRYPTO_PKE_ClearMemory_NoWait)(void);

/**
 * @ingroup pke
 * @def DRV_CRYPTO_PKE_ClearMemory_NoWait
 * @brief Macro to create a device-specific function prototype.
 * 
 * This macro generates a function prototype that is specific to the
 * currently defined hardware version. It allows the creation of
 * device-specific implementations of the PKE functions based on the
 * defined CAM hardware version.
 */
#define DRV_CRYPTO_PKE_ClearMemory_NoWait MPROTO(DRV_CRYPTO_PKE_ClearMemory_NoWait)

/**
 * @ingroup pke
 * @brief Function prototype for the PKE Clear Memory No Wait.
 * 
 * This function is specific to the currently defined hardware version for the PKE clear memory no wait.
 * If the hardware version is not defined, this function will not be available.
 */
PKE_OPERATION_TYPE MPROTO(DRV_CRYPTO_PKE_OperationCompleteGet)(void);

/**
 * @ingroup pke
 * @def DRV_CRYPTO_PKE_OperationCompleteGet
 * @brief Macro to create a device-specific function prototype.
 * 
 * This macro generates a function prototype that is specific to the
 * currently defined hardware version. It allows the creation of
 * device-specific implementations of the PKE functions based on the
 * defined CAM hardware version.
 */
#define DRV_CRYPTO_PKE_OperationCompleteGet MPROTO(DRV_CRYPTO_PKE_OperationCompleteGet)
/** @endcond */

#ifdef __cplusplus  // Provide C++ Compatibility
    }
#endif

#endif	/* CAM_PKE_H */
