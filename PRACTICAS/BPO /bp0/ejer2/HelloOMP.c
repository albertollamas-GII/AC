/*Compilar con: gcc-O2 -fopenmp-o HelloOMPHelloOMP.c */
#include<stdio.h>
#include<omp.h>

int main(void){
#pragma omp parallel

printf("(%d:!!!Hello world!!!)", omp_get_thread_num());
return(0);
}

