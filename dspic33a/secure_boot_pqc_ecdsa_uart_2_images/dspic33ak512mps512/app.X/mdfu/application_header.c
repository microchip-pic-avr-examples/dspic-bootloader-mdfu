/*
    (c) [2024] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS "AS IS." 
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


/* This file puts the executable at the start of the executable partition.
 */

#include <stdint.h>
#include "mdfu_config.h"
#include "mdfu_partition_header.h"

/* WARNING: These structure definitions are not for external use. They are 
 * packed and meant only for program memory storage. For use at run time 
 * values need to be unmarshalled from this packed form to ensure no address 
 * boundary errors occur.
 */
struct __attribute__((packed)) MDFUExecutableHeader{
    struct __attribute__((packed)) {
        uint32_t type;
        uint32_t length;
        uint32_t value;
    } version;
    
    struct __attribute__((packed)){
        uint32_t type;
        uint32_t length;
        uint8_t value[MDFU_CONFIG_HEADER_INTEGRITY_LENGTH];
    } integrity;
    
    struct __attribute__((packed)){
        uint32_t type;
        uint32_t length;
        uint32_t value;
    } dataSize;
    
    struct __attribute__((packed))  {
        uint32_t type;
        uint32_t length;
    } endOfHeader;
};

static const struct MDFUExecutableHeader __attribute__((address(MDFU_CONFIG_EXECUTABLE_HEADER_ORIGIN), space(prog), keep, used)) header = {
    /* TLV Version Number Data
     * 
     * Type - VERSION_NUMBER
     * Length - 4 bytes
     * Value - 32-bit number in the format of:
     *   0x00MMmmpp
     *     MM = Major revision
     *     mm = minor revision
     *     pp = patch revision
     *
     *     e.g. 0x00020A03 = version 2.10.3
     *      see mdfu_config.h
     */
    .version.type = MDFU_PARTITION_HEADER_VERSION_NUMBER,
    .version.length = MDFU_PARTITION_HEADER_VERSION_NUMBER_LENGTH,
    .version.value = MDFU_CONFIG_EXECUTABLE_VERSION_NUMBER,
    
     /* TLV Code Integrity Data
     * 
     * Type - CODE_INTEGRITY
     * Length - Determined by the verification algorithm chosen 
     * Value - The primary integrity check value for the code that must be 
     * verified before execution is allowed. Initialized to 0 to be filled in.  
     */
    .integrity.type = MDFU_PARTITION_HEADER_INTEGRITY,
    .integrity.length = MDFU_CONFIG_HEADER_INTEGRITY_LENGTH,
    .integrity.value = {0},
    
    /* TLV Length of the image data
     * 
     * Type - DATA_SIZE
     * Length - 4 bytes
     * Value - the size of the data portion of the image (excludes signatures and header)
     */
    .dataSize.type = MDFU_PARTITION_HEADER_DATA_SIZE,
    .dataSize.length = MDFU_PARTITION_HEADER_DATA_SIZE_LENGTH,
    .dataSize.value = MDFU_CONFIG_DATA_LENGTH,
    
    /* TLV End of Header
     * 
     * Type - END_OF_HEADER
     * Length - 0
     * Value - Empty. Used to indicate the end of the used header space 
     * has been reached.   
     */
    .endOfHeader.type = MDFU_PARTITION_HEADER_END_OF_HEADER,
    .endOfHeader.length = MDFU_PARTITION_HEADER_END_OF_HEADER_LENGTH    
};
