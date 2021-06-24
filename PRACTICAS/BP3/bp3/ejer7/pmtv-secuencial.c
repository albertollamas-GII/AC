//@author Alberto Llamas González


#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char **argv)
{
    if (argc < 2)
    {
        printf("[ERROR]-Debe insertar tamaño de matriz y vector\n");
        exit(-1);
    }

    unsigned int tam = atoi(argv[1]);
    double **mat, *v, *res;

    // Reserva de espacio

    v = (double *)malloc(tam * sizeof(double));
    res = (double *)malloc(tam * sizeof(double));
    mat = (double **)malloc(tam * sizeof(double *));

    if ((v == NULL) || (res == NULL) || (mat == NULL))
    {
        printf("[ERROR]-Reserva para vectores\n");
        exit(-2);
    }

    int i, j;
    double suma, t;

    for (i = 0; i < tam; i++)
    {
        mat[i] = (double *)malloc(tam * sizeof(double));
        if (mat[i] == NULL)
        {
            printf("[ERROR]-Reserva para matriz\n");
            exit(-2);
        }
    }

    // Inicialización de matriz, mat
    for (i = 0; i < tam; i++)
        for (j = 0; j < tam; j++)
            if (j < i)
                mat[i][j] = 0;
            else
                mat[i][j] = 1;

    // Inicialización de vector, v
    for (i = 0; i < tam; i++)
        v[i] = i;

    // Medición de tiempos
    t = omp_get_wtime();

    // Cálculo de mat*v, res
    for (i = 0; i < tam; i++)
    {
        suma = 0;

        for (j = i; j < tam; j++)
            suma += mat[i][j] * v[j];

        res[i] = suma;
    }

    // Medición de tiempos
    t = omp_get_wtime() - t;

    // Impresión de tiempo de ejecución
    printf("Tiempo (seg): %f\n", t);

    // Impresión de resultado
    printf("\n__________\nResultado:\n");
    if (tam < 20)
        for (i = 0; i < tam; i++)
            printf("res[%d]=%f ", i, res[i]);
    else
        printf("res[0]=%f res[%d]=%f", res[0], tam - 1, res[tam - 1]);
    printf("\n");

    // Liberación de memoria
    free(v);
    free(res);
    for (i = 0; i < tam; i++)
        free(mat[i]);
    free(mat);

    return 0;
}
