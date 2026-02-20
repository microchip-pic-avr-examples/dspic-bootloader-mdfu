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
FINAL_IMAGE=${DISTDIR}/app.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/app.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=bsp/led0.c bsp/led1.c bsp/led2.c bsp/led3.c bsp/led4.c bsp/led5.c bsp/led6.c bsp/led7.c bsp/s1.c bsp/s2.c bsp/s3.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/reset.c mcc_generated_files/system/src/dmt.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/timer/src/tmr1.c mdfu/mdfu_boot_entry.c mdfu/application_header.c mdfu/application_signature.c mdfu/mdfu_reset.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/bsp/led0.o ${OBJECTDIR}/bsp/led1.o ${OBJECTDIR}/bsp/led2.o ${OBJECTDIR}/bsp/led3.o ${OBJECTDIR}/bsp/led4.o ${OBJECTDIR}/bsp/led5.o ${OBJECTDIR}/bsp/led6.o ${OBJECTDIR}/bsp/led7.o ${OBJECTDIR}/bsp/s1.o ${OBJECTDIR}/bsp/s2.o ${OBJECTDIR}/bsp/s3.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o ${OBJECTDIR}/mdfu/mdfu_boot_entry.o ${OBJECTDIR}/mdfu/application_header.o ${OBJECTDIR}/mdfu/application_signature.o ${OBJECTDIR}/mdfu/mdfu_reset.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/bsp/led0.o.d ${OBJECTDIR}/bsp/led1.o.d ${OBJECTDIR}/bsp/led2.o.d ${OBJECTDIR}/bsp/led3.o.d ${OBJECTDIR}/bsp/led4.o.d ${OBJECTDIR}/bsp/led5.o.d ${OBJECTDIR}/bsp/led6.o.d ${OBJECTDIR}/bsp/led7.o.d ${OBJECTDIR}/bsp/s1.o.d ${OBJECTDIR}/bsp/s2.o.d ${OBJECTDIR}/bsp/s3.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d ${OBJECTDIR}/mdfu/mdfu_boot_entry.o.d ${OBJECTDIR}/mdfu/application_header.o.d ${OBJECTDIR}/mdfu/application_signature.o.d ${OBJECTDIR}/mdfu/mdfu_reset.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/bsp/led0.o ${OBJECTDIR}/bsp/led1.o ${OBJECTDIR}/bsp/led2.o ${OBJECTDIR}/bsp/led3.o ${OBJECTDIR}/bsp/led4.o ${OBJECTDIR}/bsp/led5.o ${OBJECTDIR}/bsp/led6.o ${OBJECTDIR}/bsp/led7.o ${OBJECTDIR}/bsp/s1.o ${OBJECTDIR}/bsp/s2.o ${OBJECTDIR}/bsp/s3.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o ${OBJECTDIR}/mdfu/mdfu_boot_entry.o ${OBJECTDIR}/mdfu/application_header.o ${OBJECTDIR}/mdfu/application_signature.o ${OBJECTDIR}/mdfu/mdfu_reset.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=bsp/led0.c bsp/led1.c bsp/led2.c bsp/led3.c bsp/led4.c bsp/led5.c bsp/led6.c bsp/led7.c bsp/s1.c bsp/s2.c bsp/s3.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/reset.c mcc_generated_files/system/src/dmt.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/timer/src/tmr1.c mdfu/mdfu_boot_entry.c mdfu/application_header.c mdfu/application_signature.c mdfu/mdfu_reset.c main.c



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
ProjectDir="C:\Users\C74569\mdfu\demos\dspic33a\secure_boot_pqc_ecdsa_uart_2_images\app.X"
ProjectName=app
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\app.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="app.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/app.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [cd mdfu && .${_/_}postBuild$(ShExtension) $(MP_CC_DIR) ${ProjectDir} ${ImageDir} ${ImageName} ${IsDebug} && cd ${ProjectDir} && cd ${ImageDir}]"
	@cd mdfu && .${_/_}postBuild$(ShExtension) $(MP_CC_DIR) ${ProjectDir} ${ImageDir} ${ImageName} ${IsDebug} && cd ${ProjectDir} && cd ${ImageDir}
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=33AK512MPS512
MP_LINKER_FILE_OPTION=,--script="p33AK512MPS512.gld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/bsp/led0.o: bsp/led0.c  .generated_files/flags/default/75896cd40e4feb2548217aa4f22f3db5064c5193 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led0.o.d 
	@${RM} ${OBJECTDIR}/bsp/led0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led0.c  -o ${OBJECTDIR}/bsp/led0.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led0.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led1.o: bsp/led1.c  .generated_files/flags/default/2060931d13d1b6407e9a6fd68470924fa038f04f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led1.o.d 
	@${RM} ${OBJECTDIR}/bsp/led1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led1.c  -o ${OBJECTDIR}/bsp/led1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led1.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led2.o: bsp/led2.c  .generated_files/flags/default/91e97f4e0dd547b329acda82ab309799b39f88c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led2.o.d 
	@${RM} ${OBJECTDIR}/bsp/led2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led2.c  -o ${OBJECTDIR}/bsp/led2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led2.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led3.o: bsp/led3.c  .generated_files/flags/default/3b00b490536db0ab67cb8794a486501d54f82264 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led3.o.d 
	@${RM} ${OBJECTDIR}/bsp/led3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led3.c  -o ${OBJECTDIR}/bsp/led3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led3.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led4.o: bsp/led4.c  .generated_files/flags/default/f00c6915470900a31c5c6c57e940e05d71fdc512 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led4.o.d 
	@${RM} ${OBJECTDIR}/bsp/led4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led4.c  -o ${OBJECTDIR}/bsp/led4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led4.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led5.o: bsp/led5.c  .generated_files/flags/default/2bd16d6389dc499b4f739837140194de49fc5c4f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led5.o.d 
	@${RM} ${OBJECTDIR}/bsp/led5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led5.c  -o ${OBJECTDIR}/bsp/led5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led5.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led6.o: bsp/led6.c  .generated_files/flags/default/bf97df05562a0b32e056ff52d6a55d364ae1adb9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led6.o.d 
	@${RM} ${OBJECTDIR}/bsp/led6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led6.c  -o ${OBJECTDIR}/bsp/led6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led6.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led7.o: bsp/led7.c  .generated_files/flags/default/8d34891e8f4ef19243dd58a0bd87ecbea7450a77 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led7.o.d 
	@${RM} ${OBJECTDIR}/bsp/led7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led7.c  -o ${OBJECTDIR}/bsp/led7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led7.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s1.o: bsp/s1.c  .generated_files/flags/default/2ef2aa90e2be51a83432b332018cec9e551cf568 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s1.o.d 
	@${RM} ${OBJECTDIR}/bsp/s1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s1.c  -o ${OBJECTDIR}/bsp/s1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s1.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s2.o: bsp/s2.c  .generated_files/flags/default/f7a375992ea8515286c2b758bd6198754092a7b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s2.o.d 
	@${RM} ${OBJECTDIR}/bsp/s2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s2.c  -o ${OBJECTDIR}/bsp/s2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s2.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s3.o: bsp/s3.c  .generated_files/flags/default/d6031843d4a6a090021956219a85f43af8b1d1e7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s3.o.d 
	@${RM} ${OBJECTDIR}/bsp/s3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s3.c  -o ${OBJECTDIR}/bsp/s3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s3.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/e547da7136437e4e36e83184f1393d3051481fa5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/843a8188858dbdc5581fd31d9827583082db33b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/9cbe12e8f48fd338be1bec3304b03ec425107c0d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/f23f5b0ff67922fb48fb56dfe2bdebe12a42065 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/4bfe5bac1a9514e5693216aaf8f978cf1a3703f1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/35be9f511a66bcc983fe86eff2f5cbb78e7809b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/95dd4a81361bcfef9e12acb0b270843e8e43217d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/b93ac084276e9b443aa06158fc436d9dfa281316 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o: mcc_generated_files/timer/src/tmr1.c  .generated_files/flags/default/53d9769f3e4154842c2c52e98eaea6bcc5165158 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_boot_entry.o: mdfu/mdfu_boot_entry.c  .generated_files/flags/default/3ecd83759bc258c4eb2d5e156fd808b6bacaf684 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_boot_entry.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_boot_entry.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_boot_entry.c  -o ${OBJECTDIR}/mdfu/mdfu_boot_entry.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_boot_entry.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/application_header.o: mdfu/application_header.c  .generated_files/flags/default/523332467fa48ae90ac62392c22fe7c9fd39b2fd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/application_header.o.d 
	@${RM} ${OBJECTDIR}/mdfu/application_header.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/application_header.c  -o ${OBJECTDIR}/mdfu/application_header.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/application_header.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/application_signature.o: mdfu/application_signature.c  .generated_files/flags/default/41c7902abe32bcadcbcbf0df0ba94f1c094d9d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/application_signature.o.d 
	@${RM} ${OBJECTDIR}/mdfu/application_signature.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/application_signature.c  -o ${OBJECTDIR}/mdfu/application_signature.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/application_signature.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_reset.o: mdfu/mdfu_reset.c  .generated_files/flags/default/6cd18a24ff7f6ceb1d6b44bb3fc4d6a78842b3c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_reset.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_reset.c  -o ${OBJECTDIR}/mdfu/mdfu_reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_reset.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/5bae0a0bb74b73fa16ae78101627713d7484a936 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/bsp/led0.o: bsp/led0.c  .generated_files/flags/default/1a006bc5bda632265254f55c07dd611432d7f977 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led0.o.d 
	@${RM} ${OBJECTDIR}/bsp/led0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led0.c  -o ${OBJECTDIR}/bsp/led0.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led0.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led1.o: bsp/led1.c  .generated_files/flags/default/67b6eda83d53ba1606abdb047ef945dd15dcb654 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led1.o.d 
	@${RM} ${OBJECTDIR}/bsp/led1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led1.c  -o ${OBJECTDIR}/bsp/led1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led2.o: bsp/led2.c  .generated_files/flags/default/5799704b563d0d21e2676bf3d3c73cbf3047a4e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led2.o.d 
	@${RM} ${OBJECTDIR}/bsp/led2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led2.c  -o ${OBJECTDIR}/bsp/led2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led3.o: bsp/led3.c  .generated_files/flags/default/a00bb65367a55ae36d40f2704ac26ff91697f747 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led3.o.d 
	@${RM} ${OBJECTDIR}/bsp/led3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led3.c  -o ${OBJECTDIR}/bsp/led3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led4.o: bsp/led4.c  .generated_files/flags/default/5cd3898b3e97554cf9f09ccbe220b23e01b715fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led4.o.d 
	@${RM} ${OBJECTDIR}/bsp/led4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led4.c  -o ${OBJECTDIR}/bsp/led4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led5.o: bsp/led5.c  .generated_files/flags/default/df14d70c6aa675ba11b35d2cce93cc1a9479db88 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led5.o.d 
	@${RM} ${OBJECTDIR}/bsp/led5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led5.c  -o ${OBJECTDIR}/bsp/led5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led5.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led6.o: bsp/led6.c  .generated_files/flags/default/10831f7d86831b1905964befd5aa63ecb1e07cf3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led6.o.d 
	@${RM} ${OBJECTDIR}/bsp/led6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led6.c  -o ${OBJECTDIR}/bsp/led6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led6.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/led7.o: bsp/led7.c  .generated_files/flags/default/1d9ddcd3db09908adf214ed0765308b47466ee62 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/led7.o.d 
	@${RM} ${OBJECTDIR}/bsp/led7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/led7.c  -o ${OBJECTDIR}/bsp/led7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/led7.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s1.o: bsp/s1.c  .generated_files/flags/default/db3ad49f79eb801cd78374901a0f886b6988ff40 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s1.o.d 
	@${RM} ${OBJECTDIR}/bsp/s1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s1.c  -o ${OBJECTDIR}/bsp/s1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s2.o: bsp/s2.c  .generated_files/flags/default/d2fb7d3609ec0148050e94739aa7e20be949ddf8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s2.o.d 
	@${RM} ${OBJECTDIR}/bsp/s2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s2.c  -o ${OBJECTDIR}/bsp/s2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/s3.o: bsp/s3.c  .generated_files/flags/default/5e1db96970e2280877b9c81a89dd2d036d02ef86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/s3.o.d 
	@${RM} ${OBJECTDIR}/bsp/s3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/s3.c  -o ${OBJECTDIR}/bsp/s3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/s3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/bbae7e88b570a7d5909b2b47d926ef0d099ca076 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/bd8abe384de20074781239b6932e7adab89917d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/ce015cb4dbf9b5ff87f8e2a6c36ba4c1c99c55bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/6d3e7903ae5ac58f8f2b78a00c71fac0a7800dd2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/5e78472389a9616bbba8cbb78d7162d9d6e2988d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/292973f5227730a8f6ef2ee3ec2358a7ba2c19f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/396c4d84894d987eb8194a8b7a05238b79dc4413 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/dc63efb8bef1966188b68d4526b50b6d851686d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o: mcc_generated_files/timer/src/tmr1.c  .generated_files/flags/default/8e91d2d98e45effb3801a13ddd9401ba79dc2453 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_boot_entry.o: mdfu/mdfu_boot_entry.c  .generated_files/flags/default/e8a6871d20cce16bf9336e8d2641b6cfae6f9dfe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_boot_entry.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_boot_entry.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_boot_entry.c  -o ${OBJECTDIR}/mdfu/mdfu_boot_entry.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_boot_entry.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/application_header.o: mdfu/application_header.c  .generated_files/flags/default/4f6065b8a079283eec04618d6c0390b6699b4b19 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/application_header.o.d 
	@${RM} ${OBJECTDIR}/mdfu/application_header.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/application_header.c  -o ${OBJECTDIR}/mdfu/application_header.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/application_header.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/application_signature.o: mdfu/application_signature.c  .generated_files/flags/default/677b8d021d907ad604ffba5933234d26bea4375c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/application_signature.o.d 
	@${RM} ${OBJECTDIR}/mdfu/application_signature.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/application_signature.c  -o ${OBJECTDIR}/mdfu/application_signature.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/application_signature.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mdfu/mdfu_reset.o: mdfu/mdfu_reset.c  .generated_files/flags/default/30f8e7cbf81cafc4ae26fffc839336eda0e8de93 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mdfu" 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_reset.o.d 
	@${RM} ${OBJECTDIR}/mdfu/mdfu_reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mdfu/mdfu_reset.c  -o ${OBJECTDIR}/mdfu/mdfu_reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mdfu/mdfu_reset.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/ff4f831132f71e1c56f18bd1754cd0fa621098 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -O0 -msmart-io=1 -Wall -msfr-warn=off   -merrata=base_offset  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/cc4f1b5e2ac6cc151d6c7ff0bbe77f6335ec6ecf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mdfu" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/84e4c6e7811762bf149a99aba3b3513ca53cd5f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mdfu" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/c808b745020c85392e4944de7757ac0c5e5c666d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mdfu" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/af6595735a989a84e322f770d143c1b64d884d7f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mdfu" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/app.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    p33AK512MPS512.gld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/app.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu"     -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-gc-sections,--fill-upper=0,--stackguard=16,--ivt,--isr,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml,--ivt=0x81B440$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/app.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   p33AK512MPS512.gld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/app.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mdfu" -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-gc-sections,--fill-upper=0,--stackguard=16,--ivt,--isr,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml,--ivt=0x81B440$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc-dsc-bin2hex ${DISTDIR}/app.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [cd mdfu && .${_/_}preBuild${ShExtension}]"
	@cd mdfu && .${_/_}preBuild${ShExtension}
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
