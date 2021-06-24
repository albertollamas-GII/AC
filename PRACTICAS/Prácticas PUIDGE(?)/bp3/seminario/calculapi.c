#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv)
{
	register double width,x;
	double sum=0;
	register int intervals, i;

	struct timespec cgt1,cgt2;
	double ncgt;
	if(argc < 2) {
		fprintf(stderr,"\nFalta no intervalos\n");
		exit(-1);
	}
	intervals=atoi(argv[1]);
	if (intervals<1) intervals=1;

	clock_gettime(CLOCK_REALTIME,&cgt1);

	width = 1.0 / intervals;
	
	for (i=0; i<intervals; i++) {
		x = (i + 0.5) * width;
		sum += 4.0 / (1.0 + x * x);
	}

	sum *= width;

	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Iteraciones:\t%d\t. PI:\t%26.24f\t. Threads:\t1\t. Tiempo:\t%8.6f\n", intervals,sum,ncgt);

	return(0);
}
