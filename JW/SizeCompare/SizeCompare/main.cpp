/*
 * SizeCompare.cpp
 *
 * Created: 12/30/2018 10:16:29 AM
 * Author : subhe
 */ 

#include <avr/io.h>
#include<stdio.h>


int main(void)
{
	static float myFloat1=0.0;
	static float myFloat2=0.0;
	static unsigned int index =0;
	static float myFloatArray[32]={0.0};
		
    /* Replace with your application code */
    while (1) 
    {
		myFloat1+=3.14159;
		myFloat2=(myFloat1*2.718)-(0.1276*myFloat2);
		printf("myFloat1: %f,myFloat2: %f",myFloat1,myFloat2);
		
		if(myFloat2>31.4159)
		{
		myFloatArray[index++]=myFloat1;
		myFloat2 =myFloat1/myFloat2;
		}
		else
		{
		myFloatArray[index++]=myFloat2;
		
		if(myFloatArray[index] >myFloat1)
		{
		myFloat1=myFloat2/myFloat1;
		}
		}
		if (index >=32){
			index=0;
		}
		
	}
}
		
		
