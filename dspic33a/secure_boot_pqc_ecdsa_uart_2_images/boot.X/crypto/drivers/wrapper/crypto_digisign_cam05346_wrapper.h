/**************************************************************************
  Crypto Framework Library Source

  Company:
    Microchip Technology Inc.

  File Name:
    crypto_digisign_cam05346_wrapper.h

  Summary:
    Crypto Framework Library wrapper file for the digital signature in the 
    hardware cryptographic library.

  Description:
    This header file contains the wrapper interface to access the hardware 
    cryptographic library in Microchip microcontrollers for digital signature.
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

#ifndef CRYPTO_DIGISIGN_CAM05346_WRAPPER_H
#define CRYPTO_DIGISIGN_CAM05346_WRAPPER_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include "crypto/common_crypto/crypto_common.h"
#include "crypto/common_crypto/crypto_digsign.h"
#include "crypto/drivers/wrapper/crypto_cam05346_wrapper.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: DigSign Common Interface 
// *****************************************************************************
// *****************************************************************************

crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_Sign(uint8_t *inputHash, 
    uint32_t hashLen, uint8_t *outSig, uint32_t sigLen, uint8_t *privKey, 
    uint32_t privKeyLen, crypto_EccCurveType_E eccCurveType_En);

crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_Verify(uint8_t *inputHash, 
    uint32_t hashLen, uint8_t *inputSig, uint32_t sigLen, uint8_t *pubKey, 
    uint32_t pubKeyLen, int8_t *hashVerifyStatus, 
    crypto_EccCurveType_E eccCurveType_En);

// *****************************************************************************
// *****************************************************************************
// Section: Non-Blocking Crypto APIS
// *****************************************************************************
// *****************************************************************************

typedef enum
{
    CRYPTO_PROCESS_STARTED,
    CRYPTO_PROCESS_COMPLETE
}crypto_DigiSignState_E;

/**
 * @brief Start the ECDSA signing process using non-blocking functions.
 * @param inputHash       Pointer to the input hash.
 * @param hashLen         Length of the input hash.
 * @param privKey         Pointer to the private key.
 * @param privKeyLen      Length of the private key.
 * @param eccCurveType_En Curve type.
 * @return CRYPTO_DIGISIGN_SUCCESS on successful start. Any other Error on failure.
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_Sign_Start(uint8_t *inputHash, 
    uint32_t hashLen, uint8_t *privKey, uint32_t privKeyLen, 
    crypto_EccCurveType_E eccCurveType_En); 
/**
 * @brief Start the ECDSA verify process using non-blocking functions.
 * @param inputHash       Pointer to the input hash.
 * @param hashLen         Length of the input hash.
 * @param inputSig        Pointer to the input signature.
 * @param sigLen          Length of the input signature.
 * @param pubKey          Pointer to the public key.
 * @param pubKeyLen       Length of the public key.
 * @param eccCurveType_En Curve type.
 * @return CRYPTO_DIGISIGN_SUCCESS on successful start. Any other Error on failure.
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_Verify_Start(uint8_t * inputHash, uint32_t hashLen, 
    uint8_t *inputSig, uint32_t sigLen, uint8_t *pubKey, uint32_t pubKeyLen, 
    crypto_EccCurveType_E eccCurveType_En);

/**
 * @brief Check the status of the signing operation.
 * @return CRYPTO_DIGISIGN_OPERATION_IN_PROGRESS if operation is in progress.
 *         CRYPTO_DIGISIGN_OPERATION_COMPLETED if operation is complete.
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_Sign_GetStatus(void);
/**
 * @brief Check the status of the verification operation.
 * @return CRYPTO_DIGISIGN_OPERATION_IN_PROGRESS if operation is in progress.
 *         CRYPTO_DIGISIGN_OPERATION_COMPLETED if operation is complete.
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_Verify_GetStatus(void);

/**
 * @brief Gets the results of the signature operation.
 * @param outputSig Pointer to an output signature.
 * @param sigLen    Length of the expected signature.
 * @return 
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_Sign_GetResult(uint8_t *outputSig, uint32_t sigLen);
/**
 * @brief Gets the results of the verification operation.
 * @return CRYPTO_DIGISIGN_SUCCESS on successful verification. 
 *         Any other Error code on failure.
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_Verify_GetResult(void);

/**
 * @brief Gets the current state of the wrapper layer. 
 * @return CRYPTO_PROCESS_STARTED if start was called. 
 *         CRYPTO_PROCESS_COMPLETE if get result api was called.
 */
crypto_DigiSignState_E Crypto_DigiSign_Ecdsa_Hw_GetState(void);
/**
 * @brief Sets the state of the wrapper layer.
 * @param State CRYPTO_PROCESS_STARTED if start was called. 
 *              CRYPTO_PROCESS_COMPLETE if get result api was called.
 */
void Crypto_DigiSign_Ecdsa_Hw_SetState(crypto_DigiSignState_E state);

/**
 * @brief Clear Memory removes previous inputs. Used if CRYPTO_DIGISIGN_ERROR_MEMORY is returned from Crypto apis.
 */
void Crypto_DigiSign_Ecdsa_Hw_ClearMemory(void);

/**
 * @brief Get the status of the clear memory operation.
 * @return CRYPTO_DIGISIGN_OPERATION_IN_PROGRESS if operation is in progress.
 *         CRYPTO_DIGISIGN_OPERATION_COMPLETED if operation is complete.
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Hw_ClearMemory_GetStatus(void);

/**
 * @brief Returns the operation type that was completed.
 * @return ECDSA_SIGN or ECDSA_VERIFY or UNKNOWN_OPERATION.
 */
crypto_operation_Id Crypto_DigSign_Ecdsa_Operation(void);
// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END

#endif /* CRYPTO_DIGISIGN_CAM05346_WRAPPER_H */
