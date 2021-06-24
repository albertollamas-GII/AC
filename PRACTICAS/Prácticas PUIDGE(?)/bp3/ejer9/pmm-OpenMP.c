#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv){
	if ( argc < 2 ) {
		printf("[ERROR]-Debe insertar tamaño matriz\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]);
	double **A, **B,**C;
	
	
	// Reserva de espacio
	
	A = (double**) malloc(N*sizeof(double *));
	B = (double**) malloc(N*sizeof(double *));
	C = (double**) malloc(N*sizeof(double *));
	
	if ( (A==NULL) || (B==NULL) || (C==NULL) ){
		printf("Error en la reserva de espacio para las matrices\n");
		exit(-2);
	}
	
	int i, j, k;
	double suma, t;
	
	for ( i = 0; i < N; i++ ) {
		A[i] = (double*) malloc(N*sizeof(double));
		B[i] = (double*) malloc(N*sizeof(double));
		C[i] = (double*) malloc(N*sizeof(double));
		
		if ( A[i] == NULL || B[i] == NULL || C[i] == NULL ) {
			printf("Error en la reserva de espacio para los vectores\n");
			exit(-2);
		}
	}
	
	
	// Inicialización matrices B, C
	#pragma omp parallel shared(B,C) private(i,j)
	{
		#pragma omp for schedule(runtime)
		for ( i = 0; i < N; i++ )
			for ( j = 0; j < N; j++ )
				A[i][j]=0;
				
		#pragma omp for schedule(runtime)
		for ( i = 0; i < N; i++ )
			for ( j = 0; j < N; j++ )
				B[i][j]=j+1;
		
		#pragma omp for schedule(runtime)
		for ( i = 0; i < N; i++ )
			for ( j = 0; j < N; j++ )
				C[i][j]=j+1;
	}
	

	// Cálculo de A=B*C
	#pragma omp parallel shared(A,B,C) private(i,j,k)
	{
		// Tiempo
		#pragma omp single
		{
			t = omp_get_wtime();
		}
		
		#pragma omp for schedule(runtime)
		for ( i = 0; i < N ; i++ )
			for ( j = 0; j < N; j++ ) {
				A[i][j] = 0;
				for ( k = 0; k < N; k++ )
					A[i][j] = A[i][j]+B[i][k]*C[k][j];
			}
		
		#pragma omp single
		{
			t = omp_get_wtime() - t;
		}
	}
	
	// Impresión de tiempo de ejecución
	printf("Tiempo (seg): %f\n", t);
	
	// Impresión de resultados
	printf("\n__________\nResultados:\n");
	
	printf("\nMatriz B: \n");
	if ( N < 10 )
		for ( i = 0; i < N; i++ ) {
			for ( j = 0; j < N; j++ )
				printf("%f ", B[i][j]);
			printf("\n");
		}
	else
		printf("B[0][0]=%f B[%d][%d]=%f\n", B[0][0], N-1, N-1, B[N-1][N-1]);
		
	printf("\nMatriz C: \n");
	if ( N < 10 )
		for ( i = 0; i < N; i++ ) {
			for ( j = 0; j < N; j++ )
				printf("%f ", C[i][j]);
			printf("\n");
		}
	else
		printf("C[0][0]=%f C[%d][%d]=%f\n", C[0][0], N-1, N-1, C[N-1][N-1]);
	
	printf("\nMatriz A=B*C: \n");
	if ( N < 10 )
		for ( i = 0; i < N; i++ ) {
			for ( j = 0; j < N; j++ )
				printf("%f ", A[i][j]);
			printf("\n");
		}
	else
		printf("A[0][0]=%f A[%d][%d]=%f\n", A[0][0], N-1, N-1, A[N-1][N-1]);
		
	printf("\n");
	
	
	// Liberar
	for (i=0; i<N; i++)
		free(A[i]); free(B[i]); free(C[i]);

	free(A); free(B); free(C);
	
	return 0;
} 
