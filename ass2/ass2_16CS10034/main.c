/*
#####################################################################################
##                           Mehul Kumar Nirala  16CS10034                         ##
##                         Assignment 2  Library Functions main.c                  ## 
#####################################################################################
*/
#include "myl.h"
#define MAX_SIZE 32
#define PRECISION 6

int main(){
	int *i = malloc(sizeof(int));

	printStr("Main File to demonstrate printString, readInt, printInt, readFloat, printFloat.\n");
	printStr("Enter a integer : ");
	if(readInt(i)==ERR){
		printStr("\nERROR WHILE READING INTEGER\n");
	}
	else
		printStr("The value of int : ");
	// bool prntInt = ;
	if(printInt(*i)==ERR){
		printStr("\nERROR WHILE DISPLAYING INTEGER\n");
	}
	printStr("\n");
	printStr("\n");

	float *f = malloc(sizeof(float));
	printStr("Enter a float : ");
	if(readFlt(f)==ERR){
		printStr("\nERROR WHILE READING FLOAT\n");
	}
	else
		printStr("The value of float : ");
	// bool prntFlt = ;
	if(printFlt(*f)==ERR){
		printStr("\nERROR WHILE DISPLAYING FLOAT\n");
	}
	printStr("\n");

	return 0;
}
