/*
#####################################################################################
##                           Mehul Kumar Nirala  16CS10034                         ##
##                         Assignment 2    Library Functions                       ## 
#####################################################################################
*/
#include "myl.h"

#define MAX_SIZE 32 // no of digits
#define PRECISION 6  // number of decimal places

int printStr(char* str){
  
  char *temp = str;
  int l = 0,r;

  while(*temp != '\0'){
    temp++,l++;
  }

  asm (
    "movq $1, %%rax;"
    "movq $1, %%rdi;"
    "syscall"
    : "=a"(r)
    : "S"(str), "d"(l)
  );
  if ( r < 0){
  	return ERR;
  }
  else{
  	return r;
  }
}

int readInt(int* x){
  char temp[MAX_SIZE];
  int l, isneg = 0;
  asm (
    "movq $0, %%rax;"
    "movq $0, %%rdi;"
    "syscall;"
    : "=a"(l)
    : "S"(temp), "d"(MAX_SIZE)
  );
  *x = 0;
  int i = 0;
  if(temp[i] == '-'){
  	isneg = 1;
  	i++;
  } 

  for(;i<l-1;i++){
    *x *= 10;
    if (temp[i]<'0' || temp[i]>'9'){
    	return ERR;	
    }
    *x += temp[i]-'0';
  }
  if(isneg)
    *x = (*x)*(-1);
  if(l <= 0){
    return ERR;  	
  }
  else{
    return OK;  	
  }
}

int printInt(int num){

  char temp[MAX_SIZE];
  int l = 0,t,r;

  int temp2;	 
  if(num == 0){
    temp[l++] = '0';
    temp2 = 1;  	
  }
  else{
  	temp2 = 2;
    if(num < 0){
      num *= -1;
      temp[l++] = '-';
      temp2 = 2;
    }
    while(num!=0){
      temp[l++] = ((num%10)+'0');   // +'0' for converting to character
      num/=10;
      temp2 = 0;
    }

    int sz=l-1;

  for(int i=0;i<sz;i++){
  	if(i==0&&temp[i] == '-') {
  		i++;    	
  	}
  	t = temp[i];
  	temp[i] = temp[sz];
  	temp[sz--] = t;
    }
  }
  asm (
    "movq $1, %%rax;"
    "movq $1, %%rdi;"
    "syscall"
    : "=a"(r)
    : "S"(temp), "d"(l)
  );

  if(r < 0){
    return ERR;  	
  }
  else{
    return r;
  }

}

int fltFunc(float* f, char* temp, int l){

  int state=0,isneg=0;
  float num = 1.0f;

  int validity = 1;
  for(int i=0;i<l;i++){
    switch(state){
      case 0:{
	if('0' <= temp[i] && temp[i] <= '9'){
	  *f *= 10;
	  *f += (temp[i] - '0');
	  state = 1;
	}
	else if(temp[i] == '-'){
	  isneg = 1;
	  state = 1;
	}
	else if(temp[i] == '.'){
	  state = 2;
	}
	else{
	  state = 3;
	  return 0;
	}
	break;
      }
      case 1:{
	if('0' <= temp[i] && temp[i] <= '9'){
	  *f *= 10;
	  *f += (temp[i] - '0');
	}
	else if(temp[i] == '.'){
	  state = 2;
	}
	else{
	  state = 3;
	  return 0;
	}
	break;
      }
      case 2:{
	if('0' <= temp[i] && temp[i] <= '9'){
	  num/=10;
	  *f+=num*(temp[i]-'0');
	}
	else{
	  state = 3;
	  return 0;
	}
	break;
      }
      case 3:{
	return 0;
      }
    }
  }

  if (state == 3){
  	return 0;
  }

  if(isneg)
    *f *= -1;
  return 1;
}

int readFlt(float* num){
  *num = 0;
  char temp[MAX_SIZE];
  int l;
  asm (
    "movq $0, %%rax;"
    "movq $0, %%rdi;"
    "syscall;"
    : "=a"(l)
    : "S"(temp), "d"(MAX_SIZE)
  );
  if(l<=0){
    return ERR;  	
  }
  int b = fltFunc(num, temp, l);
  // if(!b){
  //   return ERR;  	
  // }
  return OK;
}

int printFlt(float num){
  char temp[MAX_SIZE];
  int l = 0;

  if(num == 0){
    printStr("0");
    return 1;
  }
  else if(num < 0){
    printStr("-");
    num *= -1;
  }

  int integer_part = (int)num;
  float frac_part = num - integer_part;
  int int_lt=printInt(integer_part);

  if(int_lt<=0){
    return ERR;  	
  }

  printStr(".");

  while(l < PRECISION){
    frac_part *= 10;
    int t = (int)frac_part;
    temp[l++] = t +'0'; 	// +'0' for converting to character
    frac_part -= t;
  }
  temp[l] = '\0';
  printStr(temp);

  return int_lt+1+PRECISION;

}
