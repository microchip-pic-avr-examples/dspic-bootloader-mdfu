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

#include <stdbool.h>
#include <stdint.h>
#include "ram_execution.h"
#include "mdfu_boot_demo.h"
#include "mdfu_verification.h"
#include "mdfu_command_processor.h"
#include "mdfu_firmware_update.h"
#include "mdfu_transport.h"
#include "mdfu_partition.h"
#include "mdfu_partition_header.h"
#include "mdfu_recovery_authorization.h"
#include "mdfu_partition_executable.h"
#include "mdfu_partition_download.h"
#include "mdfu_partition_boot.h"
#include "mdfu_reset.h"
#include "mdfu_config.h"
#include "critical_region.h"
#include "s3.h"
#include "led0.h"
#include "led1.h"
#include "../mcc_generated_files/uart/uart1.h"

/* Included from the ../mcc_generated_files/system project include path */
#include "interrupt.h"

#ifdef __XC__
#include <xc.h>
#endif

#if (MDFU_BOOT_ENTRY_KEY == 0)
    #error "0 is an invalid boot entry key value."
#endif

static enum MDFU_COMMAND_RESULT status = MDFU_COMMAND_SESSION_WAITING;

#ifdef __XC__
static uint32_t bootEntryKey __attribute__((persistent, address(MDFU_BOOT_ENTRY_KEY_ADDRESS)));
#endif

static bool UserRequestedFirmwareUpdate(void);
static void ExecutableLaunch(void);
static void RAMExecutionDisable(void);
static void BootEntryRequestClear(void);
static bool BootEntryIsRequested(void);
static void PeripheralDeinitialize(void);

static enum MDFU_BOOT_STATE state = MDFU_BOOT_STATE_RESET;

enum MDFU_BOOT_STATE MDFU_BootStateGet(void)
{
    return state;
}

void MDFU_BootDemoInitialize(void)
{ 
    RAMExecutionDisable();
    
    /* Lock the boot partition as executable only. This is important if not
     * using the IRT option to make sure that executable code is unable to
     * write to the boot partition. */    
    if(boot.modeChange(MDFU_PARTITION_MODE_EXECUTABLE & MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_LOCKED) != MDFU_PARTITION_STATUS_SUCCESS)
    {
        MDFU_Reset();
    }
            
    status = MDFU_COMMAND_SESSION_WAITING;
    state = MDFU_BOOT_STATE_RESET;
    LED0_Initialize();
    
    BUTTON_S3_Initialize();
    MDFU_CommandInitialize();
}

void MDFU_BootDemoTasks(void)
{
    switch(state)
    {
        case MDFU_BOOT_STATE_RESET:
            if(UserRequestedFirmwareUpdate() == true) 
            {
                state = MDFU_BOOT_STATE_FIRMWARE_UPDATE_MODE;
            }
            else
            {
                state = MDFU_BOOT_STATE_BOOTING;
            }
            break;
        case MDFU_BOOT_STATE_BOOTING:
            if(MDFU_Verify(&executable) != MDFU_VERIFY_CODE_SUCCESS)
            {
                state = MDFU_BOOT_STATE_RECOVER_FROM_DOWNLOAD;
            }
            else if ((MDFU_BootIsInstallationAllowed() &&
                      MDFU_Verify(&download) == MDFU_VERIFY_CODE_SUCCESS))
            {
                state = MDFU_BOOT_STATE_INSTALL_UPGRADE;
            }
            else
            {
                //Next state if ExecutableLaunch fails BOOT_STATE_RESET
                ExecutableLaunch();
                MDFU_Reset();
            }
            break;
        case MDFU_BOOT_STATE_RECOVER_FROM_DOWNLOAD:
            if((MDFU_RecoveryAuthorized() == true) &&
               (MDFU_Verify(&download) == MDFU_VERIFY_CODE_SUCCESS))
            {
                state = MDFU_BOOT_STATE_INSTALL_UPGRADE;
            }
            else
            {
                state = MDFU_BOOT_STATE_FIRMWARE_UPDATE_MODE; 
            }
            break;
        case MDFU_BOOT_STATE_INSTALL_UPGRADE:
            /* Make the executable partition readable and writable. */
            if(executable.modeChange(MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_WRITE) == MDFU_PARTITION_STATUS_SUCCESS)
            {
                executable.copy(&download); 
                /* Make the executable partition readable to prevent self writes. */
                if (executable.modeChange(MDFU_PARTITION_MODE_READ) != MDFU_PARTITION_STATUS_SUCCESS)
                {
                    MDFU_Reset();
                }
            } 
            state = MDFU_BOOT_STATE_BOOTING;
            break;
        case MDFU_BOOT_STATE_FIRMWARE_UPDATE_MODE:
        default:    
            LED0_On();
            status = MDFU_CommandProcess();
            
            /* If we have completed an update, reset the hardware and attempt
             * to boot the image.  
             *
             * If we have failed an update, reset and attempt to recover.
             */
            if ((status == MDFU_COMMAND_SESSION_COMPLETE) ||
                (status == MDFU_COMMAND_SESSION_FAILED))
            {
                //Next state if failed BOOT_STATE_RESET
                MDFU_Reset();
            }
            break;
    }
}

