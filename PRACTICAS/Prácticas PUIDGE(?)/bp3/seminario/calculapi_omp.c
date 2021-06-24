#include <stdlib.h>
#include <stdio.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_max_threads() 1
#endif

int main(int argc, char **argv)
{
	register double width,x;
	double sum=0;
	register int intervals, i;

	double t;

	if(argc < 2) {
		fprintf(stderr,"\nFalta no intervalos\n");
		exit(-1);
	}
	intervals=atoi(argv[1]);
	if (intervals<1) intervals=1;

	t=omp_get_wtime();

	width = 1.0 / intervals;
	
	#pragma omp parallel
	{
		#pragma omp for reduction(+:sum) private(x)
		for (i=0; i<intervals; i++) {
			x = (i + 0.5) * width;
			sum += 4.0 / (1.0 + x * x);
		}
	}

	sum *= width;

	t=omp_get_wtime()-t;

	printf("Iteraciones:\t%d\t. Pi:\t%26.24f\t. Threads:\t%d\t. Tiempo:\t%8.6f\n", intervals,sum,omp_get_max_threads(),t);

	return(0);
}
