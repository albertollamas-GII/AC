#!/bin/bash
#Todos los scripts que se hagan para atcgrid deben incluir lo siguiente:
#
#echo "Id. del trabajo: $PBS_JOBID"
#echo "Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
#echo "Nodo que ejecuta qsub: $PBS_O_HOST"
#echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
#echo "Cola: $PBS_QUEUE"
#echo "Nodos asignados al trabajo:" 
#cat $PBS_NODEFILE
# FIN del trozo que deben incluir todos los scripts

#para N potencia de 2 desde 2^16 a 2^26
for ((N=65536;N<67108865;N=N*2))
do
	./Listado1Local $N
done
