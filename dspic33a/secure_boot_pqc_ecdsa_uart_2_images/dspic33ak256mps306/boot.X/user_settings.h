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

#ifndef USER_SETTINGS_H
#define USER_SETTINGS_H

    // WolfCrypt Configuration Options
    #define NO_MD5                              // Disable MD5 related APIs
    #define NO_SHA256                           // Disable SHA256 related APIs
    #define NO_MD4                              // Disable MD4 related APIs
    #define NO_OLD_TLS                          // Disable settings for TLS protocol versions less than 1.2
    #define NO_ASN                              // Disable ASN related APIs
    #define WC_NO_HARDEN                        // Disable security countermeasures in wolfCrypt related to protecting against side-channel attacks
    #define NO_FILESYSTEM                       // Specify device does not use a filesystem
    #define WOLFSSL_IGNORE_FILE_WARN            // Disable warning regarding inlined misc.c functions
    #define WOLFSSL_NO_MALLOC                   // Disable usage of dynamic memory allocation

    // WolfCrypt ML-DSA Configuration Options
    #define HAVE_DILITHIUM                      // Enable ML-DSA specific APIs
    #define WOLFSSL_WC_DILITHIUM                // Enable ML-DSA specific APIs
    #define WOLFSSL_DILITHIUM_NO_ASN1           // Disable ASN1 standard usage
    #define WOLFSSL_DILITHIUM_NO_LARGE_CODE     // Reduce the code size and increase speed
    #define WOLFSSL_DILITHIUM_SMALL             // Reduce the code size
    
    #define WOLFSSL_DILITHIUM_ASSIGN_KEY        // Enable key structure usage
    #define WOLFSSL_DILITHIUM_ALIGNMENT 4       // Set the data alignment to a 4 byte boundary
    #define WOLFSSL_DILITHIUM_VERIFY_SMALL_MEM  // Reduce memory usage for verify APIs
    #define WOLFSSL_DILITHIUM_VERIFY_NO_MALLOC  // Disable heap usage for verify

    #define WOLFSSL_DILITHIUM_VERIFY_ONLY       // Enable ML-DSA verify only
    #define WOLFSSL_DILITHIUM_NO_SIGN           // Disable ML-DSA signing

    #define WOLFSSL_SHAKE128                    // Enable SHAKE128 APIs
    #define WOLFSSL_SHAKE256                    // Enable SHAKE256 APIs
    #define WOLFSSL_SHA3                        // Enable SHA3 APIs
    
    // dsPIC33A Support
    #ifdef __dsPIC33A__
        #define dsPIC33A_CAM_ENABLE             // Enable CAM Hardware usage with the dsPIC33A
        #define SIZEOF_LONG_LONG 8              // Define long long value size as 8 bytes
        #define SINGLE_THREADED                 // Specify device is single threaded
    #endif  

#endif /* USER_SETTINGS_H */