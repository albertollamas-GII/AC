#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

int main(int argc, char **argv)
{
    int i, n = 200, chunk, a[n], suma = 0;
    omp_sched_t kind;
    int modif;
    if (argc < 3)
    {
        fprintf(stderr, "\nFalta iteraciones o chunk\n");
        exit(-1);
    }

    n = atoi(argv[1]);
    if (n > 200)
        n = 200;

    chunk = atoi(argv[2]);

    for (i = 0; i < n; i++)
        a[i] = i;

#pragma omp parallel for firstprivate(suma) \
    lastprivate(suma) schedule(dynamic, chunk)
    for (i = 0; i < n; i++)
    {
        suma = suma + a[i];
        printf(" thread %d suma a[%d]=%d suma=%d \n",
               omp_get_thread_num(), i, a[i], suma);

        if (i == 0)
        {
            omp_get_schedule(&kind, &modif);
            printf("Dentro del for: dyn-var (true si hay ajuste dinámico)=%s, nthreads-var= %d, run-sched-var= tipo:%d || chunk: %d\n",
                   omp_get_dynamic() ? "true" : "false", omp_get_max_threads(), kind, modif);

            printf("\nModificando dyn_var ---> false");
            omp_set_dynamic(0);

            printf("\nModificando nthreads-var ---> 2");
            omp_set_num_threads(7);

            printf("\nModificando run-sched-var ---> dynamic, 3");
            omp_set_schedule(omp_sched_dynamic,3);        
        }
        
    }
    omp_get_schedule(&kind, &modif);
    printf("Fuera del for: dyn-var (true si hay ajuste dinámico)=%s, nthreads-var= %d, run-sched-var= tipo:%d || chunk: %d\n",
           omp_get_dynamic() ? "true" : "false", omp_get_max_threads(), kind, modif);
    printf("Fuera de 'parallel for' suma=%d\n", suma);
}
