#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=bsp/led0.c bsp/led1.c bsp/led2.c bsp/led3.c bsp/led4.c bsp/led5.c bsp/led6.c bsp/led7.c bsp/s1.c bsp/s2.c bsp/s3.c crypto/common_crypto/src/crypto_digsign.c crypto/common_crypto/src/crypto_hash.c crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.c crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.c crypto/drivers/wrapper/src/crypto_cam05346_wrapper.c crypto/wolfssl/wolfcrypt/src/cpuid.c crypto/wolfssl/wolfcrypt/src/cryptocb.c crypto/wolfssl/wolfcrypt/src/dilithium.c crypto/wolfssl/wolfcrypt/src/hash.c crypto/wolfssl/wolfcrypt/src/hmac.c crypto/wolfssl/wolfcrypt/src/logging.c crypto/wolfssl/wolfcrypt/src/memory.c crypto/wolfssl/wolfcrypt/src/misc.c crypto/wolfssl/wolfcrypt/src/sha.c crypto/wolfssl/wolfcrypt/src/sha3.c crypto/wolfssl/wolfcrypt/src/wc_port.c mcc_generated_files/flash/src/flash.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/dmt.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/reset.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/uart/src/uart1.c mdfu/mdfu_boot_demo.c mdfu/mdfu_command_processor.c mdfu/mdfu_firmware_update.c mdfu/mdfu_partition_boot.c mdfu/mdfu_transport_uart.c mdfu/mdfu_internal_flash.c mdfu/mdfu_partition_download.c mdfu/mdfu_partition_keystore.c mdfu/mdfu_partition_executable.c mdfu/mdfu_recovery_authorization.c mdfu/mdfu_partition_header.c mdfu/critical_region.S mdfu/flash_region0.c mdfu/flash_region1.c mdfu/flash_region2.c mdfu/flash_region3.c mdfu/ram_execution.c mdfu/mdfu_verification_mldsa87_p384.c mdfu/mdfu_reset.c main.c generated_keystore.S

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/bsp/led0.o ${OBJECTDIR}/bsp/led1.o ${OBJECTDIR}/bsp/led2.o ${OBJECTDIR}/bsp/led3.o ${OBJECTDIR}/bsp/led4.o ${OBJECTDIR}/bsp/led5.o ${OBJECTDIR}/bsp/led6.o ${OBJECTDIR}/bsp/led7.o ${OBJECTDIR}/bsp/s1.o ${OBJECTDIR}/bsp/s2.o ${OBJECTDIR}/bsp/s3.o ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o ${OBJECTDIR}/mdfu/mdfu_boot_demo.o ${OBJECTDIR}/mdfu/mdfu_command_processor.o ${OBJECTDIR}/mdfu/mdfu_firmware_update.o ${OBJECTDIR}/mdfu/mdfu_partition_boot.o ${OBJECTDIR}/mdfu/mdfu_transport_uart.o ${OBJECTDIR}/mdfu/mdfu_internal_flash.o ${OBJECTDIR}/mdfu/mdfu_partition_download.o ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o ${OBJECTDIR}/mdfu/mdfu_partition_executable.o ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o ${OBJECTDIR}/mdfu/mdfu_partition_header.o ${OBJECTDIR}/mdfu/critical_region.o ${OBJECTDIR}/mdfu/flash_region0.o ${OBJECTDIR}/mdfu/flash_region1.o ${OBJECTDIR}/mdfu/flash_region2.o ${OBJECTDIR}/mdfu/flash_region3.o ${OBJECTDIR}/mdfu/ram_execution.o ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o ${OBJECTDIR}/mdfu/mdfu_reset.o ${OBJECTDIR}/main.o ${OBJECTDIR}/generated_keystore.o
POSSIBLE_DEPFILES=${OBJECTDIR}/bsp/led0.o.d ${OBJECTDIR}/bsp/led1.o.d ${OBJECTDIR}/bsp/led2.o.d ${OBJECTDIR}/bsp/led3.o.d ${OBJECTDIR}/bsp/led4.o.d ${OBJECTDIR}/bsp/led5.o.d ${OBJECTDIR}/bsp/led6.o.d ${OBJECTDIR}/bsp/led7.o.d ${OBJECTDIR}/bsp/s1.o.d ${OBJECTDIR}/bsp/s2.o.d ${OBJECTDIR}/bsp/s3.o.d ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o.d ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o.d ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o.d ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o.d ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o.d ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o.d ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d ${OBJECTDIR}/mdfu/mdfu_boot_demo.o.d ${OBJECTDIR}/mdfu/mdfu_command_processor.o.d ${OBJECTDIR}/mdfu/mdfu_firmware_update.o.d ${OBJECTDIR}/mdfu/mdfu_partition_boot.o.d ${OBJECTDIR}/mdfu/mdfu_transport_uart.o.d ${OBJECTDIR}/mdfu/mdfu_internal_flash.o.d ${OBJECTDIR}/mdfu/mdfu_partition_download.o.d ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o.d ${OBJECTDIR}/mdfu/mdfu_partition_executable.o.d ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o.d ${OBJECTDIR}/mdfu/mdfu_partition_header.o.d ${OBJECTDIR}/mdfu/critical_region.o.d ${OBJECTDIR}/mdfu/flash_region0.o.d ${OBJECTDIR}/mdfu/flash_region1.o.d ${OBJECTDIR}/mdfu/flash_region2.o.d ${OBJECTDIR}/mdfu/flash_region3.o.d ${OBJECTDIR}/mdfu/ram_execution.o.d ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o.d ${OBJECTDIR}/mdfu/mdfu_reset.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/generated_keystore.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/bsp/led0.o ${OBJECTDIR}/bsp/led1.o ${OBJECTDIR}/bsp/led2.o ${OBJECTDIR}/bsp/led3.o ${OBJECTDIR}/bsp/led4.o ${OBJECTDIR}/bsp/led5.o ${OBJECTDIR}/bsp/led6.o ${OBJECTDIR}/bsp/led7.o ${OBJECTDIR}/bsp/s1.o ${OBJECTDIR}/bsp/s2.o ${OBJECTDIR}/bsp/s3.o ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o ${OBJECTDIR}/mdfu/mdfu_boot_demo.o ${OBJECTDIR}/mdfu/mdfu_command_processor.o ${OBJECTDIR}/mdfu/mdfu_firmware_update.o ${OBJECTDIR}/mdfu/mdfu_partition_boot.o ${OBJECTDIR}/mdfu/mdfu_transport_uart.o ${OBJECTDIR}/mdfu/mdfu_internal_flash.o ${OBJECTDIR}/mdfu/mdfu_partition_download.o ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o ${OBJECTDIR}/mdfu/mdfu_partition_executable.o ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o ${OBJECTDIR}/mdfu/mdfu_partition_header.o ${OBJECTDIR}/mdfu/critical_region.o ${OBJECTDIR}/mdfu/flash_region0.o ${OBJECTDIR}/mdfu/flash_region1.o ${OBJECTDIR}/mdfu/flash_region2.o ${OBJECTDIR}/mdfu/flash_region3.o ${OBJECTDIR}/mdfu/ram_execution.o ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o ${OBJECTDIR}/mdfu/mdfu_reset.o ${OBJECTDIR}/main.o ${OBJECTDIR}/generated_keystore.o

