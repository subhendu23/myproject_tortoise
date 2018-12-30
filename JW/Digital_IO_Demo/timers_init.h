/*******************************************************
Timers/Counters initialization created by the
CodeWizardAVR V3.34 Automatic Program Generator
� Copyright 1998-2018 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
*******************************************************/

#ifndef _TIMERS_INIT_INCLUDED_
#define _TIMERS_INIT_INCLUDED_

// Disable a Timer/Counter type TC0
void tc0_disable(TC0_t *ptc);
// Timer/Counter TCC0 initialization
void tcc0_init(void);
uint32_t getTime(void);
#endif
