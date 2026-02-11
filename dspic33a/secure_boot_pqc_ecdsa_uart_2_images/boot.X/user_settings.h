/*
� [2025] Microchip Technology Inc. and its subsidiaries.

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

#ifndef _WOLFCRYPT_USER_SETTINGS_H
#define _WOLFCRYPT_USER_SETTINGS_H

    // WolfCrypt Configuration Options
    #define NO_MD5
    #define NO_SHA256
    #define NO_MD4
    #define NO_DSA
    #define NO_OLD_TLS
    #define NO_ASN
    #define WC_NO_HARDEN
    #define NO_FILESYSTEM
    #define WOLFSSL_IGNORE_FILE_WARN
    #define WOLFSSL_NO_MALLOC
    #define WOLFSSL_STATIC_MEMORY
    #define WOLFSSL_STATIC_MEMORY_LEAN

    // WolfCrypt ML-DSA Configuration Options
    #define HAVE_DILITHIUM
    #define WOLFSSL_WC_DILITHIUM
    #define WOLFSSL_DILITHIUM_NO_ASN1
    #define WOLFSSL_DILITHIUM_NO_LARGE_CODE
    #define WOLFSSL_DILITHIUM_SMALL
    #define WOLFSSL_DILITHIUM_NO_ASN1
    #define WOLFSSL_DILITHIUM_ASSIGN_KEY

    #define WOLFSSL_DILITHIUM_VERIFY_SMALL_MEM
    #define WOLFSSL_DILITHIUM_VERIFY_NO_MALLOC

    #define WOLFSSL_DILITHIUM_VERIFY_ONLY
    #define WOLFSSL_DILITHIUM_NO_SIGN

    #define WOLFSSL_SHAKE128
    #define WOLFSSL_SHAKE256
    #define WOLFSSL_SHA3
    
    // dsPIC33A Support
    #ifdef __dsPIC33A__
        #define SIZEOF_LONG_LONG 8
        #define SINGLE_THREADED
    #endif  

#endif
