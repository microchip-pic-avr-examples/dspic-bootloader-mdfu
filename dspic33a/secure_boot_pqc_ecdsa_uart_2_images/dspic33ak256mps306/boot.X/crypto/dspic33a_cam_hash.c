/*
Copyright (C) [2026] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip
    software and any derivatives exclusively with Microchip products.
    You are responsible for complying with 3rd party license terms
    applicable to your use of 3rd party software (including open source
    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.?
    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS
    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,
    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT
    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY
    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S
    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT
    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR
    THIS SOFTWARE.
*/

#include "dspic33a_cam_hash.h"
#include "user_settings.h"

#ifdef dsPIC33A_CAM_ENABLE

#include <string.h>

/*
 * Static squeeze output buffers.
 * One per SHAKE variant, shared across calls (only one active at a
 * time since dilithium uses a single shake object sequentially).
 */
static byte shake128SqueezeBuffer[CAM_SHAKE128_MAX_SQUEEZE_BYTES] __attribute__((aligned(4)));
static byte shake256SqueezeBuffer[CAM_SHAKE256_MAX_SQUEEZE_BYTES] __attribute__((aligned(4)));

/**
 * @brief Perform a complete CAM SHAKE operation (Init -> Update -> Final)
 *        and store the output in the shake object's squeeze buffer.
 *
 * @param shake           SHAKE context (128 or 256)
 * @param algoType        CRYPTO_HASH_SHA3_SHAKE128 or CRYPTO_HASH_SHA3_SHAKE256
 * @param data            Input data (seed) to absorb
 * @param dataLength      Length of input data
 * @param squeezeBuffer   Static buffer to receive the full squeeze output
 * @param squeezeLength   Total bytes to squeeze (must be <= buffer capacity)
 * @return 0 on success, negative on error
 */
static int CAM_ShakeSqueezeFull(wc_Shake* shake,
                                crypto_Hash_Algo_E algoType,
                                const byte* data, word32 dataLength,
                                byte* squeezeBuffer, word32 squeezeLength)
{
    int status;

    status = Crypto_Hash_Shake_Init(&shake->context, algoType,
                                    CRYPTO_HANDLER_HW_INTERNAL,
                                    squeezeLength, 1);
    if (status != (int)CRYPTO_HASH_SUCCESS)
    {
        return WC_HW_E;
    }

    if ((data != NULL) && (dataLength > 0U))
    {
        status = Crypto_Hash_Shake_Update(&shake->context, (byte*)data, dataLength);
        if (status != (int)CRYPTO_HASH_SUCCESS)
        {
            return WC_HW_E;
        }
    }

    status = Crypto_Hash_Shake_Final(&shake->context, squeezeBuffer);
    if (status != (int)CRYPTO_HASH_SUCCESS)
    {
        return WC_HW_E;
    }

    shake->squeezeBuffer       = squeezeBuffer;
    shake->squeezeBufferLength = squeezeLength;
    shake->squeezeBufferOffset = 0;
    shake->absorbReady         = 0;

    return 0;
}

// SHAKE-256 API

int wc_InitShake256(wc_Shake* shake, void* heap, int devId)
{
    int status = BAD_FUNC_ARG;
    if (shake != NULL)
    {
        (void)heap;
        (void)devId;

        shake->squeezeBuffer       = NULL;
        shake->squeezeBufferLength = 0;
        shake->squeezeBufferOffset = 0;
        shake->absorbDataLength    = 0;
        shake->absorbReady         = 0;

        status = Crypto_Hash_Shake_Init(&shake->context,
                                        CRYPTO_HASH_SHA3_SHAKE256,
                                        CRYPTO_HANDLER_HW_INTERNAL,
                                        shake->digestLength, 1);
        if (status != (int)CRYPTO_HASH_SUCCESS)
        {
            status = WC_HW_E;
        }
    }
    return status;
}

int wc_Shake256_Update(wc_Shake* shake, const byte* data, word32 dataLength)
{
    int status = BAD_FUNC_ARG;

    if (shake == NULL)
    {
        return BAD_FUNC_ARG;
    }
    if ((data == NULL) || (dataLength == 0U))
    {
        return 0; // Zero-length update is a no-op (matches standard wolfCrypt behavior)
    }
    status = Crypto_Hash_Shake_Update(&shake->context,
                                      (byte*)data, dataLength);
    if (status != (int)CRYPTO_HASH_SUCCESS)
    {
        status = WC_HW_E;
    }
    return status;
}

int wc_Shake256_Final(wc_Shake* shake, byte* hash, word32 hashLength)
{
    int status = BAD_FUNC_ARG;

    if ((shake != NULL) && (hash != NULL))
    {
        status = Crypto_Hash_Shake_Final(&shake->context, hash);

        if (status == (int)CRYPTO_HASH_SUCCESS)
        {
            status = wc_InitShake256(shake, NULL, INVALID_DEVID);
        }
        else
        {
            status = WC_HW_E;
        }
    }
    return status;
}

/**
 * @brief Absorb data for subsequent SqueezeBlocks calls (SHAKE-256).
 *
 * Strategy 1: Store the seed and defer the CAM call until the first
 * SqueezeBlocks invocation. At that point we execute a single CAM SHAKE
 * operation with the maximum output length and buffer the result.
 */
int wc_Shake256_Absorb(wc_Shake* shake, const byte* data, word32 length)
{
    if ((shake == NULL) || (data == NULL && length != 0))
    {
        return BAD_FUNC_ARG;
    }

    if (length > sizeof(shake->absorbData))
    {
        return BUFFER_E;
    }

    XMEMCPY(shake->absorbData, data, length);
    shake->absorbDataLength    = length;
    shake->absorbReady         = 1;

    shake->squeezeBuffer       = NULL;
    shake->squeezeBufferLength = 0;
    shake->squeezeBufferOffset = 0;

    return 0;
}

