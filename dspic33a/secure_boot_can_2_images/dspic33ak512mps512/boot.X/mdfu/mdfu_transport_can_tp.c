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

#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "mdfu_config.h"
#include "mdfu_commands.h"
#include "mdfu_transport.h"
#include "can_tp.h"

static bool RecieveFrameArgumentsInvalid(const uint8_t* frameBuffer, size_t frameBufferLength, const size_t* frameLength);
static bool TransmitFrameArgumentsInvalid(const uint8_t* transmitBuffer, uint16_t length);
static void CANTPEventCallbackHandler(enum CAN_TP_EVENT event, struct CAN_TP_SERVICE_HEADER* header, void* data);
static void CANTPEventIndicationHandler(const struct CAN_TP_EVENT_CONFIRM_DATA * data);

static enum MDFU_TRANSPORT_RESULT transmitResult = MDFU_TRANSPORT_COMPLETE;

/******************************************************************************/
/* Public Functions                                                           */
/******************************************************************************/
void MDFU_TransportInitialize(void)
{
    CAN_TP_Initialize(); 
    CAN_TP_EventCallbackSet(CANTPEventCallbackHandler);
    transmitResult = MDFU_TRANSPORT_COMPLETE;
}

void MDFU_TransportTasks(void)
{
    CAN_TP_Tasks();
        
    if((CAN_TP_IsRxPaused()) == true){
        CAN_TP_RxResume();
    }
}

enum MDFU_TRANSPORT_RESULT MDFU_TransportReceiveFrame(uint8_t* frameBuffer, size_t frameBufferLength, size_t* frameLength)
{
    enum MDFU_TRANSPORT_RESULT status = MDFU_TRANSPORT_FAIL;
    
    if(RecieveFrameArgumentsInvalid(frameBuffer, frameBufferLength, frameLength))
    {
        status = MDFU_TRANSPORT_INVALID_ARG;
    }
    else if (!CAN_TP_IsMessageReady())
    {
        *frameLength = 0;
        status = MDFU_TRANSPORT_BUSY;
    }
    else
    {
        *frameLength = CAN_TP_MessageLengthGet();
        if(*frameLength <= frameBufferLength)
        {
            if((CAN_TP_MessageGet(frameBuffer)) == true)
            {
                status = MDFU_TRANSPORT_COMPLETE;
            } 
            else 
            {
                status = MDFU_TRANSPORT_FAIL;
                *frameLength = 0;
            }
        }
        else
        {
            status = MDFU_TRANSPORT_FAIL_TOO_LONG;
        }
    }
    
    return status;
}

enum MDFU_TRANSPORT_RESULT MDFU_TransportTransmitFrame(const uint8_t* transmitBuffer, uint16_t length)
{       
    if(TransmitFrameArgumentsInvalid(transmitBuffer, length))
    {
        transmitResult = MDFU_TRANSPORT_INVALID_ARG;
    }
    else
    {
        transmitResult = CAN_TP_MessageSend(transmitBuffer, length) ? MDFU_TRANSPORT_BUSY : MDFU_TRANSPORT_FAIL;
    }
    
    return transmitResult;
}

enum MDFU_TRANSPORT_RESULT MDFU_TransportTransmitStatusGet(void)
{
    return transmitResult;
}

/******************************************************************************/
/* Private Functions                                                          */
/******************************************************************************/
static bool RecieveFrameArgumentsInvalid(const uint8_t* frameBuffer, size_t frameBufferLength, const size_t* frameLength)
{
    return (frameBuffer == NULL) || \
           (frameLength == NULL) || \
           (frameBufferLength < (MDFU_COMMAND_RESPONSE_OVERHEAD + MDFU_CONFIG_MAX_COMMAND_DATA_LENGTH));
}

static bool TransmitFrameArgumentsInvalid(const uint8_t* transmitBuffer, uint16_t length)
{
    return (transmitBuffer == NULL) || \
           (length == 0UL);
}

static void CANTPEventCallbackHandler(enum CAN_TP_EVENT event, struct CAN_TP_SERVICE_HEADER* header, void* data)
{
    /*Unused param*/
    (void)header;
    
    switch(event)
    {
        case CAN_TP_EVENT_DATA_CONFIRM:
        {
            struct CAN_TP_EVENT_CONFIRM_DATA eventData;
            
            (void)memcpy(&eventData, data, sizeof(struct CAN_TP_EVENT_CONFIRM_DATA));
            CANTPEventIndicationHandler(&eventData);
        }
            break;
        default:
            break;                    
    }
}

static void CANTPEventIndicationHandler(const struct CAN_TP_EVENT_CONFIRM_DATA * data)
{
    transmitResult = (data->result == CAN_TP_RESULT_OK) ? MDFU_TRANSPORT_COMPLETE : MDFU_TRANSPORT_FAIL;
}