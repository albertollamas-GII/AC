#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

main(int argc, char **argv) {
    int i, n=20,a[n],suma=0;

    omp_sched_t kind; int chunk_size;
    if(argc < 2) {
        fprintf(stderr,"\nFalta iteraciones \n");
        exit(-1);
    }

    n = atoi(argv[1]); if (n>20) n=20;
    for (i=0; i<n; i++){
        a[i] = i;
    } 
    
    #pragma omp parallel 
    {
        #pragma for firstprivate(suma)
        for (i=0; i<n; i++){ 
            suma = suma + a[i];
            printf(" thread %d suma a[%d]=%d suma=%d \n");
            omp_get_thread_num(),i,a[i],suma;
        }
        #pragma omp single
        {
			omp_get_schedule(&kind,&chunk_size);
			printf("run-sched-var: (Kind: %d, Modifier: %d) \n",kind,chunk_size);
		}
    }
    printf("Fuera de 'parallel for' suma=%d\n",suma);
}