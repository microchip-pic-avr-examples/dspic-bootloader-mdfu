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

#ifndef DSPIC33A_CAM_HASH_H
#define DSPIC33A_CAM_HASH_H

#ifdef __cplusplus
extern "C" {
#endif

#include "common_crypto/crypto_hash.h"
#include "wolfssl/wolfssl/wolfcrypt/error-crypt.h"
#include <wolfssl/wolfcrypt/sha3.h>
#include "wolfssl/wolfssl/wolfcrypt/types.h"

/* Maximum squeeze buffer sizes per SHAKE variant.
 * These cover the worst-case rejection sampling in ML-DSA with margin:
 *   SHAKE-128 ExpandA: 5 initial + up to 5 extra = 10 blocks x 168 = 1680 bytes
 *   SHAKE-256 ExpandS/ExpandMask: 5 initial + up to 2 extra = 7 blocks x 136 = 952 bytes
 * Increase these if BUFFER_E errors occur during squeeze operations.
 */
#define CAM_SHAKE128_MAX_SQUEEZE_BLOCKS  (10U)
#define CAM_SHAKE256_MAX_SQUEEZE_BLOCKS  (7U)
#define CAM_SHAKE128_BLOCK_SIZE          (WC_SHA3_128_COUNT * 8U)
#define CAM_SHAKE256_BLOCK_SIZE          (WC_SHA3_256_COUNT * 8U)
#define CAM_SHAKE128_MAX_SQUEEZE_BYTES   (CAM_SHAKE128_MAX_SQUEEZE_BLOCKS * CAM_SHAKE128_BLOCK_SIZE)
#define CAM_SHAKE256_MAX_SQUEEZE_BYTES   (CAM_SHAKE256_MAX_SQUEEZE_BLOCKS * CAM_SHAKE256_BLOCK_SIZE)

#ifdef __cplusplus
}
#endif

#endif // DSPIC33A_CAM_HASH_H

