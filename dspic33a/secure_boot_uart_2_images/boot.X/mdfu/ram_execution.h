/*
Copyright (c) [2012-2024] Microchip Technology Inc.

    All rights reserved.

    You are permitted to use the accompanying software and its derivatives
    with Microchip products. See the Microchip license agreement accompanying
    this software, if any, for additional info regarding your rights and
    obligations.

    MICROCHIP SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT
    WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT
    LIMITATION, ANY WARRANTY OF MERCHANTABILITY, TITLE, NON-INFRINGEMENT
    AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP OR ITS
    LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT, NEGLIGENCE, STRICT
    LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER LEGAL EQUITABLE
    THEORY FOR ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES INCLUDING BUT NOT
    LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES,
    OR OTHER SIMILAR COSTS.

    To the fullest extend allowed by law, Microchip and its licensors
    liability will not exceed the amount of fees, if any, that you paid
    directly to Microchip to use this software.

    THIRD PARTY SOFTWARE:  Notwithstanding anything to the contrary, any
    third party software accompanying this software is subject to the terms
    and conditions of the third party's license agreement.  To the extent
    required by third party licenses covering such third party software,
    the terms of such license will apply in lieu of the terms provided in
    this notice or applicable license.  To the extent the terms of such
    third party licenses prohibit any of the restrictions described here,
    such restrictions will not apply to such third party software.
*/

#ifndef RAM_EXECUTION_H
#define RAM_EXECUTION_H

#include <stdbool.h>

/**
 * @brief    Disables execution from RAM.
 * @return   none
 */
void RAM_EXECUTION_Disable(void);

/**
 * @brief    Locks the RAM execution address registers. 
 * @return   none
 */
void RAM_EXECUTION_Lock(void);

/**
 * @brief    Specifies if RAM execution is currently disabled
 * @return   bool - true is RAM execution is currently disabled
 */
bool RAM_EXECUTION_IsDisabled(void);

/**
 * @brief    Specifies if RAM execution registers are locked
 * @return   bool - true is RAM execution registers are locked
 */
bool RAM_EXECUTION_IsLocked(void);

#endif // RAM_EXECUTION_H