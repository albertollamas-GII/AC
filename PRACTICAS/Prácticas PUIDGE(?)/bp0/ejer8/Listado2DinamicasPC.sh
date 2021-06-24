#!/bin/bash

#para N potencia de 2 desde 2^16 a 2^26
for ((N=65536;N<67108865;N=N*2))
do
	./Listado1Dinamicas $N
done
