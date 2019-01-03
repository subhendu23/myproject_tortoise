
;CodeVisionAVR C Compiler V3.34 Evaluation
;(C) Copyright 1998-2018 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Build configuration    : Debug
;Chip type              : ATxmega128B1
;Program type           : Application
;Clock frequency        : 2.000000 MHz
;Memory model           : Small
;Optimize for           : Size
;(s)printf features     : int, width
;(s)scanf features      : int, width
;External RAM size      : 0
;Data Stack size        : 2048 byte(s)
;Heap size              : 0 byte(s)
;Promote 'char' to 'int': Yes
;'char' is unsigned     : Yes
;8 bit enums            : Yes
;Global 'const' stored in FLASH: Yes
;Enhanced function parameter passing: Mode 2
;Enhanced core instructions: On
;Automatic register allocation for global variables: On
;Smart register allocation: On

	#define _MODEL_SMALL_

	#pragma AVRPART ADMIN PART_NAME ATxmega128B1
	#pragma AVRPART MEMORY PROG_FLASH 139264
	#pragma AVRPART MEMORY EEPROM 2048
	#pragma AVRPART MEMORY INT_SRAM SIZE 8192
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x2000

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU CCP=0x34
	.EQU RAMPD=0x38
	.EQU RAMPX=0x39
	.EQU RAMPY=0x3A
	.EQU RAMPZ=0x3B
	.EQU EIND=0x3C
	.EQU WDT_CTRL=0x80
	.EQU PMIC_CTRL=0xA2
	.EQU NVM_ADDR0=0x01C0
	.EQU NVM_ADDR1=NVM_ADDR0+1
	.EQU NVM_ADDR2=NVM_ADDR1+1
	.EQU NVM_DATA0=NVM_ADDR0+4
	.EQU NVM_CMD=NVM_ADDR0+0xA
	.EQU NVM_CTRLA=NVM_ADDR0+0xB
	.EQU NVM_CTRLB=NVM_ADDR0+0xC
	.EQU NVM_STATUS=NVM_ADDR0+0xF
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F
	.EQU GPIO0=0x00
	.EQU GPIO1=0x01
	.EQU GPIO2=0x02
	.EQU GPIO3=0x03

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x2000
	.EQU __SRAM_END=0x3FFF
	.EQU __DSTACK_SIZE=0x0800
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD2M
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	PUSH R26
	PUSH R27
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	POP  R27
	POP  R26
	ICALL
	.ENDM

	.MACRO __CALL2EX
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	CALL __EEPROMRDD
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z
	MOVW R30,R0
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;GPIO0-GPIO3 INITIALIZATION VALUES
	.EQU __GPIO0_INIT=0x00
	.EQU __GPIO1_INIT=0x00
	.EQU __GPIO2_INIT=0x00
	.EQU __GPIO3_INIT=0x00

;GLOBAL REGISTER VARIABLES INITIALIZATION VALUES
	.EQU __R2_INIT=0x00
	.EQU __R3_INIT=0x00
	.EQU __R4_INIT=0x00
	.EQU __R5_INIT=0x00
	.EQU __R6_INIT=0x00
	.EQU __R7_INIT=0x00
	.EQU __R8_INIT=0x00
	.EQU __R9_INIT=0x00
	.EQU __R10_INIT=0x00
	.EQU __R11_INIT=0x00
	.EQU __R12_INIT=0x00
	.EQU __R13_INIT=0x00
	.EQU __R14_INIT=0x00

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  _tcc0_overflow_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  _tcc1_compare_capture_a_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

_tbl10_G100:
	.DB  0x10,0x27,0xE8,0x3,0x64,0x0,0xA,0x0
	.DB  0x1,0x0
_tbl16_G100:
	.DB  0x0,0x10,0x0,0x1,0x10,0x0,0x1,0x0

__RESET:
	CLI
	CLR  R30

;MEMORY MAPPED EEPROM ACCESS IS USED
	LDS  R31,NVM_CTRLB
	ORI  R31,0x08
	STS  NVM_CTRLB,R31

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,0xD8
	OUT  CCP,R31
	STS  PMIC_CTRL,R30

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,LOW(__SRAM_START)
	LDI  R27,HIGH(__SRAM_START)
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

	OUT  RAMPZ,R24

;GPIO0-GPIO3 INITIALIZATION
	LDI  R30,__GPIO0_INIT
	OUT  GPIO0,R30
	;__GPIO1_INIT = __GPIO0_INIT
	OUT  GPIO1,R30
	;__GPIO2_INIT = __GPIO0_INIT
	OUT  GPIO2,R30
	;__GPIO3_INIT = __GPIO0_INIT
	OUT  GPIO3,R30

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0x00

	.DSEG
	.ORG 0x2800

	.CSEG
;/*******************************************************
;This program was created by the CodeWizardAVR V3.34
;Automatic Program Generator
;© Copyright 1998-2018 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;Version :
;Date    : 12/30/2018
;Author  :
;Company :
;Comments:
;
;
;Chip type               : ATxmega128B1
;Program type            : Application
;AVR Core Clock frequency: 2.000000 MHz
;Memory model            : Small
;Data Stack size         : 2048
;*******************************************************/
;
;// I/O Registers definitions
;#include <xmega128b1.h>
;
;// Standard Input/Output functions
;#include <stdio.h>
;#include <stdint.h>
;
;// Clock System initialization function
;#include "clock_init.h"
;
;// Event System initialization function
;#include "event_system_init.h"
;
;// I/O Ports initialization function
;#include "ports_init.h"
;
;// Timers/Counters initialization functions
;#include "timers_init.h"
;
;// Declare your global variables here
;
;void main(void)
; 0000 002C {

	.CSEG
_main:
; .FSTART _main
; 0000 002D // Declare your local variables here
; 0000 002E unsigned char n;
; 0000 002F 
; 0000 0030 // Interrupt system initialization
; 0000 0031 // Optimize for speed
; 0000 0032 #pragma optsize-
; 0000 0033 // Make sure the interrupts are disabled
; 0000 0034 #asm("cli")
;	n -> R17
	CLI
; 0000 0035 // Low level interrupt: Off
; 0000 0036 // Round-robin scheduling for low level interrupt: Off
; 0000 0037 // Medium level interrupt: Off
; 0000 0038 // High level interrupt: On
; 0000 0039 // The interrupt vectors will be placed at the start of the Application FLASH section
; 0000 003A n=(PMIC.CTRL & (~(PMIC_RREN_bm | PMIC_IVSEL_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm))) |
; 0000 003B 	PMIC_HILVLEN_bm;
	LDS  R30,162
	ANDI R30,LOW(0x38)
	ORI  R30,4
	MOV  R17,R30
; 0000 003C CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0000 003D PMIC.CTRL=n;
	STS  162,R17
; 0000 003E // Set the default priority for round-robin scheduling
; 0000 003F PMIC.INTPRI=0x00;
	LDI  R30,LOW(0)
	STS  161,R30
; 0000 0040 // Restore optimization for size if needed
; 0000 0041 #pragma optsize_default
; 0000 0042 
; 0000 0043 // System clocks initialization
; 0000 0044 system_clocks_init();
	RCALL _system_clocks_init
; 0000 0045 
; 0000 0046 // Event system initialization
; 0000 0047 event_system_init();
	RCALL _event_system_init
; 0000 0048 
; 0000 0049 // Ports initialization
; 0000 004A ports_init();
	RCALL _ports_init
; 0000 004B 
; 0000 004C // Virtual Ports initialization
; 0000 004D vports_init();
	RCALL _vports_init
; 0000 004E 
; 0000 004F // Timer/Counter TCC0 initialization
; 0000 0050 tcc0_init();
	RCALL _tcc0_init
; 0000 0051 
; 0000 0052 // Timer/Counter TCC1 initialization
; 0000 0053 tcc1_init();
	RCALL _tcc1_init
; 0000 0054 
; 0000 0055 // Globally enable interrupts
; 0000 0056 #asm("sei")
	SEI
; 0000 0057 
; 0000 0058 while (1)
_0x3:
; 0000 0059       {
; 0000 005A       // Place your code here
; 0000 005B 	  if((PORTE.IN & 0x01) && getTime() & 0x100)
	LDS  R30,1672
	ANDI R30,LOW(0x1)
	BREQ _0x7
	RCALL _getTime
	ANDI R31,HIGH(0x100)
	BRNE _0x8
_0x7:
	RJMP _0x6
_0x8:
; 0000 005C 	  {
; 0000 005D 		  PORTB.OUT=0xF0;
	LDI  R30,LOW(240)
	RJMP _0xB
; 0000 005E 	  }
; 0000 005F 	  else
_0x6:
; 0000 0060 	  {
; 0000 0061 		PORTB.OUT=0x00;
	LDI  R30,LOW(0)
_0xB:
	STS  1572,R30
; 0000 0062 	  }
; 0000 0063 
; 0000 0064       }
	RJMP _0x3
; 0000 0065 }
_0xA:
	RJMP _0xA
