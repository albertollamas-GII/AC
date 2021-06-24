#!/bin/bash

#Obtener información de las variables del entorno del sistema de colas:


echo -e "\nVERSIÓN LOCAL\n\n"
for ((N=65536; N<=67108864; N= N*2))
do
	
	./SumaVectores_loc $N
	
done



echo -e "\n VERSIÓN GLOBAL\n\n"
for ((N=65536; N<=67108864; N= N*2))
do
	
	./SumaVectores_glob $N
done


echo -e "\nVERSIÓN DINÁMICA\n\n"
for ((N=65536; N<=67108864; N= N*2))
do
	
	./SumaVectores_din $N
done

