/* pmv-secuencial.c 
Calcula:
    - el producto de matriz cuadrada(n) por un vector(n): v2 = M x v1
    - el tiempo que tarda en realizar dicho producto
 
Para compilar usar:    gcc -O2 -fopenmp pmv-secuencial.c -o pmv-secuencial
Para ejecutar use:     pmv-secuencial "num filas/columnas"

@author Alberto Llamas González 
		
*/

#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>  // biblioteca donde se encuentra la función printf()
#include <time.h>   // biblioteca donde se encuentra la función clock_gettime()

// #define VECTOR_GLOBAL // descomentar para que los vectores sean variables Dinamicas
#define VECTOR_DYNAMIC	// descomentar para que los vectores sean variables globales

#ifdef VECTOR_GLOBAL
#define MAX 33554432	//=2^25

double v1[MAX], v2[MAX], v3[MAX];
#endif

int main(int argc, char **argv)
{

    int i;

    struct timespec cgt1, cgt2;
    double ncgt; //para tiempo de ejecución

    //Leer argumento de entrada (nº de componentes del vector)
    if (argc < 2)
    {
        printf("ERROR: Falta el tamaño N de la matriz NxN y del vector v\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Tamaño del vector

    #ifdef VECTOR_DYNAMIC
        double *v1, *v2, **M;
        v1 = (double *)malloc(N * sizeof(double)); // malloc necesita el tamaño en bytes
        v2 = (double *)malloc(N * sizeof(double));
        M = (double **)malloc(N * sizeof(double*));
        
        for (int i = 0; i < N; i++)
                M[i] = (double*) malloc(N*sizeof(double));
        
        if ((v1 == NULL) || (v2 == NULL) || (M == NULL))
        {
            printf("No hay suficiente espacio para los vectores \n");
            exit(-2);
        }
    #endif

    //Inicializar vectores y matriz
    for (int i= 0; i < N; i++){
        v1[i] = i;
        v2[i] = 0;

        //Haremos que la matriz M sea 2*Id donde Id = matriz identidad, para poder
        //comprobar el resultado simplemente viendo que v2 = 2*v1;
        for (int j = 0; j < N; j++){
            if (i == j)
                M[i][j] = 2;
            else
                M[i][j] = 0;
        }
    }

    clock_gettime(CLOCK_REALTIME, &cgt1);
    //Calcular el producto v2 = M*v1;
    
    for (i = 0; i < N; i++)
        for (int k = 0; k < N; k++)
            v2[i] += M[i][k]*v1[i];

    clock_gettime(CLOCK_REALTIME, &cgt2);
    ncgt = (double)(cgt2.tv_sec - cgt1.tv_sec) +
           (double)((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

    //Imprimimos v2 por pantalla y el tiempo de ejecución
    printf("Resultado v2 = ");
    for (int i = 0; i < N; i++)
        printf("%f ", v2[i]);
    printf("\n\nTamano: %d -> Tiempo de ejecucion: %f\n\n", N, ncgt);

#ifdef VECTOR_DYNAMIC
    free(v1); // libera el espacio reservado para v1
    free(v2); // libera el espacio reservado para v2
    for (int i = 0; i < N; i++)
        free(M[i]);
    free(M);
#endif
    return 0;
}