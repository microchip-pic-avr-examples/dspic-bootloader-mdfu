/**************************************************************************
  Crypto Framework Library Source

  Company:
    Microchip Technology Inc.

  File Name:
    crypto_hash_shake_cam06048_wrapper.c

  Summary:
    Crypto Framework Library wrapper file for hardware SHAKE.

  Description:
    This source file contains the wrapper interface to access the SHAKE
    hardware driver for Microchip microcontrollers.
**************************************************************************/

//DOM-IGNORE-BEGIN
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
//DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <string.h>
#include "crypto/drivers/wrapper/crypto_hash_shake_cam06048_wrapper.h"
#include "crypto/drivers/wrapper/crypto_cam06048_wrapper.h"

// *****************************************************************************
// *****************************************************************************
// Section: File scope functions
// *****************************************************************************
// *****************************************************************************

/**
 * @brief Initialize the CAM library's HASH interrupt handlers.
 */
static void lDRV_CRYPTO_HASH_InterruptSetup(void)
{
    (void)Crypto_Int_Hw_Register_Handler(CRYPTO1_INT, DRV_CRYPTO_HASH_IsrHelper);
    (void)Crypto_Int_Hw_Enable(CRYPTO1_INT);
}

// *****************************************************************************
// *****************************************************************************
// Section: SHAKE Hash Algorithms Common Interface Implementation
// *****************************************************************************
// *****************************************************************************

crypto_Hash_Status_E Crypto_Hash_Hw_Shake_GetAlgorithm(crypto_Hash_Algo_E shaAlgorithm, HASHCON_MODE *mode)
{
    crypto_Hash_Status_E status = CRYPTO_HASH_ERROR_FAIL;

    switch(shaAlgorithm)
    {
        case CRYPTO_HASH_SHA3_SHAKE128:
            *mode = MODE_SHAKE128;
            status = CRYPTO_HASH_SUCCESS;
            break;
        case CRYPTO_HASH_SHA3_SHAKE256:
            *mode = MODE_SHAKE256;
            status = CRYPTO_HASH_SUCCESS;
            break;
        default:
            status = CRYPTO_HASH_ERROR_ALGO;
            break;
    }

    return status;
}

