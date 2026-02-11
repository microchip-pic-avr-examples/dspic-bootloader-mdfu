/**************************************************************************
  Crypto Framework Library Source

  Company:
    Microchip Technology Inc.

  File Name:
    cam_ecdsa.h

  Summary:
    Hardware abstraction layer header.

  Description:
    This header file defines the functions and structures for the CAM ECDSA
    hardware driver for Microchip microcontrollers equipped with a Crypto Accelerator Module.
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
 * @file cam_ecdsa.h
 * @defgroup  ecdsa ECDSA
 * @brief This header file defines the functions and structures for the CAM ECDSA hardware driver for the Microchip microcontrollers equipped with a Crypto Accelerator Module.
 *
 */

#ifndef CAM_ECDSA_H
#define	CAM_ECDSA_H

#ifdef __cplusplus  // Provide C++ Compatibility
    extern "C" {
#endif

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <stdint.h>
#include "cam_pke.h"
#include "cam_version.h"
#include "cam_device.h"

// *****************************************************************************
// *****************************************************************************
// Section: ECDSA Common Interface
// *****************************************************************************
// *****************************************************************************

/**
 * @ingroup ecdsa
 * 
 * This function initializes the ECDSA parameters and sets up the hardware crypto engine
 * for the signature generation.
 * 
 * @param eccData Configuration structure to store ECDSA information.
 * @param inputHash Hash input to use for the signature generation.
 * @param hashLength Length of the Hash input.
 * @param privateKey Private key input for the signature generation.
 * @param privateKeyLength Length of the private key.
 * @param eccCurve ECC curve used for the generation.
 * @retval CRYPTO_PKE_RESULT_SUCCESS  Success.
 * @retval CRYPTO_PKE_RESULT_ERROR_CURVE  Sign initialization failure.
 */
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_InitEccParamsSign(PKE_CONFIG *eccData, uint8_t *inputHash, uint32_t hashLength, uint8_t * privateKey, uint32_t privateKeyLength, PKE_ECC_CURVE eccCurve);

/**
 * @ingroup ecdsa
 * 
 * This function generates a signature based on the initialized ECDSA parameters.
 * 
 * @param eccData Configuration structure to store ECDSA information.
 * @param outputSignature Buffer to contain the signature.
 * @param signatureLength Length of the signature.
 * @retval CRYPTO_PKE_RESULT_SUCCESS  Success.
 * @retval CRYPTO_PKE_RESULT_ERROR_FAIL  Sign operation failure.
 * @note DRV_CRYPTO_ECDSA_InitEccParamsSign must be called before this function can be called.
 */
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_Sign(PKE_CONFIG *eccData, uint8_t * outputSignature, uint32_t signatureLength);

/**
 * @ingroup ecdsa
 * 
 * This function initializes the ECDSA parameters and sets up the hardware crypto engine
 * for the signature verification.
 * 
 * @param eccData Configuration structure to store ECDSA information.
 * @param inputHash Hash input to use for the signature verification.
 * @param hashLength Length of the hash input.
 * @param inputSignature Signature input to verify.
 * @param signatureLength Length of the signature.
 * @param publicKey Public key input for the signature verification.
 * @param publicKeyLength Length of the public key.
 * @param eccCurve ECC curve used for the verification.
 * @retval CRYPTO_PKE_RESULT_SUCCESS   Success.
 * @retval CRYPTO_PKE_RESULT_ERROR_FAIL  Verify initialization failure.
 */
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_InitEccParamsVerify(PKE_CONFIG *eccData, uint8_t *inputHash, 
        uint32_t hashLength, uint8_t *inputSignature, uint32_t signatureLength, uint8_t *publicKey,
        uint32_t publicKeyLength, PKE_ECC_CURVE eccCurve);

/**
 * @ingroup ecdsa
 * 
 * This function verifies the signature based on the initialized ECDSA parameters.
 * 
 * @param eccData Configuration structure to store ECDSA information.
 * @retval CRYPTO_PKE_RESULT_SUCCESS  Success.
 * @retval CRYPTO_PKE_RESULT_ERROR_FAIL  Verify operation failure.
 * @note DRV_CRYPTO_ECDSA_InitEccParamsVerify must be called before this function can be called.
 */
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_Verify(PKE_CONFIG *eccData);

// *****************************************************************************
// *****************************************************************************
// Section: Non-Blocking ECDSA Common Interface
// *****************************************************************************
// *****************************************************************************

/**
 *  @ingroup ecdsa
 * 
 *  @brief Initialize and start the non-blocking ECDSA signature generation process.
 *  @param inputHash Hash input to use for the signature generation.
 *  @param hashLength Length of the hash input.
 *  @param privateKey Public key input for signature generation.
 *  @param privateKeyLength Length of the public key.
 *  @param eccCurve ECC curve used for generation.
 *  @return CRYPTO_PKE_RESULT_SUCCESS on success. CRYPTO_PKE_RESULT_ERROR_FAIL on failure.
 *  @note This function initializes the hardware crypto engine with ECDSA parameters.
 **/
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_Sign_Start(uint8_t *inputHash, 
    uint32_t hashLength, uint8_t *privateKey, uint32_t privateKeyLength, 
    PKE_ECC_CURVE eccCurve);

/**
 *  @ingroup ecdsa
 * 
 *  @brief Initialize and start the non-blocking ECDSA verification process.
 *  @param inputHash Hash input to use for the signature verification.
 *  @param hashLength Length of the hash input.
 *  @param inputSignature Signature input to verify.
 *  @param signatureLength Length of the signature.
 *  @param publicKey Public key input for signature verification.
 *  @param publicKeyLength Length of the public key.
 *  @param eccCurve ECC curve used for verification.
 *  @return CRYPTO_PKE_RESULT_SUCCESS on success.  CRYPTO_PKE_RESULT_ERROR_FAIL on failure.
 **/
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_Verify_Start(uint8_t *inputHash, 
        uint32_t hashLength, uint8_t *inputSignature, uint32_t signatureLength,
        uint8_t *publicKey, uint32_t publicKeyLength, PKE_ECC_CURVE eccCurve);

/**
 *  @ingroup ecdsa
 * 
 *  @brief Returns the signing result.
 *  @param outputSignature Buffer to contain the signature.
 *  @param signatureLength Length of the signature
 *  @return CRYPTO_PKE_RESULT_SUCCESS on success.  CRYPTO_PKE_RESULT_ERROR_FAIL on failure.
 **/
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_Sign_GetResult(uint8_t *outputSignature, uint32_t signatureLength);

/**
 *  @ingroup ecdsa
 * 
 *  @brief Returns the verification result.
 *  @return CRYPTO_PKE_RESULT_SUCCESS on success.  CRYPTO_PKE_RESULT_ERROR_FAIL on failure.
 **/
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_Verify_GetResult(void);

/**
 *  @ingroup ecdsa
 * 
 *  @brief Returns the status of the hardware crypto engine.
 *  @return CRYPTO_PKE_STATUS_IDLE when the operation is complete.  CRYPTO_PKE_STATUS_BUSY when an operation is running.
 **/
CRYPTO_PKE_RESULT DRV_CRYPTO_ECDSA_GetStatus(void);

// *****************************************************************************
// *****************************************************************************
// Section: ECDSA CAM Device Support
// *****************************************************************************
// *****************************************************************************

/** @cond INTERNAL */
/**
 * @ingroup ecdsa
 * @brief Function prototype for initializing ECDSA parameters for signing.
 * 
 * This function is specific to the currently defined hardware version for initializing ECDSA parameters for the signature generation.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_InitEccParamsSign)(PKE_CONFIG *eccData, uint8_t *inputHash, uint32_t hashLength, 
        uint8_t * privateKey, uint32_t privateKeyLength, PKE_ECC_CURVE eccCurve);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_InitEccParamsSign
 * @brief Macro to create a device-specific function prototype for initializing ECDSA parameters for signing.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for initializing ECDSA parameters for the signature generation.
 */
#define DRV_CRYPTO_ECDSA_InitEccParamsSign MPROTO(DRV_CRYPTO_ECDSA_InitEccParamsSign)

/**
 * @ingroup ecdsa
 * @brief Function prototype for generating ECDSA signatures.
 * 
 * This function is specific to the currently defined hardware version for generating ECDSA signatures.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_Sign)(PKE_CONFIG *eccData, uint8_t * outputSignature, uint32_t signatureLength);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_Sign
 * @brief Macro to create a device-specific function prototype for generating ECDSA signatures.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for generating ECDSA signatures.
 */
#define DRV_CRYPTO_ECDSA_Sign MPROTO(DRV_CRYPTO_ECDSA_Sign)

/**
 * @ingroup ecdsa
 * @brief Function prototype for initializing ECDSA parameters for verification.
 * 
 * This function is specific to the currently defined hardware version for initializing ECDSA parameters for the signature verification.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_InitEccParamsVerify)(PKE_CONFIG *eccData, uint8_t *inputHash, uint32_t hashLength, 
        uint8_t *inputSignature, uint32_t signatureLength, uint8_t *publicKey, uint32_t publicKeyLength, PKE_ECC_CURVE eccCurve);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_InitEccParamsVerify
 * @brief Macro to create a device-specific function prototype for initializing ECDSA parameters for the verification.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for initializing ECDSA parameters for the signature verification.
 */
#define DRV_CRYPTO_ECDSA_InitEccParamsVerify MPROTO(DRV_CRYPTO_ECDSA_InitEccParamsVerify)

/**
 * @ingroup ecdsa
 * @brief Function prototype for verifying ECDSA signatures.
 * 
 * This function is specific to the currently defined hardware version for verifying ECDSA signatures.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_Verify)(PKE_CONFIG *eccData);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_Verify
 * @brief Macro to create a device-specific function prototype for verifying ECDSA signatures.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for verifying ECDSA signatures.
 */
#define DRV_CRYPTO_ECDSA_Verify MPROTO(DRV_CRYPTO_ECDSA_Verify)

/**
 * @ingroup ecdsa
 * @brief Function prototype for generating ECDSA signatures.
 * 
 * This function is specific to the currently defined hardware version for verifying ECDSA signatures.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_Sign_Start)(uint8_t *inputHash, uint32_t hashLength, uint8_t *privateKey, uint32_t privateKeyLength, 
        PKE_ECC_CURVE eccCurve);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_Sign_Start
 * @brief Macro to create a device-specific function prototype for signing ECDSA signatures.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for verifying ECDSA signatures.
 */
#define DRV_CRYPTO_ECDSA_Sign_Start MPROTO(DRV_CRYPTO_ECDSA_Sign_Start)

/**
 * @ingroup ecdsa
 * @brief Function prototype for verifying ECDSA signatures.
 * 
 * This function is specific to the currently defined hardware version for verifying ECDSA signatures.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_Verify_Start)(uint8_t *inputHash, uint32_t hashLength, uint8_t *inputSignature,
        uint32_t signatureLength, uint8_t *publicKey, uint32_t publicKeyLength, PKE_ECC_CURVE eccCurve);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_Verify_Start
 * @brief Macro to create a device-specific function prototype for verifying ECDSA signatures.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for verifying ECDSA signatures.
 */
#define DRV_CRYPTO_ECDSA_Verify_Start MPROTO(DRV_CRYPTO_ECDSA_Verify_Start)

/**
 * @ingroup ecdsa
 * @brief Function prototype for generating ECDSA signatures.
 * 
 * This function is specific to the currently defined hardware version for verifying ECDSA signatures.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_Sign_GetResult)(uint8_t *outputSignature, uint32_t signatureLength);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_Sign_GetResult
 * @brief Macro to create a device-specific function prototype for verifying ECDSA signatures.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for verifying ECDSA signatures.
 */
#define DRV_CRYPTO_ECDSA_Sign_GetResult MPROTO(DRV_CRYPTO_ECDSA_Sign_GetResult)

/**
 * @ingroup ecdsa
 * @brief Function prototype for verifying ECDSA signatures.
 * 
 * This function is specific to the currently defined hardware version for verifying ECDSA signatures.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_Verify_GetResult)(void);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_Verify_GetResult
 * @brief Macro to create a device-specific function prototype for verifying ECDSA signatures.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for verifying ECDSA signatures.
 */
#define DRV_CRYPTO_ECDSA_Verify_GetResult MPROTO(DRV_CRYPTO_ECDSA_Verify_GetResult)

/**
 * @ingroup ecdsa
 * @brief Function prototype for ECDSA status.
 * 
 * This function is specific to the currently defined hardware version for verifying ECDSA signatures.
 * If the hardware version is not defined, this function will not be available.
 */
CRYPTO_PKE_RESULT MPROTO(DRV_CRYPTO_ECDSA_GetStatus)(void);

/**
 * @ingroup ecdsa
 * @def DRV_CRYPTO_ECDSA_GetStatus
 * @brief Macro to create a device-specific function prototype for verifying ECDSA signatures.
 * 
 * This macro generates a function prototype specific to the currently defined
 * hardware version for verifying ECDSA signatures.
 */
#define DRV_CRYPTO_ECDSA_GetStatus MPROTO(DRV_CRYPTO_ECDSA_GetStatus)

/** @endcond **/

#ifdef __cplusplus  // Provide C++ Compatibility
    }
#endif

#endif	/* CAM_ECDSA_H */