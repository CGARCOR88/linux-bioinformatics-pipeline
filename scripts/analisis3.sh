#!/bin/bash

INPUT="/c/Users/Usuario/Desktop/docu programacion/00 Linux/boot_camp_bioinfo/proyecto1/data"
OUTPUT="../results/reports3.txt"
LOG="../results/pipeline.log"

echo "------------------------------------------------" >> "$LOG"

log_msg() {
    echo "$(date "+%d-%m-%Y %H:%M:%S") - $1" >> "$LOG"
}

log_msg "iniciando analisis de datos"

# 1. Escribimos la cabecera con un simple echo -e
echo -e "ARCHIVO\tLINEAS\tFECHA_PROCESO" > "$OUTPUT"

for archivo in "$INPUT"/*.fasta; do
    if [ -f "$archivo" ]; then
        nombre=$(basename "$archivo")
        log_msg "procesando archivo $nombre"

        variable=$(grep 'ATG' "$archivo" | wc -l)
        fecha=$(date "+%d-%m-%Y")

        # 2. Escribimos los datos separados por una tabulacion (\t)
        echo -e "$nombre\t$variable\t$fecha" >> "$OUTPUT"
    else
        log_msg "ERROR: No encontré archivos en la ruta."
    fi
done


column -t -s $'\t' "$OUTPUT" > "$OUTPUT.tmp" && mv "$OUTPUT.tmp" "$OUTPUT" # asignacion de formato de tabulación.

log_msg "Analisis de datos finalizado"

cat "$OUTPUT"