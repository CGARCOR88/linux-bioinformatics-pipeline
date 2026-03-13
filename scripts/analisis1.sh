#!/bin/bash

archivo="/c/Users/Usuario/Desktop/docu programacion/00 Linux/boot_camp_bioinfo/proyecto1/data/$1" #Ruta dinamica del archivo, solo debes poner el nombre

if [[ $archivo = *.fasta ]]; then
    echo 'archivo bien metido'

    variable=$(grep -n 'ATG' "$archivo" | wc -l) #debo poner las comillas al "$archivo" para que grep lo entienda como una ruta.
    echo "se han encontrado $variable lineas" > ../results/reports1.txt
    echo "analisis finalizado"
else
    echo 'archivo mal metido'
fi