crypto_Hash_Status_E Crypto_Hash_Hw_Shake_Init(void *shakeInitCtx,
        crypto_Hash_Algo_E shakeAlgorithm, uint32_t digestLen)
{
    /* MISRA C:2012 Rule 11.5 deviation:
    * Reason: Conversion from void* to the HASH context defined by the
    *         CAM Hardware Driver pre-compiled library is required since
    *         the library does not have access to the upper context structures
    *         defined by the Crypto APIs.
    */
    /* cppcheck-suppress misra-c2012-11.5 */
    CRYPTO_HASH_SHAKE_HW_CONTEXT *shakeCtx = (CRYPTO_HASH_SHAKE_HW_CONTEXT*) shakeInitCtx;
    HASHCON_MODE mode;
    crypto_Hash_Status_E status = CRYPTO_HASH_SUCCESS;
    HASH_ERROR hashStatus = HASH_INITIALIZE_ERROR;

    // CAM 06048 supports a 16-bit value at the hardware level for the digest length.
    if (digestLen > UINT16_MAX)
    {
        status = CRYPTO_HASH_ERROR_INPUTDATA;
    }

    if (status == CRYPTO_HASH_SUCCESS)
    {
        status = Crypto_Hash_Hw_Shake_GetAlgorithm(shakeAlgorithm, &mode);
    }
    
    if (status == CRYPTO_HASH_SUCCESS)
    {
        shakeCtx->algorithm = shakeAlgorithm;
        (void)memset(shakeCtx->contextData, 0, sizeof(shakeCtx->contextData));
        hashStatus = DRV_CRYPTO_HASH_SHAKE_Initialize(shakeCtx->contextData, mode, digestLen);
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

crypto_Hash_Status_E Crypto_Hash_Hw_Shake_Update(void *shakeUpdateCtx,
    uint8_t *data, uint32_t dataLen)
{
   /* MISRA C:2012 Rule 11.5 deviation:
    * Reason: Conversion from void* to the HASH context defined by the
    *         CAM Hardware Driver pre-compiled library is required since
    *         the library does not have access to the upper context structures
    *         defined by the Crypto APIs.
    */
    /* cppcheck-suppress misra-c2012-11.5 */
    CRYPTO_HASH_SHAKE_HW_CONTEXT *shakeCtx = (CRYPTO_HASH_SHAKE_HW_CONTEXT*) shakeUpdateCtx;
    crypto_Hash_Status_E status = CRYPTO_HASH_ERROR_FAIL;
    HASH_ERROR hashStatus;
    HASH_ERROR hashActive;

    hashStatus = DRV_CRYPTO_HASH_IsActive(shakeCtx->contextData, &hashActive);
    if ((hashStatus == HASH_NO_ERROR) && (hashActive == HASH_OPERATION_IS_ACTIVE))
    {
        hashStatus = DRV_CRYPTO_HASH_SHAKE_Update(shakeCtx->contextData, data, dataLen);

        if (hashStatus == HASH_NO_ERROR)
        {
            status = CRYPTO_HASH_SUCCESS;
        }
    }

    return status;
}

crypto_Hash_Status_E Crypto_Hash_Hw_Shake_Final(void *shakeFinalCtx,
    uint8_t *digest)
{
    /* MISRA C:2012 Rule 11.5 deviation:
    * Reason: Conversion from void* to the HASH context defined by the
    *         CAM Hardware Driver pre-compiled library is required since
    *         the library does not have access to the upper context structures
    *         defined by the Crypto APIs.
    */
    /* cppcheck-suppress misra-c2012-11.5 */
    CRYPTO_HASH_SHAKE_HW_CONTEXT *shakeCtx = (CRYPTO_HASH_SHAKE_HW_CONTEXT*) shakeFinalCtx;
    crypto_Hash_Status_E status = CRYPTO_HASH_ERROR_FAIL;
    HASH_ERROR hashStatus;
    HASH_ERROR hashActive;

    hashStatus = DRV_CRYPTO_HASH_IsActive(shakeCtx->contextData, &hashActive);

    if ((hashStatus == HASH_NO_ERROR) && (hashActive == HASH_OPERATION_IS_ACTIVE))
    {
        hashStatus = DRV_CRYPTO_HASH_SHAKE_Final(shakeCtx->contextData, digest);

        if (hashStatus == HASH_NO_ERROR)
        {
            status = CRYPTO_HASH_SUCCESS;
        }
    }

    return status;
}

crypto_Hash_Status_E Crypto_Hash_Hw_Shake_Digest(uint8_t *data, uint32_t dataLen,
    uint8_t *digest, uint32_t digestLen, crypto_Hash_Algo_E shaAlgorithm_en)
{
    HASHCON_MODE mode;
    crypto_Hash_Status_E status = CRYPTO_HASH_SUCCESS;
    CRYPTO_HASH_SHAKE_HW_DIGEST_CONTEXT shakeDigestCtx;

    // CAM 06048 supports a 16-bit value at the hardware level for the digest length.
    if (digestLen > UINT16_MAX)
    {
        status = CRYPTO_HASH_ERROR_INPUTDATA;
    }

    if (status == CRYPTO_HASH_SUCCESS)
    {
        shakeDigestCtx.algorithm = shaAlgorithm_en;
        status = Crypto_Hash_Hw_Shake_GetAlgorithm(shakeDigestCtx.algorithm, &mode);
    }

    if (status == CRYPTO_HASH_SUCCESS)
    {
        HASH_ERROR hashStatus = HASH_INITIALIZE_ERROR;

        lDRV_CRYPTO_HASH_InterruptSetup();

        (void)memset(shakeDigestCtx.contextData, 0, sizeof(shakeDigestCtx.contextData));

        hashStatus = DRV_CRYPTO_HASH_SHAKE_Digest(shakeDigestCtx.contextData, mode, data, dataLen, digest, digestLen);

        if (hashStatus != HASH_NO_ERROR)
        {
            status = CRYPTO_HASH_ERROR_FAIL;
        }
    }

    return status;
}