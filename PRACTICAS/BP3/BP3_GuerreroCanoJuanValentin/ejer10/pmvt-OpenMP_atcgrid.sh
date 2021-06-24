#!/bin/bash

export OMP_SCHEDULE="monotonic:static"
srun -pac ./pmtv-OpenMP 16000
export OMP_SCHEDULE="monotonic:static,1"
srun -pac ./pmtv-OpenMP 16000
export OMP_SCHEDULE="monotonic:static,64"
srun -pac ./pmtv-OpenMP 16000


export OMP_SCHEDULE="monotonic:dynamic"
srun -pac ./pmtv-OpenMP 16000
export OMP_SCHEDULE="monotonic:dynamic,1"
srun -pac ./pmtv-OpenMP 16000
export OMP_SCHEDULE="monotonic:dynamic,64"
srun -pac ./pmtv-OpenMP 16000


export OMP_SCHEDULE="monotonic:guided"
srun -pac ./pmtv-OpenMP 16000
export OMP_SCHEDULE="monotonic:guided,1"
srun -pac ./pmtv-OpenMP 16000
export OMP_SCHEDULE="monotonic:guided,64"
srun -pac ./pmtv-OpenMP 16000