#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv){
	if (argc<3) {
		printf("[ERROR]-Debe insertar tamaño de matriz y vector\n");
		exit(-1);
	}

	unsigned int tam = atoi(argv[1]);
	double **mat, *v, *res;
	omp_sched_t kind;
	int chunk = atoi(argv[2]);
	

	// Reserva de espacio

	v = (double*) malloc(tam*sizeof(double));
	res = (double*) malloc(tam*sizeof(double));
	mat = (double**) malloc(tam*sizeof(double*));
	
	if ( ( v == NULL ) || ( res == NULL ) || ( mat == NULL ) ){
		printf("[ERROR]------Reserva para vectores\n");
		exit(-2);
	}

	int i, j;
	double suma, time;

	for ( i = 0; i < tam; i++ ){
		mat[i] = (double*) malloc(tam*sizeof(double));
		if ( mat[i] == NULL ){
			printf("[ERROR]-----Reserva para matriz\n");
			exit(-2);
		}
	}

	for ( i = 0; i < tam; i++ ){
        for( j = 0; j < tam; j++ ){
			mat[i][j] = (i+1)*(j+1);
	
        }
    }
		

	for ( i = 0; i < tam; i++ )
		v[i] = i;
		
	#pragma omp parallel private(i,j) shared(mat, res, v)
	{

		#pragma omp single
		{
			time = omp_get_wtime();
		}
		
		#pragma omp for schedule(runtime)
			for ( i = 0; i < tam; i++ ) {
				suma = 0;

				for ( j = i; j < tam; j++ ){

					suma += mat[i][j]*v[j];
				}
				res[i] = suma;
			}

		#pragma omp single
		{
			time = omp_get_wtime() - time; //Cálculo del tiempo en que se realiza el producto
			printf("Dentro de region paralela:");
            omp_get_schedule(&kind,&chunk);
            printf("Valor de run-sched-var: (%d, %d)\n", kind, chunk),
		}
		
	
	}
	printf("Tiempo: %f s\n", time);
	

	printf("\nResultado:\n");
	if ( tam < 20 )
		for ( i = 0; i < tam; i++)
			printf("res[%d]=%f ", i, res[i]);
	else
		printf("res[0]=%f res[%d]=%f", res[0], tam-1, res[tam-1]);
	printf("\n");
	
	free(v);
	free(res);

	for ( i=0; i<tam; i++ ){
        free(mat[i]);
    }
	free(mat);
	
	return 0;
}