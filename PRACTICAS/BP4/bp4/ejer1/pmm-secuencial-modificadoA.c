/**
 * @author Alberto Llamas Gonzalez
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//He realizado el programa con matrices dinamicas
/*
ModificacionA: desenrollado de bucles, con 4 cálculos por iteracion 
N no tiene por que ser multiplo de 4
*/
//Vamos a calcular A = B*C
int main(int argc, char **argv)
{
    struct timespec cgt1, cgt2;
    double t; // para tiempos

    if (argc < 2)
    {
        printf("[ERROR]-Debe insertar tamaño matriz\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]);
    
    double **A, **B, **C;

    //Reservamos espacio para las matrices
    A = (double **)malloc(N * sizeof(double *));
    B = (double **)malloc(N * sizeof(double *));
    C = (double **)malloc(N * sizeof(double *));

    if ((A == NULL) || (B == NULL) || (C == NULL))
        printf("\nNo hay suficiente espacio para la matriz\n");

    for (int e = 0; e < N; e++)
    {
        A[e] = (double *)malloc(N * sizeof(double));
        B[e] = (double *)malloc(N * sizeof(double));
        C[e] = (double *)malloc(N * sizeof(double));

        if ((A[e] == NULL) || (B[e] == NULL) || (C[e] == NULL))
            printf("\nNo hay suficiente espacio para la matriz en la columna\n");
    }
    int i, j, k;
    double suma;

    srand48(time(NULL));

    // Inicialización matrices B, C
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
        {
            if (N < 9)
            {
                B[i][j] = j + 1;
                C[i][j] = j + 1;
            }
            else
            {
                B[i][j] = drand48();
                C[i][j] = drand48();
            }
        }

    // Tiempo
    clock_gettime(CLOCK_REALTIME, &cgt1);

    int mod = N % 4;
    // Cálculo de A=B*C
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
        {
            A[i][j] = 0;
            for (k = 0; k < N - mod; k += 4)
            {
                A[i][j] = A[i][j] + B[i][k] * C[k][j];
                A[i][j] = A[i][j] + B[i][k + 1] * C[k + 1][j];
                A[i][j] = A[i][j] + B[i][k + 2] * C[k + 2][j];
                A[i][j] = A[i][j] + B[i][k + 3] * C[k + 3][j];
            }

            if (N - mod + 2 < N)
            {
                A[i][j] = A[i][j] + B[i][N - mod] * C[N - mod][j];
                A[i][j] = A[i][j] + B[i][N - mod + 1] * C[N - mod + 1][j];
                A[i][j] = A[i][j] + B[i][N - mod + 2] * C[N - mod + 2][j];
            }
            else if (N - mod + 1 < N)
            {
                A[i][j] = A[i][j] + B[i][N - mod] * C[N - mod][j];
                A[i][j] = A[i][j] + B[i][N - mod + 1] * C[N - mod + 1][j];
            }
            else if (N - mod < N)
            {
                A[i][j] = A[i][j] + B[i][N - mod] * C[N - mod][j];
            }
        }

    // Tiempo
    clock_gettime(CLOCK_REALTIME, &cgt2);

    t = (double)(cgt2.tv_sec - cgt1.tv_sec) +
        (double)((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

    // Impresión de tiempo de ejecución
    printf("Tiempo (seg): %0.9f\n", t); //%0.9f define los decimales a mostrar

    // Impresión de resultados
    //Para un numero de filas mayor que 8 solo imprimimos el primer y ultimo termino (en este caso sera un valor aleatorio)
    printf("\n__________\nResultados:\n");

    printf("\nMatriz B: \n");
    if (N < 9)
        for (i = 0; i < N; i++)
        {
            for (j = 0; j < N; j++)
                printf("%f ", B[i][j]);
            printf("\n");
        }
    else
        printf("B[0][0]=%f B[%d][%d]=%f\n", B[0][0], N - 1, N - 1, B[N - 1][N - 1]);

    printf("\nMatriz C: \n");
    if (N < 9)
        for (i = 0; i < N; i++)
        {
            for (j = 0; j < N; j++)
                printf("%f ", C[i][j]);
            printf("\n");
        }
    else
        printf("C[0][0]=%f C[%d][%d]=%f\n", C[0][0], N - 1, N - 1, C[N - 1][N - 1]);

    printf("\nMatriz A=B*C: \n");
    if (N < 9)
        for (i = 0; i < N; i++)
        {
            for (j = 0; j < N; j++)
                printf("%f ", A[i][j]);
            printf("\n");
        }
    else
        printf("A[0][0]=%f A[%d][%d]=%f\n", A[0][0], N - 1, N - 1, A[N - 1][N - 1]);

    printf("\n");

    for (int e = 0; e < N; e++)
    {
        free(A[e]);
        free(B[e]);
        free(C[e]);
    }
    free(A);
    free(B);
    free(C);

    return 0;
}