; .FEND
;/*******************************************************
;System clock initialization created by the
;CodeWizardAVR V3.34 Automatic Program Generator
;© Copyright 1998-2018 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;*******************************************************/
;
;// I/O Registers definitions
;#include <xmega128b1.h>
;
;// Standard definitions
;#include <stddef.h>
;
;// System Clocks initialization
;void system_clocks_init(void)
; 0001 0012 {

	.CSEG
_system_clocks_init:
; .FSTART _system_clocks_init
; 0001 0013 unsigned char n,s;
; 0001 0014 
; 0001 0015 // Optimize for speed
; 0001 0016 #pragma optsize-
; 0001 0017 // Save interrupts enabled/disabled state
; 0001 0018 s=SREG;
	ST   -Y,R17
	ST   -Y,R16
;	n -> R17
;	s -> R16
	IN   R16,63
; 0001 0019 // Disable interrupts
; 0001 001A #asm("cli")
	CLI
; 0001 001B 
; 0001 001C // Internal 2 MHz RC oscillator initialization
; 0001 001D // Enable the internal 2 MHz RC oscillator
; 0001 001E OSC.CTRL|=OSC_RC2MEN_bm;
	LDS  R30,80
	ORI  R30,1
	STS  80,R30
; 0001 001F // Wait for the internal 2 MHz RC oscillator to stabilize
; 0001 0020 while ((OSC.STATUS & OSC_RC2MRDY_bm)==0);
_0x20003:
	LDS  R30,81
	ANDI R30,LOW(0x1)
	BREQ _0x20003
; 0001 0021 
; 0001 0022 // Disable the auto-calibration of the internal 2 MHz RC oscillator
; 0001 0023 DFLLRC2M.CTRL=0<<DFLL_ENABLE_bp;
	LDI  R30,LOW(0)
	STS  104,R30
; 0001 0024 
; 0001 0025 // System Clock prescaler A division factor: 1
; 0001 0026 // System Clock prescalers B & C division factors: B:1, C:1
; 0001 0027 // ClkPer4: 2000.000 kHz
; 0001 0028 // ClkPer2: 2000.000 kHz
; 0001 0029 // ClkPer:  2000.000 kHz
; 0001 002A // ClkCPU:  2000.000 kHz
; 0001 002B n=(CLK.PSCTRL & (~(CLK_PSADIV_gm | CLK_PSBCDIV1_bm | CLK_PSBCDIV0_bm))) |
; 0001 002C 	CLK_PSADIV_1_gc | CLK_PSBCDIV_1_1_gc;
	LDS  R30,65
	ANDI R30,LOW(0x80)
	MOV  R17,R30
; 0001 002D CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0001 002E CLK.PSCTRL=n;
	STS  65,R17
; 0001 002F 
; 0001 0030 // Select the system clock source: 2 MHz Internal RC Osc.
; 0001 0031 n=(CLK.CTRL & (~CLK_SCLKSEL_gm)) | CLK_SCLKSEL_RC2M_gc;
	LDS  R30,64
	ANDI R30,LOW(0xF8)
	MOV  R17,R30
; 0001 0032 CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0001 0033 CLK.CTRL=n;
	STS  64,R17
; 0001 0034 
; 0001 0035 // Disable the unused oscillators: 32 kHz, 32 MHz, external clock/crystal oscillator, PLL
; 0001 0036 OSC.CTRL&= ~(OSC_RC32KEN_bm | OSC_RC32MEN_bm | OSC_XOSCEN_bm | OSC_PLLEN_bm);
	LDS  R30,80
	ANDI R30,LOW(0xE1)
	STS  80,R30
; 0001 0037 
; 0001 0038 // ClkPer output disabled
; 0001 0039 PORTCFG.CLKEVOUT&= ~(PORTCFG_CLKOUTSEL_gm | PORTCFG_CLKOUT_gm);
	LDS  R30,180
	ANDI R30,LOW(0xF0)
	STS  180,R30
; 0001 003A // Restore interrupts enabled/disabled state
; 0001 003B SREG=s;
	OUT  0x3F,R16
; 0001 003C // Restore optimization for size if needed
; 0001 003D #pragma optsize_default
; 0001 003E }
	RJMP _0x2060001
; .FEND
;
;/*******************************************************
;Event System initialization created by the
;CodeWizardAVR V3.34 Automatic Program Generator
;© Copyright 1998-2018 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;*******************************************************/
;
;// I/O Registers definitions
;#include <xmega128b1.h>
;
;// Event System initialization
;void event_system_init(void)
; 0002 000F {

	.CSEG
_event_system_init:
; .FSTART _event_system_init
; 0002 0010 // Event System Channel 0 source: Port A, Pin0
; 0002 0011 EVSYS.CH0MUX=EVSYS_CHMUX_PORTA_PIN0_gc;
	LDI  R30,LOW(80)
	STS  384,R30
; 0002 0012 // Event System Channel 1 source: None
; 0002 0013 EVSYS.CH1MUX=EVSYS_CHMUX_OFF_gc;
	LDI  R30,LOW(0)
	STS  385,R30
; 0002 0014 // Event System Channel 2 source: None
; 0002 0015 EVSYS.CH2MUX=EVSYS_CHMUX_OFF_gc;
	STS  386,R30
; 0002 0016 // Event System Channel 3 source: None
; 0002 0017 EVSYS.CH3MUX=EVSYS_CHMUX_OFF_gc;
	STS  387,R30
; 0002 0018 // Event System Channel 0 Digital Filter Coefficient: 8 Samples
; 0002 0019 // Quadrature Decoder: Off
; 0002 001A EVSYS.CH0CTRL=(EVSYS.CH0CTRL & (~(EVSYS_QDIRM_gm | EVSYS_QDIEN_bm | EVSYS_QDEN_bm | EVSYS_DIGFILT_gm))) |
; 0002 001B 	EVSYS_DIGFILT_8SAMPLES_gc;
	LDS  R30,392
	ANDI R30,LOW(0x80)
	ORI  R30,LOW(0x7)
	STS  392,R30
; 0002 001C // Event System Channel 1 Digital Filter Coefficient: 1 Sample
; 0002 001D EVSYS.CH1CTRL=EVSYS_DIGFILT_1SAMPLE_gc;
	LDI  R30,LOW(0)
	STS  393,R30
; 0002 001E // Event System Channel 2 Digital Filter Coefficient: 1 Sample
; 0002 001F // Quadrature Decoder: Off
; 0002 0020 EVSYS.CH2CTRL=(EVSYS.CH2CTRL & (~(EVSYS_QDIRM_gm | EVSYS_QDIEN_bm | EVSYS_QDEN_bm | EVSYS_DIGFILT_gm))) |
; 0002 0021 	EVSYS_DIGFILT_1SAMPLE_gc;
	LDS  R30,394
	ANDI R30,LOW(0x80)
	STS  394,R30
; 0002 0022 // Event System Channel 3 Digital Filter Coefficient: 1 Sample
; 0002 0023 EVSYS.CH3CTRL=EVSYS_DIGFILT_1SAMPLE_gc;
	LDI  R30,LOW(0)
	STS  395,R30
; 0002 0024 
; 0002 0025 // Event System Channel output: Disabled
; 0002 0026 PORTCFG.CLKEVOUT&= ~PORTCFG_EVOUT_gm;
	LDS  R30,180
	ANDI R30,LOW(0xCF)
	STS  180,R30
; 0002 0027 PORTCFG.EVOUTSEL&= ~PORTCFG_EVOUTSEL_gm;
	LDS  R30,182
	ANDI R30,LOW(0xF3)
	STS  182,R30
; 0002 0028 }
	RET
