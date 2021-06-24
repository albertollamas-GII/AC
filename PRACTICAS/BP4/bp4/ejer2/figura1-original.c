/**
 * @author Alberto Llamas Gonzale
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 1001
// Vectores globales
struct s
{
    int a;
    int b;
} s[MAX];

int main(int argc, char **argv)
{
    if (argc < 3)
        printf("\nIntroduzca el numero de parametros correcto N,M\n");
    
    int N = atoi(argv[1]);
    int M = atoi(argv[2]);

    struct timespec cgt1, cgt2;
    double t; // para tiempos

    struct s s[N];
    int R[M];

    int i, ii, X1, X2;
    srand48(time(NULL));

    // Inicialización
    for (i = 0; i < N; i++)
    {
        if (N < 9 && M < 9){
            s[i].a = i;
            s[i].b = i;
        } else {
            s[i].a = drand48();
            s[i].b = drand48();
        }
    }

    // Tiempo
    clock_gettime(CLOCK_REALTIME, &cgt1);

    for (ii = 0; ii < M; ii++)
    {
        X1 = 0;
        X2 = 0;
        for (i = 0; i < N; i++)
            X1 += 2 * s[i].a + ii;
        for (i = 0; i < N; i++)
            X2 += 3 * s[i].b - ii;
        if (X1 < X2)
            R[ii] = X1;
        else
            R[ii] = X2;
    }

    // Tiempo
    clock_gettime(CLOCK_REALTIME, &cgt2);

    t = (double)(cgt2.tv_sec - cgt1.tv_sec) +
        (double)((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

    // Impresión de tiempo de ejecución
    printf("Tiempo (seg): %f\n", t);

    // Impresión de resultados
    printf("\n__________\nResultados:\n");

    printf("\nVector R: \n");
    printf("R[0]=%d R[39999]=%d\n", R[0], R[M - 1]);

    return 0;
}