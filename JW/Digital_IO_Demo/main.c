/*******************************************************
This program was created by the CodeWizardAVR V3.34 
Automatic Program Generator
� Copyright 1998-2018 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
Version : 
Date    : 12/30/2018
Author  : 
Company : 
Comments: 


Chip type               : ATxmega128B1
Program type            : Application
AVR Core Clock frequency: 2.000000 MHz
Memory model            : Small
Data Stack size         : 2048
*******************************************************/

// I/O Registers definitions
#include <xmega128b1.h>

// Standard Input/Output functions
#include <stdio.h>
#include <stdint.h>

// Clock System initialization function
#include "clock_init.h"

// Event System initialization function
#include "event_system_init.h"

// I/O Ports initialization function
#include "ports_init.h"

// Timers/Counters initialization functions
#include "timers_init.h"

// Declare your global variables here

void main(void)
{
// Declare your local variables here
unsigned char n;

// Interrupt system initialization
// Optimize for speed
#pragma optsize- 
// Make sure the interrupts are disabled
#asm("cli")
// Low level interrupt: Off
// Round-robin scheduling for low level interrupt: Off
// Medium level interrupt: Off
// High level interrupt: On
// The interrupt vectors will be placed at the start of the Application FLASH section
n=(PMIC.CTRL & (~(PMIC_RREN_bm | PMIC_IVSEL_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm))) |
	PMIC_HILVLEN_bm;
CCP=CCP_IOREG_gc;
PMIC.CTRL=n;
// Set the default priority for round-robin scheduling
PMIC.INTPRI=0x00;
// Restore optimization for size if needed
#pragma optsize_default

// System clocks initialization
system_clocks_init();

// Event system initialization
event_system_init();

// Ports initialization
ports_init();

// Virtual Ports initialization
vports_init();

// Timer/Counter TCC0 initialization
tcc0_init();

// Timer/Counter TCC1 initialization
tcc1_init();

// Globally enable interrupts
#asm("sei")

while (1)
      {
      // Place your code here
	  static uint32_t turnOffLedTime=0;
	  static uint16_t lastRotationCount=0;
	  if(getTime() >= turnOffLedTime)
	  {
		  PORTB.OUT=0xF0;
	  }
	  else
	  {
		PORTB.OUT=0x00;	
	  }
	  
      
	  if(wheelRotationCaptured())
	  {
		  uint32_t newRotationCount;
		  uint32_t rotationDuration;
		  newRotationCount=getWheelRotationCount();
		  rotationDuration=newRotationCount-lastRotationCount;
		  lastRotationCount=newRotationCount;
		  turnOffLedTime=250+getTime();
		  
	  }
	  }
}