bool MDFU_BootIsInstallationAllowed(void){
    bool updatePending = false;
    
    /* Default to the lowest possible version in case either version number is
     * unable to be read.
     */
    uint32_t downloadVersion = 0;   
    uint32_t executableVersion = 0;
    
    (void)MDFU_HeaderItemBufferRead(&download, MDFU_PARTITION_HEADER_VERSION_NUMBER, sizeof(uint32_t), &downloadVersion);
    (void)MDFU_HeaderItemBufferRead(&executable, MDFU_PARTITION_HEADER_VERSION_NUMBER, sizeof(uint32_t), &executableVersion);

    if ((downloadVersion > executableVersion) && 
            (MDFU_VerifyPartitionIntegrity(&download) == MDFU_VERIFY_CODE_SUCCESS)) {
        updatePending = true;
    }
    
    return updatePending;
}

static bool UserRequestedFirmwareUpdate(void)
{
    bool executableRequestedBootEntry = BootEntryIsRequested();
    
    /* We have recorded the executable's request to enter boot mode above,
     * clear the entry key so that the next reset will return to the 
     * executable regardless.
     */
    BootEntryRequestClear();
    
    #warning "Update this function to return 'true' when you want to stay in the boot loader, and 'false' when you want to allow a release to the executable code"
 
    /* NOTE: This might be a a push button status on power up, a command from a peripheral, 
     * or whatever is specific to your boot loader implementation */    

    return BUTTON_S3_IsPressed() || executableRequestedBootEntry;
}

static void ExecutableLaunch(void)
{
    if (MDFU_VerifyPartitionIntegrity(&executable) == MDFU_VERIFY_CODE_SUCCESS) 
    {
        /* Make the download partition readable, writeable, and locked. */
        if (download.modeChange(MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_WRITE & MDFU_PARTITION_MODE_LOCKED) != MDFU_PARTITION_STATUS_SUCCESS) 
        {
            //If the download partition fails to go into he correct mode, then reset. This is a security risk.
            MDFU_Reset();
        } 
        else if (executable.modeChange(MDFU_PARTITION_MODE_EXECUTABLE & MDFU_PARTITION_MODE_READ & MDFU_PARTITION_MODE_LOCKED) != MDFU_PARTITION_STATUS_SUCCESS) 
        {
            //If the executable fails to change to the correct mode, then reset. This is a security risk.
            MDFU_Reset();
        } 
        else 
        {
            /* Make sure all peripheral interrupts and global interrupts used by the bootloader are restored to hardware defaults. */
            PeripheralDeinitialize();
            executable.run();
        }
    }
}

static void RAMExecutionDisable(void)
{
    CRITICAL_REGION_Begin();

   /* RAM execution is disabled at this point to prevent the risk of unauthenticated code execution.
    * If your application requires execution from RAM, ensure that all data loaded into RAM is properly
    * authenticated to maintain the Chain of Trust?verifying that all executed code has been authenticated.
    *
    * The BMXIRAML and BMXIRAMH registers specify the lower (inclusive) and upper (exclusive) boundary
    * addresses for instruction RAM. Setting both registers to the same value effectively disables RAM execution.
    * To enforce this configuration, the BMXIRAMLLK and BMXIRAMHLK lock registers are set to 1. Please note
    * that these locks remain active until the next device reset and cannot be cleared via software.
    */
    RAM_EXECUTION_Disable();
    RAM_EXECUTION_Lock();
    
    // If RAM execution disable or lock fails reset.
    if((RAM_EXECUTION_IsDisabled() == false) || (RAM_EXECUTION_IsLocked() == false))
    {
       MDFU_Reset();
    }

    CRITICAL_REGION_End();
}

static bool BootEntryIsRequested(void)
{
    return (MDFU_BOOT_ENTRY_KEY == bootEntryKey);
}

static void BootEntryRequestClear(void)
{
    bootEntryKey = 0;
}

static void PeripheralDeinitialize(void)
{
    CRITICAL_REGION_Begin(); 
    #warning "All interrupt sources and peripherals should be disabled before starting the application.  Add any code required here to disable all interrupts and peripherals used in the bootloader."
    /* NOTE: Before starting the application, all interrupts used
    * by the bootloader must be disabled. Add code here to return
    * the peripherals/interrupts to the reset state before starting
    * the application code. Just disabling the global interrupt bit
    * is not enough. The global interrupt enable bit resets to 
    * enabled, so should be re-enabled while starting the 
    * application. Clear all peripheral interrupt enable and 
    * interrupt flags. Most peripheral interrupt bits are disabled 
    * on reset. All of these should be disabled before starting the 
    * application. Keep in mind that some software stacks may
    * pull in and enable additional peripherals (e.g. - timers). 
    * All peripheral control registers should be returned to as close
    * to the reset state as possible, call the PERIPHERAL_Deinitialize()
    * if available. 
    */
    UART1_Deinitialize();

    CRITICAL_REGION_End();
}
