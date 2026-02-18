/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    crypto_digsign.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "APP_Initialize" and "APP_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "APP_STATES" definition).  Both
    are defined here for convenience.
*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2025 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

#ifndef CRYPTO_DIGSIGN_H
#define CRYPTO_DIGSIGN_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include "crypto_common.h"

typedef enum
{
    CRYPTO_DIGISIGN_ERROR_ALGONOTSUPPTD = -127,
    CRYPTO_DIGISIGN_ERROR_PRIVKEY = -126,
    CRYPTO_DIGISIGN_ERROR_PRIVKEYLEN = -125,
    CRYPTO_DIGISIGN_ERROR_PUBKEY = -124,
    CRYPTO_DIGISIGN_ERROR_PUBKEYCOMPRESS = -123,
    CRYPTO_DIGISIGN_ERROR_PUBKEYLEN = -122,        
    CRYPTO_DIGISIGN_ERROR_HDLR = -121,
    CRYPTO_DIGISIGN_ERROR_INPUTHASH = -120,
    CRYPTO_DIGISIGN_ERROR_SIGNATURE = -119,
    CRYPTO_DIGISIGN_ERROR_SID = -118,  ////session ID Error
    CRYPTO_DIGISIGN_ERROR_ARG = -117,
    CRYPTO_DIGISIGN_ERROR_CURVE = -116, 
    CRYPTO_DIGISIGN_ERROR_RNG = -115, 
    CRYPTO_DIGISIGN_ERROR_MASKHASHTYPE = -114,        
    CRYPTO_DIGISIGN_ERROR_FAIL = -113,
    CRYPTO_DIGISIGN_ERROR_RSAPADDING = -112,
    CRYPTO_DIGISIGN_ERROR_INPUTDATA = -111,
    CRYPTO_DIGISIGN_ERROR_MEMORY = -110,
    CRYPTO_DIGISIGN_ERROR_OPERATION_INCOMPLETE = -109,
    CRYPTO_DIGISIGN_ERROR_NO_OPERATION_REQUESTED = -108,
    CRYPTO_DIGISIGN_SUCCESS = 0,     
    CRYPTO_DIGISIGN_OPERATION_IN_PROGRESS = 1,
    CRYPTO_DIGISIGN_OPERATION_COMPLETED = 2,
    CRYPTO_DIGISIGN_PKE_BUSY = 3,
}crypto_DigiSign_Status_E;

crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Sign(crypto_HandlerType_E ecdsaHandlerType_en, uint8_t *ptr_inputHash, uint32_t hashLen, uint8_t *ptr_outSig, 
                                                    uint32_t sigLen, uint8_t *ptr_privKey, uint32_t privKeyLen, 
                                                    crypto_EccCurveType_E eccCurveType_En, uint32_t ecdsaSessionId);

crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Verify(crypto_HandlerType_E ecdsaHandlerType_en, uint8_t *ptr_inputHash, uint32_t hashLen, 
                                                        uint8_t *ptr_inputSig, uint32_t sigLen, uint8_t *ptr_pubKey, uint32_t pubKeyLen,
                                                        int8_t *ptr_sigVerifyStat, crypto_EccCurveType_E eccCurveType_En, uint32_t ecdsaSessionId);




// *****************************************************************************
// *****************************************************************************
// Section: Non-Blocking Crypto APIS
// *****************************************************************************
// *****************************************************************************

/**
 * Example usages:
 * 1. Call the Start function (ex: Crypto_DigiSign_Ecdsa_Sign_Start(CRYPTO_HANDLER_HW_INTERNAL, &inputHash, sizeof(inputHash), &privKey, sizeof(privKeyLen), CRYPTO_ECC_CURVE_P256, 1))
 * 2. Wait for the operation to complete. There are two options to do so:
 * 2.1. Poll the GetStatus function(Crypto_DigiSign_Ecdsa_Sign_GetStatus() == CRYPTO_DIGISIGN_OPERATION_IN_PROGRESS) 
 * 2.2. use SignOperationCompleteCallbackRegister(handler) within wrapper file.
 * 3. When the operation is complete call the GetResult function (ex: Crypto_DigiSign_Ecdsa_Sign_GetResult(&outputSig, {expected size of the signature})
 * 
 * Disclaimer: Call GetResult after the Start function otherwise the Crypto_DigiSign_Ecdsa_Hw_ClearMemory(void)function within the digisign wrapper will need to be called.
 */ 