; .FEND
;
;/*******************************************************
;I/O Ports initialization created by the
;CodeWizardAVR V3.34 Automatic Program Generator
;© Copyright 1998-2018 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;*******************************************************/
;
;// I/O Registers definitions
;#include <xmega128b1.h>
;
;// Ports initialization
;void ports_init(void)
; 0003 000F {

	.CSEG
_ports_init:
; .FSTART _ports_init
; 0003 0010 // PORTA initialization
; 0003 0011 // OUT register
; 0003 0012 PORTA.OUT=0x00;
	LDI  R30,LOW(0)
	STS  1540,R30
; 0003 0013 // Pin0: Input
; 0003 0014 // Pin1: Input
; 0003 0015 // Pin2: Input
; 0003 0016 // Pin3: Input
; 0003 0017 // Pin4: Input
; 0003 0018 // Pin5: Input
; 0003 0019 // Pin6: Input
; 0003 001A // Pin7: Input
; 0003 001B PORTA.DIR=0x00;
	STS  1536,R30
; 0003 001C // Pin0 Output/Pull configuration: Totempole/Pull-up (on input)
; 0003 001D // Pin0 Input/Sense configuration: Sense falling edge
; 0003 001E // Pin0 Inverted: Off
; 0003 001F PORTA.PIN0CTRL=PORT_OPC_PULLUP_gc | PORT_ISC_FALLING_gc;
	LDI  R30,LOW(26)
	STS  1552,R30
; 0003 0020 // Pin1 Output/Pull configuration: Totempole/No
; 0003 0021 // Pin1 Input/Sense configuration: Sense both edges
; 0003 0022 // Pin1 Inverted: Off
; 0003 0023 PORTA.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	LDI  R30,LOW(0)
	STS  1553,R30
; 0003 0024 // Pin2 Output/Pull configuration: Totempole/No
; 0003 0025 // Pin2 Input/Sense configuration: Sense both edges
; 0003 0026 // Pin2 Inverted: Off
; 0003 0027 PORTA.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1554,R30
; 0003 0028 // Pin3 Output/Pull configuration: Totempole/No
; 0003 0029 // Pin3 Input/Sense configuration: Sense both edges
; 0003 002A // Pin3 Inverted: Off
; 0003 002B PORTA.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1555,R30
; 0003 002C // Pin4 Output/Pull configuration: Totempole/No
; 0003 002D // Pin4 Input/Sense configuration: Sense both edges
; 0003 002E // Pin4 Inverted: Off
; 0003 002F PORTA.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1556,R30
; 0003 0030 // Pin5 Output/Pull configuration: Totempole/No
; 0003 0031 // Pin5 Input/Sense configuration: Sense both edges
; 0003 0032 // Pin5 Inverted: Off
; 0003 0033 PORTA.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1557,R30
; 0003 0034 // Pin6 Output/Pull configuration: Totempole/No
; 0003 0035 // Pin6 Input/Sense configuration: Sense both edges
; 0003 0036 // Pin6 Inverted: Off
; 0003 0037 PORTA.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1558,R30
; 0003 0038 // Pin7 Output/Pull configuration: Totempole/No
; 0003 0039 // Pin7 Input/Sense configuration: Sense both edges
; 0003 003A // Pin7 Inverted: Off
; 0003 003B PORTA.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1559,R30
; 0003 003C // Interrupt 0 level: Disabled
; 0003 003D // Interrupt 1 level: Disabled
; 0003 003E PORTA.INTCTRL=(PORTA.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0003 003F 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1545
	ANDI R30,LOW(0xF0)
	STS  1545,R30
; 0003 0040 // Pin0 Pin Change interrupt 0: Off
; 0003 0041 // Pin1 Pin Change interrupt 0: Off
; 0003 0042 // Pin2 Pin Change interrupt 0: Off
; 0003 0043 // Pin3 Pin Change interrupt 0: Off
; 0003 0044 // Pin4 Pin Change interrupt 0: Off
; 0003 0045 // Pin5 Pin Change interrupt 0: Off
; 0003 0046 // Pin6 Pin Change interrupt 0: Off
; 0003 0047 // Pin7 Pin Change interrupt 0: Off
; 0003 0048 PORTA.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1546,R30
; 0003 0049 // Pin0 Pin Change interrupt 1: Off
; 0003 004A // Pin1 Pin Change interrupt 1: Off
; 0003 004B // Pin2 Pin Change interrupt 1: Off
; 0003 004C // Pin3 Pin Change interrupt 1: Off
; 0003 004D // Pin4 Pin Change interrupt 1: Off
; 0003 004E // Pin5 Pin Change interrupt 1: Off
; 0003 004F // Pin6 Pin Change interrupt 1: Off
; 0003 0050 // Pin7 Pin Change interrupt 1: Off
; 0003 0051 PORTA.INT1MASK=0x00;
	STS  1547,R30
; 0003 0052 
; 0003 0053 // PORTB initialization
; 0003 0054 // OUT register
; 0003 0055 PORTB.OUT=0xF0;
	LDI  R30,LOW(240)
	STS  1572,R30
; 0003 0056 // Pin0: Input
; 0003 0057 // Pin1: Input
; 0003 0058 // Pin2: Input
; 0003 0059 // Pin3: Input
; 0003 005A // Pin4: Output
; 0003 005B // Pin5: Output
; 0003 005C // Pin6: Output
; 0003 005D // Pin7: Output
; 0003 005E PORTB.DIR=0xF0;
	STS  1568,R30
; 0003 005F // Pin0 Output/Pull configuration: Totempole/No
; 0003 0060 // Pin0 Input/Sense configuration: Sense both edges
; 0003 0061 // Pin0 Inverted: Off
; 0003 0062 PORTB.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	LDI  R30,LOW(0)
	STS  1584,R30
; 0003 0063 // Pin1 Output/Pull configuration: Totempole/No
; 0003 0064 // Pin1 Input/Sense configuration: Sense both edges
; 0003 0065 // Pin1 Inverted: Off
; 0003 0066 PORTB.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1585,R30
; 0003 0067 // Pin2 Output/Pull configuration: Totempole/No
; 0003 0068 // Pin2 Input/Sense configuration: Sense both edges
; 0003 0069 // Pin2 Inverted: Off
; 0003 006A PORTB.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1586,R30
; 0003 006B // Pin3 Output/Pull configuration: Totempole/No
; 0003 006C // Pin3 Input/Sense configuration: Sense both edges
; 0003 006D // Pin3 Inverted: Off
; 0003 006E PORTB.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1587,R30
; 0003 006F // Pin4 Output/Pull configuration: Totempole/No
; 0003 0070 // Pin4 Input/Sense configuration: Sense both edges
; 0003 0071 // Pin4 Inverted: Off
; 0003 0072 PORTB.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1588,R30
; 0003 0073 // Pin5 Output/Pull configuration: Totempole/No
; 0003 0074 // Pin5 Input/Sense configuration: Sense both edges
; 0003 0075 // Pin5 Inverted: Off
; 0003 0076 PORTB.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1589,R30
; 0003 0077 // Pin6 Output/Pull configuration: Totempole/No
; 0003 0078 // Pin6 Input/Sense configuration: Sense both edges
; 0003 0079 // Pin6 Inverted: Off
; 0003 007A PORTB.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1590,R30
; 0003 007B // Pin7 Output/Pull configuration: Totempole/No
; 0003 007C // Pin7 Input/Sense configuration: Sense both edges
; 0003 007D // Pin7 Inverted: Off
; 0003 007E PORTB.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1591,R30
; 0003 007F // Interrupt 0 level: Disabled
; 0003 0080 // Interrupt 1 level: Disabled
; 0003 0081 PORTB.INTCTRL=(PORTB.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0003 0082 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1577
	ANDI R30,LOW(0xF0)
	STS  1577,R30
; 0003 0083 // Pin0 Pin Change interrupt 0: Off
; 0003 0084 // Pin1 Pin Change interrupt 0: Off
; 0003 0085 // Pin2 Pin Change interrupt 0: Off
; 0003 0086 // Pin3 Pin Change interrupt 0: Off
; 0003 0087 // Pin4 Pin Change interrupt 0: Off
; 0003 0088 // Pin5 Pin Change interrupt 0: Off
; 0003 0089 // Pin6 Pin Change interrupt 0: Off
; 0003 008A // Pin7 Pin Change interrupt 0: Off
; 0003 008B PORTB.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1578,R30
; 0003 008C // Pin0 Pin Change interrupt 1: Off
; 0003 008D // Pin1 Pin Change interrupt 1: Off
; 0003 008E // Pin2 Pin Change interrupt 1: Off
; 0003 008F // Pin3 Pin Change interrupt 1: Off
; 0003 0090 // Pin4 Pin Change interrupt 1: Off
; 0003 0091 // Pin5 Pin Change interrupt 1: Off
; 0003 0092 // Pin6 Pin Change interrupt 1: Off
; 0003 0093 // Pin7 Pin Change interrupt 1: Off
; 0003 0094 PORTB.INT1MASK=0x00;
	STS  1579,R30
; 0003 0095 
; 0003 0096 // PORTC initialization
; 0003 0097 // OUT register
; 0003 0098 PORTC.OUT=0x00;
	STS  1604,R30
; 0003 0099 // Pin0: Input
; 0003 009A // Pin1: Input
; 0003 009B // Pin2: Input
; 0003 009C // Pin3: Input
; 0003 009D // Pin4: Input
; 0003 009E // Pin5: Input
; 0003 009F // Pin6: Input
; 0003 00A0 // Pin7: Input
; 0003 00A1 PORTC.DIR=0x00;
	STS  1600,R30
; 0003 00A2 // Pin0 Output/Pull configuration: Totempole/No
; 0003 00A3 // Pin0 Input/Sense configuration: Sense both edges
; 0003 00A4 // Pin0 Inverted: Off
; 0003 00A5 PORTC.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1616,R30
; 0003 00A6 // Pin1 Output/Pull configuration: Totempole/No
; 0003 00A7 // Pin1 Input/Sense configuration: Sense both edges
; 0003 00A8 // Pin1 Inverted: Off
; 0003 00A9 PORTC.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1617,R30
; 0003 00AA // Pin2 Output/Pull configuration: Totempole/No
; 0003 00AB // Pin2 Input/Sense configuration: Sense both edges
; 0003 00AC // Pin2 Inverted: Off
; 0003 00AD PORTC.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1618,R30
; 0003 00AE // Pin3 Output/Pull configuration: Totempole/No
; 0003 00AF // Pin3 Input/Sense configuration: Sense both edges
; 0003 00B0 // Pin3 Inverted: Off
; 0003 00B1 PORTC.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1619,R30
; 0003 00B2 // Pin4 Output/Pull configuration: Totempole/No
; 0003 00B3 // Pin4 Input/Sense configuration: Sense both edges
; 0003 00B4 // Pin4 Inverted: Off
; 0003 00B5 PORTC.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1620,R30
; 0003 00B6 // Pin5 Output/Pull configuration: Totempole/No
; 0003 00B7 // Pin5 Input/Sense configuration: Sense both edges
; 0003 00B8 // Pin5 Inverted: Off
; 0003 00B9 PORTC.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1621,R30
; 0003 00BA // Pin6 Output/Pull configuration: Totempole/No
; 0003 00BB // Pin6 Input/Sense configuration: Sense both edges
; 0003 00BC // Pin6 Inverted: Off
; 0003 00BD PORTC.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1622,R30
; 0003 00BE // Pin7 Output/Pull configuration: Totempole/No
; 0003 00BF // Pin7 Input/Sense configuration: Sense both edges
; 0003 00C0 // Pin7 Inverted: Off
; 0003 00C1 PORTC.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1623,R30
; 0003 00C2 // PORTC Peripheral Output Remapping
; 0003 00C3 // OC0A Output: Pin 0
; 0003 00C4 // OC0B Output: Pin 1
; 0003 00C5 // OC0C Output: Pin 2
; 0003 00C6 // OC0D Output: Pin 3
; 0003 00C7 // USART0 XCK: Pin 1
; 0003 00C8 // USART0 RXD: Pin 2
; 0003 00C9 // USART0 TXD: Pin 3
; 0003 00CA // SPI MOSI: Pin 5
; 0003 00CB // SPI SCK: Pin 7
; 0003 00CC PORTC.REMAP=(0<<PORT_SPI_bp) | (0<<PORT_USART0_bp) | (0<<PORT_TC0D_bp) | (0<<PORT_TC0C_bp) | (0<<PORT_TC0B_bp) | (0<<POR ...
	STS  1614,R30
; 0003 00CD // Interrupt 0 level: Disabled
; 0003 00CE // Interrupt 1 level: Disabled
; 0003 00CF PORTC.INTCTRL=(PORTC.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0003 00D0 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1609
	ANDI R30,LOW(0xF0)
	STS  1609,R30
; 0003 00D1 // Pin0 Pin Change interrupt 0: Off
; 0003 00D2 // Pin1 Pin Change interrupt 0: Off
; 0003 00D3 // Pin2 Pin Change interrupt 0: Off
; 0003 00D4 // Pin3 Pin Change interrupt 0: Off
; 0003 00D5 // Pin4 Pin Change interrupt 0: Off
; 0003 00D6 // Pin5 Pin Change interrupt 0: Off
; 0003 00D7 // Pin6 Pin Change interrupt 0: Off
; 0003 00D8 // Pin7 Pin Change interrupt 0: Off
; 0003 00D9 PORTC.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1610,R30
; 0003 00DA // Pin0 Pin Change interrupt 1: Off
; 0003 00DB // Pin1 Pin Change interrupt 1: Off
; 0003 00DC // Pin2 Pin Change interrupt 1: Off
; 0003 00DD // Pin3 Pin Change interrupt 1: Off
; 0003 00DE // Pin4 Pin Change interrupt 1: Off
; 0003 00DF // Pin5 Pin Change interrupt 1: Off
; 0003 00E0 // Pin6 Pin Change interrupt 1: Off
; 0003 00E1 // Pin7 Pin Change interrupt 1: Off
; 0003 00E2 PORTC.INT1MASK=0x00;
	STS  1611,R30
; 0003 00E3 
; 0003 00E4 // PORTD initialization
; 0003 00E5 // OUT register
; 0003 00E6 PORTD.OUT=0x00;
	STS  1636,R30
; 0003 00E7 // Pin0: Input
; 0003 00E8 // Pin1: Input
; 0003 00E9 // Pin2: Input
; 0003 00EA PORTD.DIR=0x00;
	STS  1632,R30
; 0003 00EB // Pin0 Output/Pull configuration: Totempole/No
; 0003 00EC // Pin0 Input/Sense configuration: Sense both edges
; 0003 00ED // Pin0 Inverted: Off
; 0003 00EE PORTD.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1648,R30
; 0003 00EF // Pin1 Output/Pull configuration: Totempole/No
; 0003 00F0 // Pin1 Input/Sense configuration: Sense both edges
; 0003 00F1 // Pin1 Inverted: Off
; 0003 00F2 PORTD.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1649,R30
; 0003 00F3 // Pin2 Output/Pull configuration: Totempole/No
; 0003 00F4 // Pin2 Input/Sense configuration: Sense both edges
; 0003 00F5 // Pin2 Inverted: Off
; 0003 00F6 PORTD.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1650,R30
; 0003 00F7 // Interrupt 0 level: Disabled
; 0003 00F8 // Interrupt 1 level: Disabled
; 0003 00F9 PORTD.INTCTRL=(PORTD.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0003 00FA 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1641
	ANDI R30,LOW(0xF0)
	STS  1641,R30
; 0003 00FB // Pin0 Pin Change interrupt 0: Off
; 0003 00FC // Pin1 Pin Change interrupt 0: Off
; 0003 00FD // Pin2 Pin Change interrupt 0: Off
; 0003 00FE PORTD.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1642,R30
; 0003 00FF // Pin0 Pin Change interrupt 1: Off
; 0003 0100 // Pin1 Pin Change interrupt 1: Off
; 0003 0101 // Pin2 Pin Change interrupt 1: Off
; 0003 0102 PORTD.INT1MASK=0x00;
	STS  1643,R30
; 0003 0103 
; 0003 0104 // PORTE initialization
; 0003 0105 // OUT register
; 0003 0106 PORTE.OUT=0x00;
	STS  1668,R30
; 0003 0107 // Pin0: Input
; 0003 0108 // Pin1: Input
; 0003 0109 // Pin2: Input
; 0003 010A // Pin3: Input
; 0003 010B // Pin4: Input
; 0003 010C // Pin5: Output
; 0003 010D // Pin6: Input
; 0003 010E // Pin7: Input
; 0003 010F PORTE.DIR=0x20;
	LDI  R30,LOW(32)
	STS  1664,R30
; 0003 0110 // Pin0 Output/Pull configuration: Totempole/Pull-up (on input)
; 0003 0111 // Pin0 Input/Sense configuration: Sense both edges
; 0003 0112 // Pin0 Inverted: Off
; 0003 0113 PORTE.PIN0CTRL=PORT_OPC_PULLUP_gc | PORT_ISC_BOTHEDGES_gc;
	LDI  R30,LOW(24)
	STS  1680,R30
; 0003 0114 // Pin1 Output/Pull configuration: Totempole/Pull-up (on input)
; 0003 0115 // Pin1 Input/Sense configuration: Sense both edges
; 0003 0116 // Pin1 Inverted: Off
; 0003 0117 PORTE.PIN1CTRL=PORT_OPC_PULLUP_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1681,R30
; 0003 0118 // Pin2 Output/Pull configuration: Totempole/Pull-up (on input)
; 0003 0119 // Pin2 Input/Sense configuration: Sense both edges
; 0003 011A // Pin2 Inverted: Off
; 0003 011B PORTE.PIN2CTRL=PORT_OPC_PULLUP_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1682,R30
; 0003 011C // Pin3 Output/Pull configuration: Totempole/Pull-up (on input)
; 0003 011D // Pin3 Input/Sense configuration: Sense both edges
; 0003 011E // Pin3 Inverted: Off
; 0003 011F PORTE.PIN3CTRL=PORT_OPC_PULLUP_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1683,R30
; 0003 0120 // Pin4 Output/Pull configuration: Totempole/No
; 0003 0121 // Pin4 Input/Sense configuration: Sense both edges
; 0003 0122 // Pin4 Inverted: Off
; 0003 0123 PORTE.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	LDI  R30,LOW(0)
	STS  1684,R30
; 0003 0124 // Pin5 Output/Pull configuration: Totempole/No
; 0003 0125 // Pin5 Input/Sense configuration: Sense both edges
; 0003 0126 // Pin5 Inverted: Off
; 0003 0127 PORTE.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1685,R30
; 0003 0128 // Pin6 Output/Pull configuration: Totempole/No
; 0003 0129 // Pin6 Input/Sense configuration: Sense both edges
; 0003 012A // Pin6 Inverted: Off
; 0003 012B PORTE.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1686,R30
; 0003 012C // Pin7 Output/Pull configuration: Totempole/No
; 0003 012D // Pin7 Input/Sense configuration: Sense both edges
; 0003 012E // Pin7 Inverted: Off
; 0003 012F PORTE.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1687,R30
; 0003 0130 // PORTE Peripheral Output Remapping
; 0003 0131 // OC0A Output: Pin 0
; 0003 0132 // OC0B Output: Pin 1
; 0003 0133 // OC0C Output: Pin 2
; 0003 0134 // OC0D Output: Pin 3
; 0003 0135 // USART0 XCK: Pin 1
; 0003 0136 // USART0 RXD: Pin 2
; 0003 0137 // USART0 TXD: Pin 3
; 0003 0138 // SPI MOSI: Pin -1
; 0003 0139 // SPI SCK: Pin -1
; 0003 013A PORTE.REMAP=(0<<PORT_SPI_bp) | (0<<PORT_USART0_bp) | (0<<PORT_TC0D_bp) | (0<<PORT_TC0C_bp) | (0<<PORT_TC0B_bp) | (0<<POR ...
	STS  1678,R30
; 0003 013B // Interrupt 0 level: Disabled
; 0003 013C // Interrupt 1 level: Disabled
; 0003 013D PORTE.INTCTRL=(PORTE.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0003 013E 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1673
	ANDI R30,LOW(0xF0)
	STS  1673,R30
; 0003 013F // Pin0 Pin Change interrupt 0: Off
; 0003 0140 // Pin1 Pin Change interrupt 0: Off
; 0003 0141 // Pin2 Pin Change interrupt 0: Off
; 0003 0142 // Pin3 Pin Change interrupt 0: Off
; 0003 0143 // Pin4 Pin Change interrupt 0: Off
; 0003 0144 // Pin5 Pin Change interrupt 0: Off
; 0003 0145 // Pin6 Pin Change interrupt 0: Off
; 0003 0146 // Pin7 Pin Change interrupt 0: Off
; 0003 0147 PORTE.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1674,R30
; 0003 0148 // Pin0 Pin Change interrupt 1: Off
; 0003 0149 // Pin1 Pin Change interrupt 1: Off
; 0003 014A // Pin2 Pin Change interrupt 1: Off
; 0003 014B // Pin3 Pin Change interrupt 1: Off
; 0003 014C // Pin4 Pin Change interrupt 1: Off
; 0003 014D // Pin5 Pin Change interrupt 1: Off
; 0003 014E // Pin6 Pin Change interrupt 1: Off
; 0003 014F // Pin7 Pin Change interrupt 1: Off
; 0003 0150 PORTE.INT1MASK=0x00;
	STS  1675,R30
; 0003 0151 
; 0003 0152 // PORTG initialization
; 0003 0153 // OUT register
; 0003 0154 PORTG.OUT=0x00;
	STS  1732,R30
; 0003 0155 // Pin0: Input
; 0003 0156 // Pin1: Input
; 0003 0157 // Pin2: Input
; 0003 0158 // Pin3: Input
; 0003 0159 // Pin4: Input
; 0003 015A // Pin5: Input
; 0003 015B // Pin6: Input
; 0003 015C // Pin7: Input
; 0003 015D PORTG.DIR=0x00;
	STS  1728,R30
; 0003 015E // Pin0 Output/Pull configuration: Totempole/No
; 0003 015F // Pin0 Input/Sense configuration: Sense both edges
; 0003 0160 // Pin0 Inverted: Off
; 0003 0161 PORTG.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1744,R30
; 0003 0162 // Pin1 Output/Pull configuration: Totempole/No
; 0003 0163 // Pin1 Input/Sense configuration: Sense both edges
; 0003 0164 // Pin1 Inverted: Off
; 0003 0165 PORTG.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1745,R30
; 0003 0166 // Pin2 Output/Pull configuration: Totempole/No
; 0003 0167 // Pin2 Input/Sense configuration: Sense both edges
; 0003 0168 // Pin2 Inverted: Off
; 0003 0169 PORTG.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1746,R30
; 0003 016A // Pin3 Output/Pull configuration: Totempole/No
; 0003 016B // Pin3 Input/Sense configuration: Sense both edges
; 0003 016C // Pin3 Inverted: Off
; 0003 016D PORTG.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1747,R30
; 0003 016E // Pin4 Output/Pull configuration: Totempole/No
; 0003 016F // Pin4 Input/Sense configuration: Sense both edges
; 0003 0170 // Pin4 Inverted: Off
; 0003 0171 PORTG.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1748,R30
; 0003 0172 // Pin5 Output/Pull configuration: Totempole/No
; 0003 0173 // Pin5 Input/Sense configuration: Sense both edges
; 0003 0174 // Pin5 Inverted: Off
; 0003 0175 PORTG.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1749,R30
; 0003 0176 // Pin6 Output/Pull configuration: Totempole/No
; 0003 0177 // Pin6 Input/Sense configuration: Sense both edges
; 0003 0178 // Pin6 Inverted: Off
; 0003 0179 PORTG.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1750,R30
; 0003 017A // Pin7 Output/Pull configuration: Totempole/No
; 0003 017B // Pin7 Input/Sense configuration: Sense both edges
; 0003 017C // Pin7 Inverted: Off
; 0003 017D PORTG.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1751,R30
; 0003 017E // Interrupt 0 level: Disabled
; 0003 017F // Interrupt 1 level: Disabled
; 0003 0180 PORTG.INTCTRL=(PORTG.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0003 0181 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1737
	ANDI R30,LOW(0xF0)
	STS  1737,R30
; 0003 0182 // Pin0 Pin Change interrupt 0: Off
; 0003 0183 // Pin1 Pin Change interrupt 0: Off
; 0003 0184 // Pin2 Pin Change interrupt 0: Off
; 0003 0185 // Pin3 Pin Change interrupt 0: Off
; 0003 0186 // Pin4 Pin Change interrupt 0: Off
; 0003 0187 // Pin5 Pin Change interrupt 0: Off
; 0003 0188 // Pin6 Pin Change interrupt 0: Off
; 0003 0189 // Pin7 Pin Change interrupt 0: Off
; 0003 018A PORTG.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1738,R30
; 0003 018B // Pin0 Pin Change interrupt 1: Off
; 0003 018C // Pin1 Pin Change interrupt 1: Off
; 0003 018D // Pin2 Pin Change interrupt 1: Off
; 0003 018E // Pin3 Pin Change interrupt 1: Off
; 0003 018F // Pin4 Pin Change interrupt 1: Off
; 0003 0190 // Pin5 Pin Change interrupt 1: Off
; 0003 0191 // Pin6 Pin Change interrupt 1: Off
; 0003 0192 // Pin7 Pin Change interrupt 1: Off
; 0003 0193 PORTG.INT1MASK=0x00;
	STS  1739,R30
; 0003 0194 
; 0003 0195 // PORTM initialization
; 0003 0196 // OUT register
; 0003 0197 PORTM.OUT=0x00;
	STS  1892,R30
; 0003 0198 // Pin0: Input
; 0003 0199 // Pin1: Input
; 0003 019A // Pin2: Input
; 0003 019B // Pin3: Input
; 0003 019C // Pin4: Input
; 0003 019D // Pin5: Input
; 0003 019E // Pin6: Input
; 0003 019F // Pin7: Input
; 0003 01A0 PORTM.DIR=0x00;
	STS  1888,R30
; 0003 01A1 // Pin0 Output/Pull configuration: Totempole/No
; 0003 01A2 // Pin0 Input/Sense configuration: Sense both edges
; 0003 01A3 // Pin0 Inverted: Off
; 0003 01A4 PORTM.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1904,R30
; 0003 01A5 // Pin1 Output/Pull configuration: Totempole/No
; 0003 01A6 // Pin1 Input/Sense configuration: Sense both edges
; 0003 01A7 // Pin1 Inverted: Off
; 0003 01A8 PORTM.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1905,R30
; 0003 01A9 // Pin2 Output/Pull configuration: Totempole/No
; 0003 01AA // Pin2 Input/Sense configuration: Sense both edges
; 0003 01AB // Pin2 Inverted: Off
; 0003 01AC PORTM.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1906,R30
; 0003 01AD // Pin3 Output/Pull configuration: Totempole/No
; 0003 01AE // Pin3 Input/Sense configuration: Sense both edges
; 0003 01AF // Pin3 Inverted: Off
; 0003 01B0 PORTM.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1907,R30
; 0003 01B1 // Pin4 Output/Pull configuration: Totempole/No
; 0003 01B2 // Pin4 Input/Sense configuration: Sense both edges
; 0003 01B3 // Pin4 Inverted: Off
; 0003 01B4 PORTM.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1908,R30
; 0003 01B5 // Pin5 Output/Pull configuration: Totempole/No
; 0003 01B6 // Pin5 Input/Sense configuration: Sense both edges
; 0003 01B7 // Pin5 Inverted: Off
; 0003 01B8 PORTM.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1909,R30
; 0003 01B9 // Pin6 Output/Pull configuration: Totempole/No
; 0003 01BA // Pin6 Input/Sense configuration: Sense both edges
; 0003 01BB // Pin6 Inverted: Off
; 0003 01BC PORTM.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1910,R30
; 0003 01BD // Pin7 Output/Pull configuration: Totempole/No
; 0003 01BE // Pin7 Input/Sense configuration: Sense both edges
; 0003 01BF // Pin7 Inverted: Off
; 0003 01C0 PORTM.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1911,R30
; 0003 01C1 // Interrupt 0 level: Disabled
; 0003 01C2 // Interrupt 1 level: Disabled
; 0003 01C3 PORTM.INTCTRL=(PORTM.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0003 01C4 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1897
	ANDI R30,LOW(0xF0)
	STS  1897,R30
; 0003 01C5 // Pin0 Pin Change interrupt 0: Off
; 0003 01C6 // Pin1 Pin Change interrupt 0: Off
; 0003 01C7 // Pin2 Pin Change interrupt 0: Off
; 0003 01C8 // Pin3 Pin Change interrupt 0: Off
; 0003 01C9 // Pin4 Pin Change interrupt 0: Off
; 0003 01CA // Pin5 Pin Change interrupt 0: Off
; 0003 01CB // Pin6 Pin Change interrupt 0: Off
; 0003 01CC // Pin7 Pin Change interrupt 0: Off
; 0003 01CD PORTM.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1898,R30
; 0003 01CE // Pin0 Pin Change interrupt 1: Off
; 0003 01CF // Pin1 Pin Change interrupt 1: Off
; 0003 01D0 // Pin2 Pin Change interrupt 1: Off
; 0003 01D1 // Pin3 Pin Change interrupt 1: Off
; 0003 01D2 // Pin4 Pin Change interrupt 1: Off
; 0003 01D3 // Pin5 Pin Change interrupt 1: Off
; 0003 01D4 // Pin6 Pin Change interrupt 1: Off
; 0003 01D5 // Pin7 Pin Change interrupt 1: Off
; 0003 01D6 PORTM.INT1MASK=0x00;
	STS  1899,R30
; 0003 01D7 
; 0003 01D8 // PORTR initialization
; 0003 01D9 // OUT register
; 0003 01DA PORTR.OUT=0x00;
	STS  2020,R30
; 0003 01DB // Pin0: Input
; 0003 01DC // Pin1: Input
; 0003 01DD PORTR.DIR=0x00;
	STS  2016,R30
; 0003 01DE // Pin0 Output/Pull configuration: Totempole/No
; 0003 01DF // Pin0 Input/Sense configuration: Sense both edges
; 0003 01E0 // Pin0 Inverted: Off
; 0003 01E1 PORTR.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2032,R30
; 0003 01E2 // Pin1 Output/Pull configuration: Totempole/No
; 0003 01E3 // Pin1 Input/Sense configuration: Sense both edges
; 0003 01E4 // Pin1 Inverted: Off
; 0003 01E5 PORTR.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2033,R30
; 0003 01E6 // Interrupt 0 level: Disabled
; 0003 01E7 // Interrupt 1 level: Disabled
; 0003 01E8 PORTR.INTCTRL=(PORTR.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0003 01E9 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,2025
	ANDI R30,LOW(0xF0)
	STS  2025,R30
; 0003 01EA // Pin0 Pin Change interrupt 0: Off
; 0003 01EB // Pin1 Pin Change interrupt 0: Off
; 0003 01EC PORTR.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  2026,R30
; 0003 01ED // Pin0 Pin Change interrupt 1: Off
; 0003 01EE // Pin1 Pin Change interrupt 1: Off
; 0003 01EF PORTR.INT1MASK=0x00;
	STS  2027,R30
; 0003 01F0 }
	RET
; .FEND
;
;// Virtual Ports initialization
;void vports_init(void)
; 0003 01F4 {
_vports_init:
; .FSTART _vports_init
; 0003 01F5 // PORTA mapped to VPORT0
; 0003 01F6 // PORTB mapped to VPORT1
; 0003 01F7 PORTCFG.VPCTRLA=PORTCFG_VP13MAP_PORTB_gc | PORTCFG_VP02MAP_PORTA_gc;
	LDI  R30,LOW(16)
	STS  178,R30
; 0003 01F8 // PORTC mapped to VPORT2
; 0003 01F9 // PORTD mapped to VPORT3
; 0003 01FA PORTCFG.VPCTRLB=PORTCFG_VP13MAP_PORTD_gc | PORTCFG_VP02MAP_PORTC_gc;
	LDI  R30,LOW(50)
	STS  179,R30
; 0003 01FB }
	RET
; .FEND
;
;/*******************************************************
;Timers/Counters initialization created by the
;CodeWizardAVR V3.34 Automatic Program Generator
;© Copyright 1998-2018 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;*******************************************************/
;
;// I/O Registers definitions
;#include <xmega128b1.h>
;#include <stdint.h>
;// Disable a Timer/Counter type TC0
;void tc0_disable(TC0_t *ptc)
; 0004 000F {

	.CSEG
_tc0_disable:
; .FSTART _tc0_disable
; 0004 0010 // Timer/Counter off
; 0004 0011 ptc->CTRLA=TC_CLKSEL_OFF_gc;
	RCALL SUBOPT_0x0
;	*ptc -> R16,R17
; 0004 0012 // Issue a reset command
; 0004 0013 ptc->CTRLFSET=TC_CMD_RESET_gc;
; 0004 0014 }
	RJMP _0x2060001
; .FEND
;
;// Disable a Timer/Counter type TC1
;void tc1_disable(TC1_t *ptc)
; 0004 0018 {
_tc1_disable:
; .FSTART _tc1_disable
; 0004 0019 // Timer/Counter off
; 0004 001A ptc->CTRLA=TC_CLKSEL_OFF_gc;
	RCALL SUBOPT_0x0
;	*ptc -> R16,R17
; 0004 001B // Issue a reset command
; 0004 001C ptc->CTRLFSET=TC_CMD_RESET_gc;
; 0004 001D }
	RJMP _0x2060001
; .FEND
;
;// Timer/Counter TCC0 initialization
;void tcc0_init(void)
; 0004 0021 {
_tcc0_init:
; .FSTART _tcc0_init
; 0004 0022 unsigned char s;
; 0004 0023 unsigned char n;
; 0004 0024 
; 0004 0025 // Note: The correct PORTC direction for the Compare Channels
; 0004 0026 // outputs is configured in the ports_init function.
; 0004 0027 
; 0004 0028 // Save interrupts enabled/disabled state
; 0004 0029 s=SREG;
	ST   -Y,R17
	ST   -Y,R16
;	s -> R17
;	n -> R16
	IN   R17,63
; 0004 002A // Disable interrupts
; 0004 002B #asm("cli")
	CLI
; 0004 002C 
; 0004 002D // Disable and reset the timer/counter just to be sure
; 0004 002E tc0_disable(&TCC0);
	LDI  R26,LOW(2048)
	LDI  R27,HIGH(2048)
	RCALL _tc0_disable
; 0004 002F // Clock source: ClkPer/1
; 0004 0030 TCC0.CTRLA=TC_CLKSEL_DIV1_gc;
	LDI  R30,LOW(1)
	STS  2048,R30
; 0004 0031 // Mode: Normal Operation, Overflow Int./Event on TOP
; 0004 0032 // Compare/Capture on channel A: Off
; 0004 0033 // Compare/Capture on channel B: Off
; 0004 0034 // Compare/Capture on channel C: Off
; 0004 0035 // Compare/Capture on channel D: Off
; 0004 0036 TCC0.CTRLB=(0<<TC0_CCDEN_bp) | (0<<TC0_CCCEN_bp) | (0<<TC0_CCBEN_bp) | (0<<TC0_CCAEN_bp) |
; 0004 0037 	TC_WGMODE_NORMAL_gc;
	LDI  R30,LOW(0)
	STS  2049,R30
; 0004 0038 // Capture event source: None
; 0004 0039 // Capture event action: None
; 0004 003A TCC0.CTRLD=TC_EVACT_OFF_gc | TC_EVSEL_OFF_gc;
	STS  2051,R30
; 0004 003B 
; 0004 003C // Set Timer/Counter in Normal mode
; 0004 003D TCC0.CTRLE=TC_BYTEM_NORMAL_gc;
	STS  2052,R30
; 0004 003E 
; 0004 003F // Overflow interrupt: High Level
; 0004 0040 // Error interrupt: Disabled
; 0004 0041 TCC0.INTCTRLA=TC_ERRINTLVL_OFF_gc | TC_OVFINTLVL_HI_gc;
	LDI  R30,LOW(3)
	STS  2054,R30
; 0004 0042 
; 0004 0043 // Compare/Capture channel A interrupt: Disabled
; 0004 0044 // Compare/Capture channel B interrupt: Disabled
; 0004 0045 // Compare/Capture channel C interrupt: Disabled
; 0004 0046 // Compare/Capture channel D interrupt: Disabled
; 0004 0047 TCC0.INTCTRLB=TC_CCDINTLVL_OFF_gc | TC_CCCINTLVL_OFF_gc | TC_CCBINTLVL_OFF_gc | TC_CCAINTLVL_OFF_gc;
	LDI  R30,LOW(0)
	STS  2055,R30
; 0004 0048 
; 0004 0049 // High resolution extension: Off
; 0004 004A HIRESC.CTRLA&= ~HIRES_HREN0_bm;
	LDS  R30,2192
	ANDI R30,0xFE
	STS  2192,R30
; 0004 004B 
; 0004 004C // Advanced Waveform Extension initialization
; 0004 004D // Optimize for speed
; 0004 004E #pragma optsize-
; 0004 004F // Disable locking the AWEX configuration registers just to be sure
; 0004 0050 n=MCU.AWEXLOCK & (~MCU_AWEXCLOCK_bm);
	LDS  R30,153
	ANDI R30,0xFE
	MOV  R16,R30
; 0004 0051 CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0004 0052 MCU.AWEXLOCK=n;
	STS  153,R16
; 0004 0053 // Restore optimization for size if needed
; 0004 0054 #pragma optsize_default
; 0004 0055 
; 0004 0056 // Pattern generation: Off
; 0004 0057 // Dead time insertion: Off
; 0004 0058 AWEXC.CTRL=(0<<AWEX_PGM_bp) | (0<<AWEX_CWCM_bp) | (0<<AWEX_DTICCDEN_bp) | (0<<AWEX_DTICCCEN_bp) |
; 0004 0059 	(0<<AWEX_DTICCBEN_bp) | (0<<AWEX_DTICCAEN_bp);
	LDI  R30,LOW(0)
	STS  2176,R30
; 0004 005A 
; 0004 005B // Fault protection initialization
; 0004 005C // Fault detection on OCD Break detection: On
; 0004 005D // Fault detection restart mode: Latched Mode
; 0004 005E // Fault detection action: None (Fault protection disabled)
; 0004 005F AWEXC.FDCTRL=(AWEXC.FDCTRL & (~(AWEX_FDDBD_bm | AWEX_FDMODE_bm | AWEX_FDACT_gm))) |
; 0004 0060 	(0<<AWEX_FDDBD_bp) | (0<<AWEX_FDMODE_bp) | AWEX_FDACT_NONE_gc;
	LDS  R30,2179
	ANDI R30,LOW(0xE8)
	STS  2179,R30
; 0004 0061 // Fault detect events:
; 0004 0062 // Event channel 0: Off
; 0004 0063 // Event channel 1: Off
; 0004 0064 // Event channel 2: Off
; 0004 0065 // Event channel 3: Off
; 0004 0066 // Event channel 4: Off
; 0004 0067 // Event channel 5: Off
; 0004 0068 // Event channel 6: Off
; 0004 0069 // Event channel 7: Off
; 0004 006A AWEXC.FDEMASK=0b00000000;
	LDI  R30,LOW(0)
	STS  2178,R30
; 0004 006B // Make sure the fault detect flag is cleared
; 0004 006C AWEXC.STATUS|=AWEXC.STATUS & AWEX_FDF_bm;
	LDI  R26,LOW(2180)
	LDI  R27,HIGH(2180)
	MOV  R0,R26
	LD   R26,X
	LDS  R30,2180
	ANDI R30,LOW(0x4)
	OR   R30,R26
	MOV  R26,R0
	ST   X,R30
; 0004 006D 
; 0004 006E // Clear the interrupt flags
; 0004 006F TCC0.INTFLAGS=TCC0.INTFLAGS;
	LDS  R30,2060
	STS  2060,R30
; 0004 0070 // Set Counter register
; 0004 0071 TCC0.CNT=0x0000;
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	STS  2080,R30
	STS  2080+1,R31
; 0004 0072 // Set Period register
; 0004 0073 TCC0.PER=0x07CF;
	LDI  R30,LOW(1999)
	LDI  R31,HIGH(1999)
	STS  2086,R30
	STS  2086+1,R31
; 0004 0074 // Set channel A Compare/Capture register
; 0004 0075 TCC0.CCA=0x0000;
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	STS  2088,R30
	STS  2088+1,R31
; 0004 0076 // Set channel B Compare/Capture register
; 0004 0077 TCC0.CCB=0x0000;
	STS  2090,R30
	STS  2090+1,R31
; 0004 0078 // Set channel C Compare/Capture register
; 0004 0079 TCC0.CCC=0x0000;
	STS  2092,R30
	STS  2092+1,R31
; 0004 007A // Set channel D Compare/Capture register
; 0004 007B TCC0.CCD=0x0000;
	STS  2094,R30
	STS  2094+1,R31
; 0004 007C 
; 0004 007D // Restore interrupts enabled/disabled state
; 0004 007E SREG=s;
	OUT  0x3F,R17
; 0004 007F }
_0x2060001:
	LD   R16,Y+
	LD   R17,Y+
	RET
; .FEND
;
;static uint32_t msCounter=0;
;
;// Timer/Counter TCC0 Overflow/Underflow interrupt service routine
;interrupt [TCC0_OVF_vect] void tcc0_overflow_isr(void)
; 0004 0085 {
_tcc0_overflow_isr:
; .FSTART _tcc0_overflow_isr
	ST   -Y,R22
	ST   -Y,R23
	ST   -Y,R26
	ST   -Y,R27
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
; 0004 0086 // Write your code here
; 0004 0087 	msCounter++;
	LDI  R26,LOW(_msCounter_G004)
	LDI  R27,HIGH(_msCounter_G004)
	RCALL __GETD1P_INC
	__SUBD1N -1
	RCALL __PUTDP1_DEC
; 0004 0088 }
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R27,Y+
	LD   R26,Y+
	LD   R23,Y+
	LD   R22,Y+
	RETI
; .FEND
;
;// Timer/Counter TCC1 initialization
;void tcc1_init(void)
; 0004 008C {
_tcc1_init:
; .FSTART _tcc1_init
; 0004 008D unsigned char s;
; 0004 008E 
; 0004 008F // Note: The correct PORTC direction for the Compare Channels
; 0004 0090 // outputs is configured in the ports_init function.
; 0004 0091 
; 0004 0092 // Save interrupts enabled/disabled state
; 0004 0093 s=SREG;
	ST   -Y,R17
;	s -> R17
	IN   R17,63
; 0004 0094 // Disable interrupts
; 0004 0095 #asm("cli")
	CLI
; 0004 0096 
; 0004 0097 // Disable and reset the timer/counter just to be sure
; 0004 0098 tc1_disable(&TCC1);
	LDI  R26,LOW(2112)
	LDI  R27,HIGH(2112)
	RCALL _tc1_disable
; 0004 0099 // Clock source: ClkPer/256
; 0004 009A TCC1.CTRLA=TC_CLKSEL_DIV256_gc;
	LDI  R30,LOW(6)
	STS  2112,R30
; 0004 009B // Mode: Normal Operation, Overflow Int./Event on TOP
; 0004 009C // Compare/Capture on channel A: On
; 0004 009D // Compare/Capture on channel B: Off
; 0004 009E TCC1.CTRLB=(0<<TC1_CCBEN_bp) | (1<<TC1_CCAEN_bp) |
; 0004 009F 	TC_WGMODE_NORMAL_gc;
	LDI  R30,LOW(16)
	STS  2113,R30
; 0004 00A0 // Capture event source: Event Channel 0
; 0004 00A1 // Capture event action: Input Capture
; 0004 00A2 TCC1.CTRLD=TC_EVACT_CAPT_gc | TC_EVSEL_CH0_gc;
	LDI  R30,LOW(40)
	STS  2115,R30
; 0004 00A3 
; 0004 00A4 // Set Timer/Counter in Normal mode
; 0004 00A5 TCC1.CTRLE=TC_BYTEM_NORMAL_gc;
	LDI  R30,LOW(0)
	STS  2116,R30
; 0004 00A6 
; 0004 00A7 // Overflow interrupt: Disabled
; 0004 00A8 // Error interrupt: Disabled
; 0004 00A9 TCC1.INTCTRLA=TC_ERRINTLVL_OFF_gc | TC_OVFINTLVL_OFF_gc;
	STS  2118,R30
; 0004 00AA 
; 0004 00AB // Compare/Capture channel A interrupt: High Level
; 0004 00AC // Compare/Capture channel B interrupt: Disabled
; 0004 00AD TCC1.INTCTRLB=TC_CCBINTLVL_OFF_gc | TC_CCAINTLVL_HI_gc;
	LDI  R30,LOW(3)
	STS  2119,R30
; 0004 00AE 
; 0004 00AF // High resolution extension: Off
; 0004 00B0 HIRESC.CTRLA&= ~HIRES_HREN1_bm;
	LDS  R30,2192
	ANDI R30,0xFD
	STS  2192,R30
; 0004 00B1 
; 0004 00B2 // Clear the interrupt flags
; 0004 00B3 TCC1.INTFLAGS=TCC1.INTFLAGS;
	LDS  R30,2124
	STS  2124,R30
; 0004 00B4 // Set Counter register
; 0004 00B5 TCC1.CNT=0x0000;
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	STS  2144,R30
	STS  2144+1,R31
; 0004 00B6 // Set Period register
; 0004 00B7 TCC1.PER=0xFFFF;
	LDI  R30,LOW(65535)
	LDI  R31,HIGH(65535)
	STS  2150,R30
	STS  2150+1,R31
; 0004 00B8 // Set channel A Compare/Capture register
; 0004 00B9 TCC1.CCA=0x0000;
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	STS  2152,R30
	STS  2152+1,R31
; 0004 00BA // Set channel B Compare/Capture register
; 0004 00BB TCC1.CCB=0x0000;
	STS  2154,R30
	STS  2154+1,R31
; 0004 00BC 
; 0004 00BD // Restore interrupts enabled/disabled state
; 0004 00BE SREG=s;
	OUT  0x3F,R17
; 0004 00BF }
	LD   R17,Y+
	RET
; .FEND
;
;// Timer/Counter TCC1 Compare/Capture A interrupt service routine
;interrupt [TCC1_CCA_vect] void tcc1_compare_capture_a_isr(void)
; 0004 00C3 {
_tcc1_compare_capture_a_isr:
; .FSTART _tcc1_compare_capture_a_isr
	ST   -Y,R30
	IN   R30,SREG
	ST   -Y,R30
; 0004 00C4 // Ensure that the Compare/Capture A interrupt flag is cleared
; 0004 00C5 if (TCC1.INTFLAGS & TC1_CCAIF_bm) TCC1.INTFLAGS|=TC1_CCAIF_bm;
	LDS  R30,2124
	ANDI R30,LOW(0x10)
	BREQ _0x80003
	LDS  R30,2124
	ORI  R30,0x10
	STS  2124,R30
; 0004 00C6 // Write your code here
; 0004 00C7 #asm("nop")
_0x80003:
	NOP
; 0004 00C8 }
	LD   R30,Y+
	OUT  SREG,R30
	LD   R30,Y+
	RETI
; .FEND
;uint32_t getTime(void){
; 0004 00C9 uint32_t getTime(void){
_getTime:
; .FSTART _getTime
; 0004 00CA 
; 0004 00CB 	unsigned char s;
; 0004 00CC 	uint32_t tempValHolder;
; 0004 00CD 	// Save interrupts enabled/disabled state
; 0004 00CE 	s=SREG;
	SBIW R28,4
	ST   -Y,R17
;	s -> R17
;	tempValHolder -> Y+1
	IN   R17,63
; 0004 00CF 	// Disable interrupts
; 0004 00D0 	#asm("cli")
	CLI
; 0004 00D1 
; 0004 00D2 	//copy the value of the interrupts disabled so the value is not corrupted by an untimely interrupt
; 0004 00D3 	tempValHolder=msCounter;
	LDS  R30,_msCounter_G004
	LDS  R31,_msCounter_G004+1
	LDS  R22,_msCounter_G004+2
	LDS  R23,_msCounter_G004+3
	__PUTD1S 1
; 0004 00D4 
; 0004 00D5 	//restore interrupts enabled/disabled state
; 0004 00D6 	SREG=s;
	OUT  0x3F,R17
; 0004 00D7 	return tempValHolder;
	LDD  R17,Y+0
	ADIW R28,5
	RET
; 0004 00D8 }
; .FEND

	.CSEG

	.CSEG

	.CSEG

	.DSEG
_msCounter_G004:
	.BYTE 0x4

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x0:
	ST   -Y,R17
	ST   -Y,R16
	MOVW R16,R26
	LDI  R30,LOW(0)
	ST   X,R30
	ADIW R26,9
	LDI  R30,LOW(12)
	ST   X,R30
	RET

;RUNTIME LIBRARY

	.CSEG
__GETD1P_INC:
	LD   R30,X+
	LD   R31,X+
	LD   R22,X+
	LD   R23,X+
	RET

__PUTDP1_DEC:
	ST   -X,R23
	ST   -X,R22
	ST   -X,R31
	ST   -X,R30
	RET

;END OF CODE MARKER
__END_OF_CODE:
