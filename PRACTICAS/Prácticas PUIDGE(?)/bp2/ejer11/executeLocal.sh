#!/bin/bash

for ((N=1;N<5;N=N+1))
do
   export OMP_NUM_THREADS=$N
   echo EJECUCIÓN CON NUM_THREADS=$N
   ./pmv-OpenMP-b 10000
done

for ((N=1;N<5;N=N+1))
do
   export OMP_NUM_THREADS=$N
   echo EJECUCIÓN CON NUM_THREADS=$N
   ./pmv-OpenMP-b 20000
done