/**
 * @brief Non-blocking call to start ECDSA signing operation.
 * @param ecdsaHandlerType_en Only CRYPTO_HANDLER_HW_INTERNAL supported currently.
 * @param ptr_inputHash Pointer to the input hash to sign with.
 * @param hashLen Length of the input hash.
 * @param ptr_privKey Pointer to the private key to sign with.
 * @param privKeyLen Length of the private key.
 * @param eccCurveType_En Type of curve being used.
 * @param ecdsaSessionId ID to track sessions. Currently one session supported.
 * @return CRYPTO_DIGISIGN_SUCCESS on success. Error enum on failure. 
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Sign_Start(crypto_HandlerType_E ecdsaHandlerType_en, uint8_t *ptr_inputHash, uint32_t hashLen, uint8_t *ptr_privKey, 
                                                            uint32_t privKeyLen, crypto_EccCurveType_E eccCurveType_En, uint32_t ecdsaSessionId);

/**
 * @brief Non-blocking call to start ECDSA verification operation.
 * @param ecdsaHandlerType_en Only CRYPTO_HANDLER_HW_INTERNAL supported currently.
 * @param ptr_inputHash Pointer to the input hash to sign with.
 * @param hashLen Length of the input hash.
 * @param ptr_inputSig Pointer to the input signature.
 * @param sigLen Length of the input signature.
 * @param ptr_pubKey Pointer to the public key to verify with.
 * @param pubKeyLen Length of the public key.
 * @param eccCurveType_En Type of curve being used.
 * @param ecdsaSessionId ID to track sessions. Currently one session supported.
 * @return CRYPTO_DIGISIGN_SUCCESS on success. Error enum on failure. 
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Verify_Start(crypto_HandlerType_E ecdsaHandlerType_en, uint8_t *ptr_inputHash, uint32_t hashLen, uint8_t *ptr_inputSig, 
                                                           uint32_t sigLen, uint8_t *ptr_pubKey, uint32_t pubKeyLen, crypto_EccCurveType_E eccCurveType_En, uint32_t ecdsaSessionId);

/**
 * @brief Check the status of the ECDSA Signing operation.
 * @return CRYPTO_DIGISIGN_OPERATION_IN_PROGRESS if the operation is in progress. 
 *         CRYPTO_DIGISIGN_OPERATION_COMPLETED if complete.
 */
crypto_DigiSign_Status_E  Crypto_DigiSign_Ecdsa_Sign_GetStatus(void);

/**
 * @brief Check the status of the ECDSA Verification operation.
 * @return CRYPTO_DIGISIGN_OPERATION_IN_PROGRESS if the operation is in progress. 
 *         CRYPTO_DIGISIGN_OPERATION_COMPLETED if complete.
 */
crypto_DigiSign_Status_E  Crypto_DigiSign_Ecdsa_Verify_GetStatus(void);

/**
 * @brief Get the generated ECDSA signature.
 * @param ptr_outputSig Pointer to write the signature to.
 * @param sigLen Length of the expected signature.
 * @return CRYPTO_DIGISIGN_SUCCESS on success. 
 *         CRYPTO_DIGISIGN_ERROR_FAIL on operation failure.
 *         CRYPTO_DIGISIGN_ERROR_SIGNATURE on error. 
 *         CRYPTO_DIGISIGN_ERROR_OPERATION_INCOMPLETE if operation in progress still.
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Sign_GetResult(uint8_t *ptr_outputSig, uint32_t sigLen);

/**
 * @brief Check the result of the ECDSA verification operation.
 * @return CRYPTO_DIGISIGN_SUCCESS on success. 
 *         CRYPTO_DIGISIGN_ERROR_FAIL on failure.
 *         CRYPTO_DIGISIGN_ERROR_OPERATION_INCOMPLETE if operation in progress still.
 */
crypto_DigiSign_Status_E Crypto_DigiSign_Ecdsa_Verify_GetResult(void);

/**
 * @brief Sets the callback function to be called when signature generation is complete.
 * @param handler Pointer to a function with no arguments that will be called when a signature
 *                generation complete interrupt occurs.
 */
void Crypto_DigiSign_Ecdsa_SignComplete_CallbackRegister(void (*handler)(void));

/**
 * @brief Sets the callback function to be called when the verification is complete.
 * @param handler Pointer to a function with no arguments that will be called when a verification
 *                operation complete interrupt occurs.
 */
void Crypto_DigiSign_Ecdsa_VerifyComplete_CallbackRegister(void (*handler)(void));
#endif /* CRYPTO_DIGSIGN_H */
