/* C Implementation*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* The main function that implements Bubble sort
 arr[] --> Array to be sorted,
*/
void swap(int *xp, int *yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}
 

void swapwoc(int &a, int &b)
{
    b = a + b;
    a = b - a;
    b = b - a;
}


// A function to implement bubble sort
void bubbleSort(int arr[], int n)
{
   int i, j;
   for (i = 0; i < n-1; i++)      
 
       // Last i elements are already in place   
       for (j = 0; j < n-i-1; j++) 
           if (arr[j] > arr[j+1])
              swap(&arr[j], &arr[j+1]);
}
 
/* Function to print an array */
void printArray(int arr[], int size)
{
    int i;
    for (i=0; i < size; i++)
        printf("%d ", arr[i]);
    printf("n");
}

int hcf(int n1, int n2);

int hcf(int n1, int n2)
{
    if (n2 != 0)
       return hcf(n2, n1%n2);
    else 
       return n1;
}





int main()
{
    int arr[] = {10,9,8,7,6};
    int n = sizeof(arr)/sizeof(arr[0]);
    bubbleSort(arr,  n);
    printf("Sorted array: \n");
    printArray(arr, n);

  
    static short ss=0;

    volatile signed long vsl = 10;

    swapwoc(ss,vsl);


    int n1, n2;
    printf("Enter two positive integers: ");
    scanf("%d %d", &n1, &n2);

    printf("G.C.D of %d and %d is %d.", n1, n2, hcf(n1,n2));


    // copied from ass3
    char text[10];

    text="Well Hello!\n \t \'";

    char ch='a';
    int i = 0;
    //testing the punctuators and keywords together :


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
        case(2) : break;
        case(3) : ;
        default : printf("default\n");
      }
    }

    do{ 
      if (vsl==10){
        if (i&&0||!i) 
          i=~i;
      }
      else {
        auto int j=0,k=0;
        j|=5;
        k*=R;
      }
    }while (1) ;
    sizeof(double);
    _Bool a;
    _Complex  b;
    _Imaginary  c;

    return 0;

}