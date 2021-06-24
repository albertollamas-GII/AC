#include <stdio.h>
#include <omp.h>

int main(void){

  #pragma omp parallel
  printf("(%d): !!!Hello\n", omp_get_thread_num());
  #pragma omp parallel
  printf("(%d): world!!!\n", omp_get_thread_num());

  return (0);

}
