/*This file is input to check if all tokens are working correctly*/

#include <stdio.h>
#define define_var "\t done \n"

/*
These lines for example are multi line comments
*/


typedef struct tree {
	int val;
	struct tree* left;
	struct tree* right;
}

inline int funco(char *text,float no,int val){
	printf("Flaot value %f\n", no);
	printf("Int value %d\n", val);
	printf("The functional pararmeter %s \n",text);
	printf("The hash defined variable %s \n",define_var);
}


main(){

	//testing all the keywords here
	auto, break, case, char, const, continue, default, do, double, else
	enum, extern, float, for, goto, if, inline, int, long, register
	restrict, return, short, signed, sizeof, static, struct, switch, typedef, union
 	unsigned, void, volatile, while, _Bool, _Complex, _Imaginary

 	//testing identifiers and constants:
 	float ff = -12.58 ;
 	int i = 12;
 	extern unsigned int eui=0;
 	

 	static short ss=0;

 	volatile signed long vsl = 10;

 	double d = 12.588889;

 	char text[10];

 	text="Well Hello!\n \t \'";

 	char ch='a';

 	//testing the punctuators and keywords together :
 	tree* root=NULL;
 	funco(text,ff,i);

 	i++;
 	i--;
 	i = i+0;
 	i = i&&1;
 	i = ~i;
	i%=2;
	i+=4;
	i-=8;
	i<<=1;
	i>>=2;
	i&=3;
	i^=4;


 	for(i=0;i<50;i++) {
 		switch(i) {
 			case(1) : continue;
 			case(2)	: break;
 			case(3)	: ;
 			default : printf("default\n");
 		}
 	}
	do{	
		if (vsl==10){
	 		if (i&&0||!i) 
	 			i=~i;
	 	}
	 	else if(vsl>=ss) {
	 		root=root->next;
	 		root->val=i/2;
	 		i=i|root->val;
	 	}

	 	else {
	 		auto int j=0,k=0;
	 		j|=5;
	 		k*=R;
	 	}
	 	
 		root->val = (i*=12 > 58||i/=12 < 8) ? i:1;
	 	
	}while (1) ;
	enum degree{"BTech","MTech"};
 	sizeof(double);
 	_Bool	a;
 	_Complex	b;
 	_Imaginary	c;

 	return 0;
}