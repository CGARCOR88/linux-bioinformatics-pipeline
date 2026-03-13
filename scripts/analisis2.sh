#!/bin/bash

INPUT="/c/Users/Usuario/Desktop/docu programacion/00 Linux/boot_camp_bioinfo/proyecto1/data/$1"
OUTPUT="../results/reports2.txt"

if [ -f "$INPUT" ]; then
    
    genes_limpios=$(awk 'NR>1 {print $1}' "$INPUT" | sort -u) # Ordenamiento de archivos
    
    num_unicos=$(echo "$genes_limpios" | wc -l) # Conteo de archivos ordenados
    
    # 3. Guardamos los resultados
    echo "--- Reporte de Genes ---" >> "$OUTPUT"
    echo "Archivo analizado: $1" >> "$OUTPUT"
    echo "El número total de genes únicos es: $num_unicos" >> "$OUTPUT"
    echo "Lista de genes:" >> "$OUTPUT"
    echo "$genes_limpios" >> "$OUTPUT"
    
    echo "El código ha funcionado: Se han detectado $num_unicos genes."
else
    echo "Error: El archivo no se ha cargado en la ruta: $INPUT"
fi