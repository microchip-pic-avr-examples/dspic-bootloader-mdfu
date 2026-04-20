/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    crypto_hash.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
*******************************************************************************/

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

#include "crypto/common_crypto/crypto_common.h"
#include "crypto/common_crypto/crypto_hash.h"
#if defined(ENABLE_CAM_06048_SHA)
#include "crypto/drivers/wrapper/crypto_hash_cam06048_wrapper.h"
#endif

#if defined(ENABLE_CAM_06048_SHAKE)
#include "crypto/drivers/wrapper/crypto_hash_shake_cam06048_wrapper.h"
#endif

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

#define CRYPTO_HASH_SESSION_MAX (1)

// *****************************************************************************
// *****************************************************************************
// Section: Function Definitions
// *****************************************************************************
// *****************************************************************************

#if defined(ENABLE_CAM_06048_SHA)

//SHA-1, SHA-2 and SHA-3 except SHAKE Algorithm
crypto_Hash_Status_E Crypto_Hash_Sha_Digest(crypto_HandlerType_E shaHandler_en, uint8_t *ptr_data, uint32_t dataLen,
                                                uint8_t *ptr_digest, crypto_Hash_Algo_E shaAlgorithm_en,  uint32_t shaSessionId)
{
 	crypto_Hash_Status_E ret_shaStat_en = CRYPTO_HASH_ERROR_NOTSUPPTED;

    if( (ptr_data == NULL) && (dataLen != 0u) )
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_INPUTDATA;
    }
    else if(ptr_digest == NULL)
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_OUTPUTDATA;
    }
    else if( (shaAlgorithm_en <= CRYPTO_HASH_INVALID) || (shaAlgorithm_en >= CRYPTO_HASH_MAX))
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_ALGO;
    }
    else if( (shaSessionId == 0u) || (shaSessionId > (uint32_t)CRYPTO_HASH_SESSION_MAX) )
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_SID;
    }
    else
    {
        switch(shaHandler_en)
        {
            case CRYPTO_HANDLER_HW_INTERNAL:
                ret_shaStat_en = Crypto_Hash_Hw_Sha_Digest((void*)ptr_data, dataLen, ptr_digest, shaAlgorithm_en);
                break;
            default:
                ret_shaStat_en = CRYPTO_HASH_ERROR_HDLR;
                break;
        }
    }
    return ret_shaStat_en;
}

crypto_Hash_Status_E Crypto_Hash_Sha_Init(st_Crypto_Hash_Sha_Ctx *ptr_shaCtx_st, crypto_Hash_Algo_E shaAlgorithm_en, crypto_HandlerType_E shaHandler_en, uint32_t shaSessionId)
{
 	crypto_Hash_Status_E ret_shaStat_en = CRYPTO_HASH_ERROR_NOTSUPPTED;

    if(ptr_shaCtx_st == NULL)
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_CTX;
    }
    else if( (shaAlgorithm_en <= CRYPTO_HASH_INVALID) || (shaAlgorithm_en >= CRYPTO_HASH_MAX))
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_ALGO;
    }
    else if( (shaSessionId == 0u) || (shaSessionId > (uint32_t)CRYPTO_HASH_SESSION_MAX) )
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_SID;
    }
    else
    {
        ptr_shaCtx_st->shaSessionId = shaSessionId;
        ptr_shaCtx_st->shaAlgo_en = shaAlgorithm_en;
        ptr_shaCtx_st->shaHandler_en = shaHandler_en;

        switch(ptr_shaCtx_st->shaHandler_en)
        {
            case CRYPTO_HANDLER_HW_INTERNAL:
                ret_shaStat_en = Crypto_Hash_Hw_Sha_Init((void*)ptr_shaCtx_st->arr_shaDataCtx, ptr_shaCtx_st->shaAlgo_en);
                break;
            default:
                ret_shaStat_en = CRYPTO_HASH_ERROR_HDLR;
                break;
        }
    }
    return ret_shaStat_en;
}

crypto_Hash_Status_E Crypto_Hash_Sha_Update(st_Crypto_Hash_Sha_Ctx *ptr_shaCtx_st, uint8_t *ptr_data, uint32_t dataLen)
{
	crypto_Hash_Status_E ret_shaStat_en = CRYPTO_HASH_ERROR_NOTSUPPTED;

    if(ptr_shaCtx_st == NULL)
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_CTX;
    }
    else if( (ptr_data == NULL) && (dataLen != 0u) )
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_INPUTDATA;
    }
    else
    {
        switch(ptr_shaCtx_st->shaHandler_en)
        {
            case CRYPTO_HANDLER_HW_INTERNAL:
                ret_shaStat_en = Crypto_Hash_Hw_Sha_Update((void*)ptr_shaCtx_st->arr_shaDataCtx, ptr_data, dataLen);
                break;
            default:
                ret_shaStat_en = CRYPTO_HASH_ERROR_HDLR;
                break;
        }
    }
    return ret_shaStat_en;
}

crypto_Hash_Status_E Crypto_Hash_Sha_Final(st_Crypto_Hash_Sha_Ctx *ptr_shaCtx_st, uint8_t *ptr_digest)
{
	crypto_Hash_Status_E ret_shaStat_en = CRYPTO_HASH_ERROR_NOTSUPPTED;

    if(ptr_shaCtx_st == NULL)
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_CTX;
    }
    else if(ptr_digest == NULL)
    {
        ret_shaStat_en = CRYPTO_HASH_ERROR_OUTPUTDATA;
    }
    else
    {
        switch(ptr_shaCtx_st->shaHandler_en)
        {
            case CRYPTO_HANDLER_HW_INTERNAL:
                ret_shaStat_en = Crypto_Hash_Hw_Sha_Final((void*)ptr_shaCtx_st->arr_shaDataCtx, ptr_digest);
                break;
            default:
                ret_shaStat_en = CRYPTO_HASH_ERROR_HDLR;
                break;
        }
    }
    return ret_shaStat_en;
}

