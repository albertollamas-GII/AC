#!/bin/bash

#PBS -N pmtv-OpenMP
#PBS -q ac

echo "N=200"
for i in `seq 1 8`
do
	export OMP_NUM_THREADS=$i
	$PBS_O_WORKDIR/pmm-OpenMP 200
done

echo "N=1000"
for i in `seq 1 8`
do
	export OMP_NUM_THREADS=$i
	$PBS_O_WORKDIR/pmm-OpenMP 1000
done
