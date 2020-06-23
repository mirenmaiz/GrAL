#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <immintrin.h>


float a[16384] = {0}; 
float b[16384] = {0};
float c[16384] = {0};

void foo(int times){
    
    int i,j; 
    __m512 result,B,C;
	for(j = 0; j < times; j++){
        for (i=0; i<16384; i+=16){
            B =  _mm512_load_ps(&b[i]);
            C =  _mm512_load_ps(&c[i]);
            result = _mm512_add_ps(B,C);
            _mm512_store_ps(&a[i], result);
        }
	}
}

void fill_arrays(){

    int i;
    float maxb  = 10.0;
    float maxc  = 20.0;

    for (i=0; i<16384; i++){
        b[i] = (float)rand()/(float)(RAND_MAX/maxb);
	c[i] = (float)rand()/(float)(RAND_MAX/maxc);
    }
}

int main(int argc, char **argv){
    
    int seed = atoi(argv[1]);
    int times = atoi(argv[2]);
    srand(seed);
    if (__builtin_cpu_supports ("avx512f")){
        // initialize arrays
        fill_arrays();
        foo(times);
        return 0;
    }
    else{
        printf("SKIP: instructions not suppoorted\n");
        return -1;
    }
}
