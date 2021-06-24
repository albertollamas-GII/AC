/* pmv-OpenMP-reduction.c

@author Alberto Llamas González 
		
*/

#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>  // biblioteca donde se encuentra la función printf()
#include <time.h>   // biblioteca donde se encuentra la función clock_gettime()
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

// #define VECTOR_GLOBAL // descomentar para que los vectores sean variables Dinamicas
#define VECTOR_DYNAMIC // descomentar para que los vectores sean variables globales

#ifdef VECTOR_GLOBAL
#define MAX 33554432 //=2^25

double v1[MAX], v2[MAX], v3[MAX];
#endif

int main(int argc, char **argv)
{
    struct timespec cgt1, cgt2;
    double ncgt; // tiempos de ejecución

    if (argc < 2)
    {
        printf("ERROR: falta el tamaño N de la matriz NxN y del vector\n");
        exit(EXIT_FAILURE);
    }

    unsigned int N = atoi(argv[1]); // Tamaño del vector

    #ifdef VECTOR_DYNAMIC
        double *v1, *v2, **M;
        v1 = (double *)malloc(N * sizeof(double));
        v2 = (double *)malloc(N * sizeof(double));
        M = (double **)malloc(N * sizeof(double *));
        for (int i = 0; i < N; i++)
            M[i] = (double *)malloc(N * sizeof(double));

        if ((v1 == NULL) || (v2 == NULL) || (M == NULL))
        {
            printf("ERROR: en la reserva de memoria dinámica para matriz y vectores\n");
            exit(EXIT_FAILURE);
        }
    #endif

    // Inicialización de vectores y matriz
    for (int i = 0; i < N; i++)
    {
        v1[i] = i;
        v2[i] = 0;

        // haremos que la matriz M sea 2*Id (Id = "matriz identidad"), entonces podremos
        // comprobar el resultado simplemente viendo que debe ser v2 = 2*v1
        for (int j = 0; j < N; j++)
            if (i == j)
                M[i][j] = 2;
            else
                M[i][j] = 0;
    }

    #ifdef _OPENMP
        double start = omp_get_wtime();
    #else
        clock_gettime(CLOCK_REALTIME, &cgt1);
    #endif
    
    double suma_parcial;
    // calculamos el producto v2 = M*v1
    #pragma omp parallel
    for (int i = 0; i < N; i++)
    {
        #pragma omp for reduction(+:suma_parcial)
            for (int k = 0; k < N; k++)
                suma_parcial += M[i][k] * v1[k];
        
        #pragma omp single
        {
            v2[i] = suma_parcial;
            suma_parcial = 0;
        }
    }
    #ifdef _OPENMP
        ncgt = omp_get_wtime() - start;
    #else
        clock_gettime(CLOCK_REALTIME, &cgt2);
        ncgt = (double)(cgt2.tv_sec - cgt1.tv_sec) +
            (double)((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));
    #endif

    // imprimimos v2 por pantalla
    if (N < 10)
    {
        printf("Resultado: v2 = ");
        for (int i = 0; i < N; i++)
            printf("%f ", v2[i]);
    }

    // imprimimos finales
    printf("v2[0]: %f, v2[%u]: %f\n", v2[0], N - 1, v2[N - 1]);

    // imprimimos tiempo de ejecución
    printf("\n\nTamaño: %d -> Tiempo de ejecución: %f\n\n", N, ncgt);

    #ifdef VECTOR_DYNAMIC
        free(v1);
        free(v2);
        for (int i = 0; i < N; i++)
            free(M[i]);
        free(M);
    #endif
}