/**
 * @file figura1-modificado_a.c
 * @brief Cálculo de la suma de dos vectores - secuencial, modificación A
 * @author Miguel Ángel Fernández Gutiérrez <mianfg@correo.ugr.es>
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Vectores globales
struct {
	int a;
	int b;
} s[5000];

int R[40000];


int main(){
	struct timespec cgt1,cgt2; double t;	// para tiempos
	
	int i, ii, X1, X2;
	
	// Inicialización
	for ( i = 0; i < 5000; i++ ) {
		s[i].a = i;
		s[i].b = i;
	}
	
	// Tiempo
	clock_gettime(CLOCK_REALTIME,&cgt1);
	
	for ( ii = 0; ii < 40000; ii++ ) {
		X1 = 0; X2 = 0;
		
		for ( i = 0; i < 5000; i++ ) {
			X1 += 2*s[i].a+ii;
			X2 += 3*s[i].b-ii;
		}
		
		if ( X1 < X2 )  R[ii] = X1;  else  R[ii] = X2;
	}
	
	// Tiempo
	clock_gettime(CLOCK_REALTIME,&cgt2);
	
	t = (double) (cgt2.tv_sec-cgt1.tv_sec)+
	    (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
	
	// Impresión de tiempo de ejecución
	printf("Tiempo (seg): %f\n", t);
	
	
	// Impresión de resultados
	printf("\n__________\nResultados:\n");
	
	printf("\nVector R: \n");
	printf("R[0]=%d R[39999]=%d\n", R[0], R[40000-1]);
	
	return 0;
}