#endif

#if defined(ENABLE_CAM_06048_SHAKE)

//SHAKE
crypto_Hash_Status_E Crypto_Hash_Shake_Digest(crypto_HandlerType_E shakeHandlerType_en, crypto_Hash_Algo_E shakeAlgorithm_en,
                                                    uint8_t *ptr_data, uint32_t dataLen, uint8_t *ptr_digest, uint32_t digestLen, uint32_t shakeSessionId)
{
    crypto_Hash_Status_E ret_shakeStat_en = CRYPTO_HASH_ERROR_NOTSUPPTED;

    if( (shakeAlgorithm_en <= CRYPTO_HASH_INVALID) || (shakeAlgorithm_en >= CRYPTO_HASH_MAX))
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_ALGO;
    }
    else if( (ptr_data == NULL) && (dataLen != 0u) )
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_INPUTDATA;
    }
    else if( (ptr_digest == NULL) || (digestLen == 0u) )
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_OUTPUTDATA;
    }
    else if( (shakeSessionId == 0u) || (shakeSessionId > (uint32_t)CRYPTO_HASH_SESSION_MAX) )
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_SID;
    }
    else
    {
        switch(shakeHandlerType_en)
        {
            case CRYPTO_HANDLER_HW_INTERNAL:
                ret_shakeStat_en = Crypto_Hash_Hw_Shake_Digest(ptr_data, dataLen, ptr_digest, digestLen, shakeAlgorithm_en);
                break;
            default:
                ret_shakeStat_en = CRYPTO_HASH_ERROR_HDLR;
                break;
        }
    }
	return ret_shakeStat_en;
}

crypto_Hash_Status_E Crypto_Hash_Shake_Init(st_Crypto_Hash_Shake_Ctx* ptr_shakeCtx_st, crypto_Hash_Algo_E shakeAlgorithm_en,
                                                crypto_HandlerType_E shakeHandlerType_en, uint32_t digestLen, uint32_t shakeSessionId)
{
  	crypto_Hash_Status_E ret_shakeStat_en = CRYPTO_HASH_ERROR_NOTSUPPTED;

    if(ptr_shakeCtx_st == NULL)
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_CTX;
    }
    if( (shakeAlgorithm_en <= CRYPTO_HASH_INVALID) || (shakeAlgorithm_en >= CRYPTO_HASH_MAX))
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_ALGO;
    }
    else if(digestLen == 0u)
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_ARG;
    }
    else if( (shakeSessionId == 0u) || (shakeSessionId > (uint32_t)CRYPTO_HASH_SESSION_MAX) )
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_SID;
    }
    else
    {
        ptr_shakeCtx_st->shakeSessionId = shakeSessionId;
        ptr_shakeCtx_st->shakeAlgo_en = shakeAlgorithm_en;
        ptr_shakeCtx_st->shakeHandler_en = shakeHandlerType_en;
        ptr_shakeCtx_st->digestLen = digestLen;

        switch(ptr_shakeCtx_st->shakeHandler_en)
        {
            case CRYPTO_HANDLER_HW_INTERNAL:
                ret_shakeStat_en = Crypto_Hash_Hw_Shake_Init((void*)ptr_shakeCtx_st->arr_shakeDataCtx, ptr_shakeCtx_st->shakeAlgo_en, ptr_shakeCtx_st->digestLen);
                break;
            default:
                ret_shakeStat_en = CRYPTO_HASH_ERROR_HDLR;
                break;
        }
    }
	return ret_shakeStat_en;
}

crypto_Hash_Status_E Crypto_Hash_Shake_Update(st_Crypto_Hash_Shake_Ctx* ptr_shakeCtx_st, uint8_t *ptr_data, uint32_t dataLen)
{
  	crypto_Hash_Status_E ret_shakeStat_en = CRYPTO_HASH_ERROR_NOTSUPPTED;

    if(ptr_shakeCtx_st == NULL)
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_CTX;
    }
    else if( (ptr_data == NULL) && (dataLen != 0u) )
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_INPUTDATA;
    }
	else
    {
        switch(ptr_shakeCtx_st->shakeHandler_en)
        {
            case CRYPTO_HANDLER_HW_INTERNAL:
                ret_shakeStat_en = Crypto_Hash_Hw_Shake_Update((void*)ptr_shakeCtx_st->arr_shakeDataCtx, ptr_data, dataLen);
                break;
            default:
                ret_shakeStat_en = CRYPTO_HASH_ERROR_HDLR;
                break;
        }
    }
	return ret_shakeStat_en;
}

crypto_Hash_Status_E Crypto_Hash_Shake_Final(st_Crypto_Hash_Shake_Ctx* ptr_shakeCtx_st, uint8_t *ptr_digest)
{
  	crypto_Hash_Status_E ret_shakeStat_en = CRYPTO_HASH_ERROR_NOTSUPPTED;

    if(ptr_shakeCtx_st == NULL)
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_CTX;
    }
    else if(ptr_digest == NULL)
    {
        ret_shakeStat_en = CRYPTO_HASH_ERROR_OUTPUTDATA;
    }
    else
    {
        switch(ptr_shakeCtx_st->shakeHandler_en)
        {
            case CRYPTO_HANDLER_HW_INTERNAL:
                ret_shakeStat_en = Crypto_Hash_Hw_Shake_Final((void*)ptr_shakeCtx_st->arr_shakeDataCtx, ptr_digest);
                break;
            default:
                ret_shakeStat_en = CRYPTO_HASH_ERROR_HDLR;
                break;
        }
    }
	return ret_shakeStat_en;
}
#endif