/**
 * @brief Squeeze output blocks from the SHAKE-256 sponge state.
 *
 * On the first call after Absorb, this executes the full CAM SHAKE
 * operation with the maximum squeeze output length and buffers the
 * result. Subsequent calls serve data from the buffer.
 */
int wc_Shake256_SqueezeBlocks(wc_Shake* shake, byte* out, word32 blockCount)
{
    int result;
    word32 bytesNeeded;

    if ((shake == NULL) || (out == NULL && blockCount != 0))
    {
        return BAD_FUNC_ARG;
    }

    if (blockCount == 0)
    {
        return 0;
    }

    if (shake->absorbReady)
    {
        result = CAM_ShakeSqueezeFull(shake,
                                      CRYPTO_HASH_SHA3_SHAKE256,
                                      shake->absorbData,
                                      shake->absorbDataLength,
                                      shake256SqueezeBuffer,
                                      CAM_SHAKE256_MAX_SQUEEZE_BYTES);
        if (result != 0)
        {
            return result;
        }
        // absorbReady cleared by CAM_ShakeSqueezeFull
    }

    bytesNeeded = blockCount * CAM_SHAKE256_BLOCK_SIZE;

    if ((shake->squeezeBuffer == NULL) ||
        (shake->squeezeBufferOffset + bytesNeeded > shake->squeezeBufferLength))
    {
        return BUFFER_E;
    }

    XMEMCPY(out, shake->squeezeBuffer + shake->squeezeBufferOffset, bytesNeeded);
    shake->squeezeBufferOffset += bytesNeeded;

    return 0;
}

// SHAKE-128 API

int wc_InitShake128(wc_Shake* shake, void* heap, int devId)
{
    int status = BAD_FUNC_ARG;
    if (shake != NULL)
    {
        (void)heap;
        (void)devId;

        shake->squeezeBuffer       = NULL;
        shake->squeezeBufferLength = 0;
        shake->squeezeBufferOffset = 0;
        shake->absorbDataLength    = 0;
        shake->absorbReady         = 0;

        status = Crypto_Hash_Shake_Init(&shake->context,
                                        CRYPTO_HASH_SHA3_SHAKE128,
                                        CRYPTO_HANDLER_HW_INTERNAL,
                                        shake->digestLength, 1);
        if (status != (int)CRYPTO_HASH_SUCCESS)
        {
            status = WC_HW_E;
        }
    }
    return status;
}

int wc_Shake128_Update(wc_Shake* shake, const byte* data, word32 dataLength)
{
    int status = BAD_FUNC_ARG;
    if (shake == NULL)
    {
        return BAD_FUNC_ARG;
    }
    if ((data == NULL) || (dataLength == 0U))
    {
        return 0; // Zero-length update is a no-op (matches standard wolfCrypt behavior)
    }
    status = Crypto_Hash_Shake_Update(&shake->context,
                                      (byte*)data, dataLength);
    if (status != (int)CRYPTO_HASH_SUCCESS)
    {
        status = WC_HW_E;
    }
    return status;
}

int wc_Shake128_Final(wc_Shake* shake, byte* hash, word32 hashLength)
{
    int status = BAD_FUNC_ARG;
    if ((shake != NULL) && (hash != NULL))
    {
        status = Crypto_Hash_Shake_Final(&shake->context, hash);

        if (status == (int)CRYPTO_HASH_SUCCESS)
        {
            status = wc_InitShake128(shake, NULL, INVALID_DEVID);
        }
        else
        {
            status = WC_HW_E;
        }
    }
    return status;
}

/**
 * @brief Absorb data for subsequent SqueezeBlocks calls (SHAKE-128).
 */
int wc_Shake128_Absorb(wc_Shake* shake, const byte* data, word32 length)
{
    if ((shake == NULL) || (data == NULL && length != 0))
    {
        return BAD_FUNC_ARG;
    }

    if (length > sizeof(shake->absorbData))
    {
        return BUFFER_E;
    }

    XMEMCPY(shake->absorbData, data, length);
    shake->absorbDataLength    = length;
    shake->absorbReady         = 1;

    shake->squeezeBuffer       = NULL;
    shake->squeezeBufferLength = 0;
    shake->squeezeBufferOffset = 0;

    return 0;
}

/**
 * @brief Squeeze output blocks from the SHAKE-128 sponge state.
 */
int wc_Shake128_SqueezeBlocks(wc_Shake* shake, byte* out, word32 blockCount)
{
    int result;
    word32 bytesNeeded;

    if ((shake == NULL) || (out == NULL && blockCount != 0))
    {
        return BAD_FUNC_ARG;
    }

    if (blockCount == 0)
    {
        return 0;
    }

    if (shake->absorbReady)
    {
        result = CAM_ShakeSqueezeFull(shake,
                                      CRYPTO_HASH_SHA3_SHAKE128,
                                      shake->absorbData,
                                      shake->absorbDataLength,
                                      shake128SqueezeBuffer,
                                      CAM_SHAKE128_MAX_SQUEEZE_BYTES);
        if (result != 0)
        {
            return result;
        }
    }

    bytesNeeded = blockCount * CAM_SHAKE128_BLOCK_SIZE;

    if ((shake->squeezeBuffer == NULL) ||
        (shake->squeezeBufferOffset + bytesNeeded > shake->squeezeBufferLength))
    {
        return BUFFER_E;
    }

    XMEMCPY(out, shake->squeezeBuffer + shake->squeezeBufferOffset, bytesNeeded);
    shake->squeezeBufferOffset += bytesNeeded;

    return 0;
}

#endif // dsPIC33A_CAM_ENABLE