# Source Files
SOURCEFILES=bsp/led0.c bsp/led1.c bsp/led2.c bsp/led3.c bsp/led4.c bsp/led5.c bsp/led6.c bsp/led7.c bsp/s1.c bsp/s2.c bsp/s3.c crypto/common_crypto/src/crypto_digsign.c crypto/common_crypto/src/crypto_hash.c crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.c crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.c crypto/drivers/wrapper/src/crypto_cam05346_wrapper.c crypto/wolfssl/wolfcrypt/src/cpuid.c crypto/wolfssl/wolfcrypt/src/cryptocb.c crypto/wolfssl/wolfcrypt/src/dilithium.c crypto/wolfssl/wolfcrypt/src/hash.c crypto/wolfssl/wolfcrypt/src/hmac.c crypto/wolfssl/wolfcrypt/src/logging.c crypto/wolfssl/wolfcrypt/src/memory.c crypto/wolfssl/wolfcrypt/src/misc.c crypto/wolfssl/wolfcrypt/src/sha.c crypto/wolfssl/wolfcrypt/src/sha3.c crypto/wolfssl/wolfcrypt/src/wc_port.c mcc_generated_files/flash/src/flash.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/dmt.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/reset.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/uart/src/uart1.c mdfu/mdfu_boot_demo.c mdfu/mdfu_command_processor.c mdfu/mdfu_firmware_update.c mdfu/mdfu_partition_boot.c mdfu/mdfu_transport_uart.c mdfu/mdfu_internal_flash.c mdfu/mdfu_partition_download.c mdfu/mdfu_partition_keystore.c mdfu/mdfu_partition_executable.c mdfu/mdfu_recovery_authorization.c mdfu/mdfu_partition_header.c mdfu/critical_region.S mdfu/flash_region0.c mdfu/flash_region1.c mdfu/flash_region2.c mdfu/flash_region3.c mdfu/ram_execution.c mdfu/mdfu_verification_mldsa87_p384.c mdfu/mdfu_reset.c main.c generated_keystore.S



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=dsPIC33AK512MPS512
ProjectDir="C:\Users\C74569\mdfu\demos\dspic33a\secure_boot_pqc_ecdsa_uart_2_images\boot.X"
ProjectName=boot
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif
MDFUHostPath="C:\Program Files\Microchip\MPLABX\v6.30\mplab_platform\mplab-pymdfu\bin\windows\pymdfu-bin.exe"
PYFWImageBuilderPath="C:\Program Files\Microchip\MPLABX\v6.30\mplab_platform\mplab-pymdfu\bin\windows\pyfwimagebuilder-bin.exe"

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33AK512MPS512
MP_LINKER_FILE_OPTION=,--script="p33AK512MPS512.gld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/bsp/led0.o: bsp/led0.c  .generated_files/flags/default/659a17eb161fb8a218df94e49a19737dace14ee4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led0.o.d 
	@${RM} ${OBJECTDIR}/bsp/led0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led0.c  -o ${OBJECTDIR}/bsp/led0.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led0.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led1.o: bsp/led1.c  .generated_files/flags/default/d1299dc80adf4a0e3147970c53a4186c0e233fff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led1.o.d 
	@${RM} ${OBJECTDIR}/bsp/led1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led1.c  -o ${OBJECTDIR}/bsp/led1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led2.o: bsp/led2.c  .generated_files/flags/default/9a337edd03d10081633c6b9ab791a675e7ddbe44 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led2.o.d 
	@${RM} ${OBJECTDIR}/bsp/led2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led2.c  -o ${OBJECTDIR}/bsp/led2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led3.o: bsp/led3.c  .generated_files/flags/default/bcb8b17272984e35b8bd17f4c8e5f7cccaa9e27b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led3.o.d 
	@${RM} ${OBJECTDIR}/bsp/led3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led3.c  -o ${OBJECTDIR}/bsp/led3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led4.o: bsp/led4.c  .generated_files/flags/default/49af7187fb0b6c45d8c9bd3584413d23b355f041 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led4.o.d 
	@${RM} ${OBJECTDIR}/bsp/led4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led4.c  -o ${OBJECTDIR}/bsp/led4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led5.o: bsp/led5.c  .generated_files/flags/default/99b8083633afd522c23bdab60a3e61ce46915869 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led5.o.d 
	@${RM} ${OBJECTDIR}/bsp/led5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led5.c  -o ${OBJECTDIR}/bsp/led5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led5.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led6.o: bsp/led6.c  .generated_files/flags/default/5dfd50d67291c1bf0520eab749c9c44bfa397bc1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led6.o.d 
	@${RM} ${OBJECTDIR}/bsp/led6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led6.c  -o ${OBJECTDIR}/bsp/led6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led6.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led7.o: bsp/led7.c  .generated_files/flags/default/b968f0ce9d46022154c17b5ca37955a90f04889b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led7.o.d 
	@${RM} ${OBJECTDIR}/bsp/led7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led7.c  -o ${OBJECTDIR}/bsp/led7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led7.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s1.o: bsp/s1.c  .generated_files/flags/default/14d81f024066e10569a47746a413b631ad635d7a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s1.o.d 
	@${RM} ${OBJECTDIR}/bsp/s1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s1.c  -o ${OBJECTDIR}/bsp/s1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s2.o: bsp/s2.c  .generated_files/flags/default/488bafbcba35be57d51f074a82377b2e2e764664 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s2.o.d 
	@${RM} ${OBJECTDIR}/bsp/s2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s2.c  -o ${OBJECTDIR}/bsp/s2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s3.o: bsp/s3.c  .generated_files/flags/default/92dca8e2a760fb183609244182290ea92115444d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s3.o.d 
	@${RM} ${OBJECTDIR}/bsp/s3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s3.c  -o ${OBJECTDIR}/bsp/s3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o: crypto/common_crypto/src/crypto_digsign.c  .generated_files/flags/default/d25b2466dfd6eb93a264e1385f87c7b978430830 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/common_crypto/src" 
	@${RM} ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o.d 
	@${RM} ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/common_crypto/src/crypto_digsign.c  -o ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o: crypto/common_crypto/src/crypto_hash.c  .generated_files/flags/default/68ef48dd634dc9dd5bb78f074d4816a188beadaa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/common_crypto/src" 
	@${RM} ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o.d 
	@${RM} ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/common_crypto/src/crypto_hash.c  -o ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o: crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.c  .generated_files/flags/default/3bb68e900694bb4b26451e645001d153e9b796be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/drivers/wrapper/src" 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o.d 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.c  -o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o: crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.c  .generated_files/flags/default/738e4a884c83c17abda48ee8d8246b27e824ee82 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/drivers/wrapper/src" 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o.d 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.c  -o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o: crypto/drivers/wrapper/src/crypto_cam05346_wrapper.c  .generated_files/flags/default/94557b1c91d4b65b8693d80de07e77178066d6b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/drivers/wrapper/src" 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o.d 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/drivers/wrapper/src/crypto_cam05346_wrapper.c  -o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o: crypto/wolfssl/wolfcrypt/src/cpuid.c  .generated_files/flags/default/da2623aab0f1b2faa8fe6729ff7e1f11d90d0cad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/cpuid.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o: crypto/wolfssl/wolfcrypt/src/cryptocb.c  .generated_files/flags/default/e0d8f030bd3898476720c74c97658c293ba67d75 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/cryptocb.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o: crypto/wolfssl/wolfcrypt/src/dilithium.c  .generated_files/flags/default/84f97f54deb53ae7ab729cc8e587b71757a9a409 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/dilithium.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o: crypto/wolfssl/wolfcrypt/src/hash.c  .generated_files/flags/default/a7ec59e2e02b503bd99cdc448c665e9e13c434b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/hash.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o: crypto/wolfssl/wolfcrypt/src/hmac.c  .generated_files/flags/default/f4526ccba0382e25500df37c8970f7ec0aa5c0c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/hmac.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o: crypto/wolfssl/wolfcrypt/src/logging.c  .generated_files/flags/default/dd845ffc21d716a46984d83804c5053b1e58c8f1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/logging.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o: crypto/wolfssl/wolfcrypt/src/memory.c  .generated_files/flags/default/d1ad447632fb78f5044bb9e6c750628797b9b523 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/memory.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o: crypto/wolfssl/wolfcrypt/src/misc.c  .generated_files/flags/default/172480ed666f96419dac735d2af525a453757a08 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/misc.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o: crypto/wolfssl/wolfcrypt/src/sha.c  .generated_files/flags/default/145f8686014800f469d39ce6a48f1783952ef4c6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/sha.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o: crypto/wolfssl/wolfcrypt/src/sha3.c  .generated_files/flags/default/b0ce0f5fa55f03b69ef15bfe77e07ebb82d56550 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/sha3.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o: crypto/wolfssl/wolfcrypt/src/wc_port.c  .generated_files/flags/default/46f264a4cd768e2ce28cee3f9dae0db5e5175fbc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/wc_port.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/flash/src/flash.o: mcc_generated_files/flash/src/flash.c  .generated_files/flags/default/809ff8c294628ce4b62c42fea67085f42e426160 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/flash/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/flash/src/flash.c  -o ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/125ab9aef8dbf2ff6e8a409b0c96364dd652d671 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/b54c661af77ecffe00a4ce4a01f3d8676ed13229 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/9c4a4d7ab3a09e556ed5f498759421d63aa25aa8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/ab4c1ea537e944f1658d6e4389031e7cb030c77 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/ed1b9d59b6494feb32c6526fafb3ba29b529373a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/bce05d4811bb820342db0ab414035e7f2a4efc79 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/e6c798ba94816cc7f6f8cad7e450fea6e2b7daa9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/44b70085efa6c7f25ea397da0e371dfb8085dde .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o: mcc_generated_files/uart/src/uart1.c  .generated_files/flags/default/d7569f1f3031d08ed5e73c11573127c8d36168de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_boot_demo.o: mdfu/mdfu_boot_demo.c  .generated_files/flags/default/57e41405f4d547b138e612e7e7a76d4a4454cc50 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_boot_demo.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_boot_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_boot_demo.c  -o ${OBJECTDIR}/mdfu/mdfu_boot_demo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_boot_demo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_command_processor.o: mdfu/mdfu_command_processor.c  .generated_files/flags/default/7b96d3af7ba241a3491750f475969da62194c604 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_command_processor.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_command_processor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_command_processor.c  -o ${OBJECTDIR}/mdfu/mdfu_command_processor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_command_processor.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_firmware_update.o: mdfu/mdfu_firmware_update.c  .generated_files/flags/default/f998f8caaf68af713102b334fb57f7f5cdb4d487 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_firmware_update.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_firmware_update.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_firmware_update.c  -o ${OBJECTDIR}/mdfu/mdfu_firmware_update.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_firmware_update.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_boot.o: mdfu/mdfu_partition_boot.c  .generated_files/flags/default/73c550e1509b4b6eaa38cbdda636073cce7a3bae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_boot.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_boot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_boot.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_boot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_boot.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_transport_uart.o: mdfu/mdfu_transport_uart.c  .generated_files/flags/default/767edef23d1c4a397a477d84035ca7262de319cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_transport_uart.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_transport_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_transport_uart.c  -o ${OBJECTDIR}/mdfu/mdfu_transport_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_transport_uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_internal_flash.o: mdfu/mdfu_internal_flash.c  .generated_files/flags/default/61f9dbd39b443071b83fc602c8d5f0b3df0b831f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_internal_flash.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_internal_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_internal_flash.c  -o ${OBJECTDIR}/mdfu/mdfu_internal_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_internal_flash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_download.o: mdfu/mdfu_partition_download.c  .generated_files/flags/default/c48b3de3c50f644d542f0282682c3b75d4bfa11a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_download.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_download.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_download.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_download.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_download.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_keystore.o: mdfu/mdfu_partition_keystore.c  .generated_files/flags/default/7b9d72cfcd06ddddbc03bbbd7ebb256fc908d0bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_keystore.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_keystore.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_executable.o: mdfu/mdfu_partition_executable.c  .generated_files/flags/default/d53bff35dd07a414e32f95ff658382e726e1fd8a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_executable.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_executable.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_executable.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_executable.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_executable.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o: mdfu/mdfu_recovery_authorization.c  .generated_files/flags/default/a48628dc204e3ae5666725344b083f54cbed42a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_recovery_authorization.c  -o ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_header.o: mdfu/mdfu_partition_header.c  .generated_files/flags/default/fee000bea098169687b26f88c980e3e86e7e792 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_header.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_header.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_header.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_header.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_header.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/flash_region0.o: mdfu/flash_region0.c  .generated_files/flags/default/95ccf2921a3fba72f269f29e19c24f5a494efe0f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/flash_region0.o.d 
	@${RM} ${OBJECTDIR}/mdfu/flash_region0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/flash_region0.c  -o ${OBJECTDIR}/mdfu/flash_region0.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/flash_region0.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/flash_region1.o: mdfu/flash_region1.c  .generated_files/flags/default/a7cccaeadad5028c30ff0eac5db0d905400f6dd7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/flash_region1.o.d 
	@${RM} ${OBJECTDIR}/mdfu/flash_region1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/flash_region1.c  -o ${OBJECTDIR}/mdfu/flash_region1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/flash_region1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/flash_region2.o: mdfu/flash_region2.c  .generated_files/flags/default/ed943be33ba08df2cebe500dd7939e0c3376d6ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/flash_region2.o.d 
	@${RM} ${OBJECTDIR}/mdfu/flash_region2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/flash_region2.c  -o ${OBJECTDIR}/mdfu/flash_region2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/flash_region2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/flash_region3.o: mdfu/flash_region3.c  .generated_files/flags/default/761f3ea5b5ae4233a3255ee34679c1008e0e5ff0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/flash_region3.o.d 
	@${RM} ${OBJECTDIR}/mdfu/flash_region3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/flash_region3.c  -o ${OBJECTDIR}/mdfu/flash_region3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/flash_region3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/ram_execution.o: mdfu/ram_execution.c  .generated_files/flags/default/78bd8aaef939b7618dbe8941159d6c65cff27476 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/ram_execution.o.d 
	@${RM} ${OBJECTDIR}/mdfu/ram_execution.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/ram_execution.c  -o ${OBJECTDIR}/mdfu/ram_execution.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/ram_execution.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o: mdfu/mdfu_verification_mldsa87_p384.c  .generated_files/flags/default/f5ec32c5b7c8c4302b5bc714d0676bd9530cac17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_verification_mldsa87_p384.c  -o ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_reset.o: mdfu/mdfu_reset.c  .generated_files/flags/default/adba4bb1148fa49854e743ba4ddbe7805ad70d65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_reset.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_reset.c  -o ${OBJECTDIR}/mdfu/mdfu_reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_reset.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/2fa2b19beb8e1817f317e6713da4ec79dfae6de4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1    -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/bsp/led0.o: bsp/led0.c  .generated_files/flags/default/186d1f9dea1a238c5b5aad8fb8d58dff2f56977e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led0.o.d 
	@${RM} ${OBJECTDIR}/bsp/led0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led0.c  -o ${OBJECTDIR}/bsp/led0.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led0.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led1.o: bsp/led1.c  .generated_files/flags/default/c54bf1aed6dd166b6896d429a31ab158002046f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led1.o.d 
	@${RM} ${OBJECTDIR}/bsp/led1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led1.c  -o ${OBJECTDIR}/bsp/led1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led1.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led2.o: bsp/led2.c  .generated_files/flags/default/87cdb9797125b763446ff1fae9c2ea1e1454f1f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led2.o.d 
	@${RM} ${OBJECTDIR}/bsp/led2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led2.c  -o ${OBJECTDIR}/bsp/led2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led2.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led3.o: bsp/led3.c  .generated_files/flags/default/1f47f5165685a660fb38d77be120c47b1b611138 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led3.o.d 
	@${RM} ${OBJECTDIR}/bsp/led3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led3.c  -o ${OBJECTDIR}/bsp/led3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led3.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led4.o: bsp/led4.c  .generated_files/flags/default/147f3950021a123df3d88cadd273136dcbdf4e48 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led4.o.d 
	@${RM} ${OBJECTDIR}/bsp/led4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led4.c  -o ${OBJECTDIR}/bsp/led4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led4.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led5.o: bsp/led5.c  .generated_files/flags/default/1c178f597483586ebd17d602a8e71153a836800a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led5.o.d 
	@${RM} ${OBJECTDIR}/bsp/led5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led5.c  -o ${OBJECTDIR}/bsp/led5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led5.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led6.o: bsp/led6.c  .generated_files/flags/default/107ebb290aaa401c55780e34862a13d564390a1c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led6.o.d 
	@${RM} ${OBJECTDIR}/bsp/led6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led6.c  -o ${OBJECTDIR}/bsp/led6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led6.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led7.o: bsp/led7.c  .generated_files/flags/default/d3229e4925712f35baf86bd0671993c0668fe9b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led7.o.d 
	@${RM} ${OBJECTDIR}/bsp/led7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led7.c  -o ${OBJECTDIR}/bsp/led7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led7.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s1.o: bsp/s1.c  .generated_files/flags/default/3288807cbe7787e2d7c0d5a10ba9c5f543ca12a4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s1.o.d 
	@${RM} ${OBJECTDIR}/bsp/s1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s1.c  -o ${OBJECTDIR}/bsp/s1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s1.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s2.o: bsp/s2.c  .generated_files/flags/default/b96eafec9e6548f1c435c36e5410107b969e3bc0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s2.o.d 
	@${RM} ${OBJECTDIR}/bsp/s2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s2.c  -o ${OBJECTDIR}/bsp/s2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s2.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s3.o: bsp/s3.c  .generated_files/flags/default/9bc284d542af131e9cfd2f22dc60fbb145911d9a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s3.o.d 
	@${RM} ${OBJECTDIR}/bsp/s3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s3.c  -o ${OBJECTDIR}/bsp/s3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s3.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o: crypto/common_crypto/src/crypto_digsign.c  .generated_files/flags/default/292e3f2a3f547a579b8bc652412cd0736192245d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/common_crypto/src" 
	@${RM} ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o.d 
	@${RM} ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/common_crypto/src/crypto_digsign.c  -o ${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/common_crypto/src/crypto_digsign.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o: crypto/common_crypto/src/crypto_hash.c  .generated_files/flags/default/3c85eb06c6e07ac5e61af8e4c88417e9c40f8e07 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/common_crypto/src" 
	@${RM} ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o.d 
	@${RM} ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/common_crypto/src/crypto_hash.c  -o ${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/common_crypto/src/crypto_hash.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o: crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.c  .generated_files/flags/default/238de759557335da9bf82474b2702cbc05e2a01 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/drivers/wrapper/src" 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o.d 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.c  -o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_digisign_cam05346_wrapper.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o: crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.c  .generated_files/flags/default/7d7438416e38a88af44ed6cca406561bc996c6e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/drivers/wrapper/src" 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o.d 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.c  -o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_hash_cam05346_wrapper.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o: crypto/drivers/wrapper/src/crypto_cam05346_wrapper.c  .generated_files/flags/default/c02ce9129b96752cf5316eae7cedf7a89c37d38f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/drivers/wrapper/src" 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o.d 
	@${RM} ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/drivers/wrapper/src/crypto_cam05346_wrapper.c  -o ${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/drivers/wrapper/src/crypto_cam05346_wrapper.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o: crypto/wolfssl/wolfcrypt/src/cpuid.c  .generated_files/flags/default/933720a9a8ecf04c988f8a45bb5c0d95552ff7d9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/cpuid.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cpuid.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o: crypto/wolfssl/wolfcrypt/src/cryptocb.c  .generated_files/flags/default/a6cb069625105dc9fa0871106ba79638a5c0f425 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/cryptocb.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/cryptocb.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o: crypto/wolfssl/wolfcrypt/src/dilithium.c  .generated_files/flags/default/6b7f68394d2deed84c3842bd54f68585fa8ec964 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/dilithium.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/dilithium.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o: crypto/wolfssl/wolfcrypt/src/hash.c  .generated_files/flags/default/77c890f495dc5cf7d329c6a5e7a87e060fe794c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/hash.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hash.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o: crypto/wolfssl/wolfcrypt/src/hmac.c  .generated_files/flags/default/8c01ddc8a1e673a66b8ce005017bb5145b1e3dfa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/hmac.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/hmac.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o: crypto/wolfssl/wolfcrypt/src/logging.c  .generated_files/flags/default/daaf12945ddcf9c8172c15ee8920b085fc6e4fcb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/logging.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/logging.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o: crypto/wolfssl/wolfcrypt/src/memory.c  .generated_files/flags/default/d323a5848add8c5a9ce473d6ca54ab27724a10f2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/memory.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/memory.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o: crypto/wolfssl/wolfcrypt/src/misc.c  .generated_files/flags/default/5953e1d0d4b98f4ff3d789b92bff327fc6401f4c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/misc.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/misc.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o: crypto/wolfssl/wolfcrypt/src/sha.c  .generated_files/flags/default/8df69b7133e881939d3bfcd367e369c67cc386c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/sha.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o: crypto/wolfssl/wolfcrypt/src/sha3.c  .generated_files/flags/default/ec21bced3aaec2550704f29d15033e349aad2593 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/sha3.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/sha3.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o: crypto/wolfssl/wolfcrypt/src/wc_port.c  .generated_files/flags/default/77a291113465b1dd44ed5db4c6079bd79e6cc9de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src" 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o.d 
	@${RM} ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  crypto/wolfssl/wolfcrypt/src/wc_port.c  -o ${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/crypto/wolfssl/wolfcrypt/src/wc_port.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/flash/src/flash.o: mcc_generated_files/flash/src/flash.c  .generated_files/flags/default/96f898b020df67688964390dc590084914508422 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/flash/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/flash/src/flash.c  -o ${OBJECTDIR}/mcc_generated_files/flash/src/flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/flash/src/flash.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/f89f4a11c360e23d5687f6773614f98859a34839 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/fed53398b6472e2001b14bf663837ff68058d602 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/9f4a899b94bad0a4b91b349e94230a4ef2c83825 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/9220c9525668b3d3c8b65f42a36170e42635543d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/c0d8fd7bfaae5fc0ec2e768441b85e6e19151462 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/a216fbbf1c3c798eae28c4a470ac16dc21cf34a5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/1f46bb75df5acd9420bb3f51f6ba9d06d2728df1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/dba5d3d998c293cfe6ffeeaaf4793bafdf979018 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o: mcc_generated_files/uart/src/uart1.c  .generated_files/flags/default/bf6b08b6b606df6194b00d2a2681bd7d48fdc175 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart1.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_boot_demo.o: mdfu/mdfu_boot_demo.c  .generated_files/flags/default/90b50c872b17c4ae5167e73ce4edca14bcdfa17b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_boot_demo.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_boot_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_boot_demo.c  -o ${OBJECTDIR}/mdfu/mdfu_boot_demo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_boot_demo.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_command_processor.o: mdfu/mdfu_command_processor.c  .generated_files/flags/default/c4656d969e461a931f829b71eaada92ebaf2cba1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_command_processor.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_command_processor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_command_processor.c  -o ${OBJECTDIR}/mdfu/mdfu_command_processor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_command_processor.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_firmware_update.o: mdfu/mdfu_firmware_update.c  .generated_files/flags/default/1f2cee18c46ea77c947c363be2ecaedddf58f3fc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_firmware_update.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_firmware_update.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_firmware_update.c  -o ${OBJECTDIR}/mdfu/mdfu_firmware_update.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_firmware_update.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_boot.o: mdfu/mdfu_partition_boot.c  .generated_files/flags/default/3cbad44d3bdbd16017162107e6695018ce72552d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_boot.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_boot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_boot.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_boot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_boot.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_transport_uart.o: mdfu/mdfu_transport_uart.c  .generated_files/flags/default/33f76984f4f974b2cc0cc479ca0cbd5fa7c49f71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_transport_uart.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_transport_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_transport_uart.c  -o ${OBJECTDIR}/mdfu/mdfu_transport_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_transport_uart.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_internal_flash.o: mdfu/mdfu_internal_flash.c  .generated_files/flags/default/f841249cc8133e98dc8af607982013e91eb5e2fc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_internal_flash.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_internal_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_internal_flash.c  -o ${OBJECTDIR}/mdfu/mdfu_internal_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_internal_flash.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_download.o: mdfu/mdfu_partition_download.c  .generated_files/flags/default/f2f2643318b051c2cae35b63f062e901ea43d54c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_download.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_download.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_download.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_download.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_download.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_keystore.o: mdfu/mdfu_partition_keystore.c  .generated_files/flags/default/c6f4e7e6003e9ecc51d062b1b133c0ed2ed7bd7a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_keystore.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_keystore.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_keystore.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_executable.o: mdfu/mdfu_partition_executable.c  .generated_files/flags/default/9a00643e4e13c39cc08ddd262b713dd79a5a485f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_executable.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_executable.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_executable.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_executable.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_executable.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o: mdfu/mdfu_recovery_authorization.c  .generated_files/flags/default/499cb7d3f12d7f0e1da9dd72d444da3e19f53cad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_recovery_authorization.c  -o ${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_recovery_authorization.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_partition_header.o: mdfu/mdfu_partition_header.c  .generated_files/flags/default/676b0ccc0e44470be32417f9ff790ec6df5a95d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_header.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_partition_header.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_partition_header.c  -o ${OBJECTDIR}/mdfu/mdfu_partition_header.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_partition_header.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/flash_region0.o: mdfu/flash_region0.c  .generated_files/flags/default/d0840f82cf2b84ffda89ec010413c44f0f13db91 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/flash_region0.o.d 
	@${RM} ${OBJECTDIR}/mdfu/flash_region0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/flash_region0.c  -o ${OBJECTDIR}/mdfu/flash_region0.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/flash_region0.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/flash_region1.o: mdfu/flash_region1.c  .generated_files/flags/default/a4857aca91e7c5315fe6b4214566ca92dbfa7734 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/flash_region1.o.d 
	@${RM} ${OBJECTDIR}/mdfu/flash_region1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/flash_region1.c  -o ${OBJECTDIR}/mdfu/flash_region1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/flash_region1.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/flash_region2.o: mdfu/flash_region2.c  .generated_files/flags/default/2833392c7120b965427f19f57d9bb50d2d17b6d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/flash_region2.o.d 
	@${RM} ${OBJECTDIR}/mdfu/flash_region2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/flash_region2.c  -o ${OBJECTDIR}/mdfu/flash_region2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/flash_region2.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/flash_region3.o: mdfu/flash_region3.c  .generated_files/flags/default/51059d78a22a19e8907d43b02f9b3d024631a840 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/flash_region3.o.d 
	@${RM} ${OBJECTDIR}/mdfu/flash_region3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/flash_region3.c  -o ${OBJECTDIR}/mdfu/flash_region3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/flash_region3.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/ram_execution.o: mdfu/ram_execution.c  .generated_files/flags/default/7a522820955b11c8eb49b0f44a3bb888dd1f1167 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/ram_execution.o.d 
	@${RM} ${OBJECTDIR}/mdfu/ram_execution.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/ram_execution.c  -o ${OBJECTDIR}/mdfu/ram_execution.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/ram_execution.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o: mdfu/mdfu_verification_mldsa87_p384.c  .generated_files/flags/default/2bbc9cc04b3955aa767870def8a58592bb0ac43d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_verification_mldsa87_p384.c  -o ${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_verification_mldsa87_p384.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_reset.o: mdfu/mdfu_reset.c  .generated_files/flags/default/debf617db48725b3945728db7ba750041b434b6d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_reset.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_reset.c  -o ${OBJECTDIR}/mdfu/mdfu_reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_reset.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/6e16919200d49411746ac79b5116eb68eb6b9121 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -O0 -I"crypto/wolfssl/wolfssl/wolfcrypt" -I"crypto/common_crypto" -I"." -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/ae702692378535a1bc7bb421c43fd3cfaf88c600 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PKOB4=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/7bd52f73aa2721f009a546e6dcdb1ca84a3f8fc4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PKOB4=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/8b2412f0cc3838a61d70bac7b2db531e85614902 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/783c086b8af87e9e8f71fa24ccdd2420b510beaf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mdfu/critical_region.o: mdfu/critical_region.S  .generated_files/flags/default/4225bd20aa2a644268903b16ece0118d04fab41 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/critical_region.o.d 
	@${RM} ${OBJECTDIR}/mdfu/critical_region.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mdfu/critical_region.S  -o ${OBJECTDIR}/mdfu/critical_region.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/critical_region.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wa,-MD,"${OBJECTDIR}/mdfu/critical_region.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PKOB4=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/generated_keystore.o: generated_keystore.S  .generated_files/flags/default/ddb0fe7b4453b1cbb542572d43c0ac43fab9fce4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/generated_keystore.o.d 
	@${RM} ${OBJECTDIR}/generated_keystore.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  generated_keystore.S  -o ${OBJECTDIR}/generated_keystore.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/generated_keystore.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wa,-MD,"${OBJECTDIR}/generated_keystore.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PKOB4=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mdfu/critical_region.o: mdfu/critical_region.S  .generated_files/flags/default/1d85b5d0827ce52ed7fbe78ccde1769fba01eebd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/critical_region.o.d 
	@${RM} ${OBJECTDIR}/mdfu/critical_region.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mdfu/critical_region.S  -o ${OBJECTDIR}/mdfu/critical_region.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/critical_region.o.d"  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wa,-MD,"${OBJECTDIR}/mdfu/critical_region.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/generated_keystore.o: generated_keystore.S  .generated_files/flags/default/39ca5cb496b5d058d1759230055e3819ac239f70 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/generated_keystore.o.d 
	@${RM} ${OBJECTDIR}/generated_keystore.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  generated_keystore.S  -o ${OBJECTDIR}/generated_keystore.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/generated_keystore.o.d"  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wa,-MD,"${OBJECTDIR}/generated_keystore.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  crypto/drivers/library/libcam05346-dspic33a.a  p33AK512MPS512.gld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    crypto\drivers\library\libcam05346-dspic33a.a  -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PKOB4=1  -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt"     -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PKOB4=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-gc-sections,--fill-upper=0,--stackguard=16,--ivt,--isr,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  crypto/drivers/library/libcam05346-dspic33a.a p33AK512MPS512.gld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/boot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    crypto\drivers\library\libcam05346-dspic33a.a  -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DWOLFSSL_USER_SETTINGS -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"." -I"crypto/drivers/wrapper" -I"crypto/common_crypto" -I"bsp" -I"mcc_generated_files/system" -I"mcc_generated_files/flash" -I"mcc_generated_files/uart" -I"crypto/wolfssl/" -I"mdfu" -I"crypto/wolfssl/wolfcrypt" -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-gc-sections,--fill-upper=0,--stackguard=16,--ivt,--isr,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc-dsc-bin2hex ${DISTDIR}/boot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [cd mdfu && .${_/_}preBuild$(ShExtension) && cd ${ProjectDir}]"
	@cd mdfu && .${_/_}preBuild$(ShExtension) && cd ${ProjectDir}
	@echo "--------------------------------------"

# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
