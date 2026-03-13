#!/bin/bash

for i in {1..10}; do
    # 1. ID de la lectura
    echo "@READ_$i" >> test_reads.fastq
    
    # 2. Generar 50 bases aleatorias (A,T,C,G)
    seq=$(echo "ATCG" | fold -w1 | shuf -n 50 -r | tr -d '\n')
    echo "$seq" >> test_reads.fastq
    
    # 3. El signo +
    echo "+" >> test_reads.fastq
    
    # 4. Calidad aleatoria (caracteres del ASCII 33 al 73, comunes en Illumina)
    # Generamos la misma longitud que la secuencia
    qual=$(printf '%b' $(printf '\\%o' {33..73}) | fold -w1 | shuf -n 50 -r | tr -d '\n')
    echo "$qual" >> test_reads.fastq
done