//Humberto Meza Moreno, A01112905, Link to the report: https://www.overleaf.com/read/sygtybpqtmjy 
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int proc(int a[]) {
	int sum = 0, i;
	for (i=0; i < 1000000; i++){
		sum += a[i];
	}
	return sum;
}

int * allocateAndInitialize(int *a, int length/*, int value*/){
	a = malloc (sizeof (int) * length);
	//int b[length];
	//int i;
	//for (i=0; i<length; i++){
  	//	b[i] = value;
	//}
	//a = b;
}


int main(){
	int *array;
	array = allocateAndInitialize(array, 1000000/*, 2*/);
	//clock_t t = clock();
	int result = 0;
	result = proc(array);
	//t = clock() - t;
    //printf("Result: %d\nClock ticks: %ld, Clocks per second: %ld\nTime spent by proc: %f\n",
    //result, t, CLOCKS_PER_SEC, (double)t/CLOCKS_PER_SEC);
    printf("Result: %d\n", result);
    return 0;
}