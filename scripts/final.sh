#!/bin/bash

INPUT="/c/Users/Usuario/Desktop/docu programacion/00 Linux/linux-bioinformatics-pipeline/data"
OUTPUT="../results/reports5.txt"
LOG="../results/pipeline.log"

echo "--- Inicio de ejecución: $(date '+%Y-%m-%d %H:%M:%S') ---" >> "$LOG"

# 1. CONTAR READS
# Verificamos si el archivo existe antes de empezar

validar_archivo() {
    local archivo="$1"
    
    if [[ ! -f "$archivo" ]]; then return 1; 
    fi

    if [[ "$archivo" != *.fasta && "$archivo" != *.fastq && "$archivo" != *.fa && "$archivo" != *.fq ]]; then return 1; 
    fi

    if [[ ! -s "$archivo" ]]; then return 1;
    fi

    local primer_linea=$(head -n 1 "$archivo")
    
    if [[ "$primer_linea" == ">"* ]]; then
        echo "FASTA"
    elif [[ "$primer_linea" == "@"* ]]; then
        local tercera_linea=$(sed -n '3p' "$archivo")
        if [[ "$tercera_linea" == "+"* ]]; then
            echo "FASTQ"
        else
            return 1
        fi
    else
        return 1
    fi
}

escribir_log() {
    local mensaje="$1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $mensaje" >> "$LOG"
}

procesar_fasta() { 
    local archivo="$1"
    local lineas_reales=$(grep -v '^[[:space:]]*$' "$archivo" | wc -l)
    local num_seqs=$(grep -c "^>" "$archivo")
    local total_bases=$(grep -v "^>" "$archivo" | tr -d '[:space:]' | wc -c)
    local media=0

    if [[ $num_seqs -gt 0 ]]; then
        media=$(awk "BEGIN {print $total_bases / $num_seqs}")
    fi
        
    echo "Archivo: $(basename "$archivo") | Tipo: FASTA | Secuencias: $num_seqs | Líneas: $lineas_reales" >> "$OUTPUT"
    echo "Tamaño medio: $media" >> "$OUTPUT"
    echo "-------------------------------------------------" >> "$OUTPUT"
}

procesar_fastq() {
    local archivo="$1"
    local lineas_reales=$(grep -v '^[[:space:]]*$' "$archivo" | wc -l)
    local num_seqs=$(( $(wc -l < "$archivo") / 4 ))
    local total_bases=$(awk 'NR % 4 == 2 { total += length($0) } END { print total }' "$archivo")
    local media=0
    
    if [[ $num_seqs -gt 0 ]]; then
        media=$(awk "BEGIN {print $total_bases / $num_seqs}")
    fi

    echo "Archivo: $(basename "$archivo") | Tipo: FASTQ | Secuencias: $num_seqs | Líneas: $lineas_reales" >> "$OUTPUT"
    echo "Tamaño medio: $media" >> "$OUTPUT"
    echo "-------------------------------------------------" >> "$OUTPUT"
}

# --- BUCLE PRINCIPAL ---

for i in "$INPUT"/*; do

    TIPO=$(validar_archivo "$i")
    ESTADO=$? # Guardamos el código de salida inmediatamente

    if [[ $ESTADO -eq 0 ]]; then
        echo "✅ Detectado $TIPO: $(basename "$i")"
        
        # Usamos la variable TIPO que nos dio la función de validación
        if [[ "$TIPO" == "FASTA" ]]; then
            procesar_fasta "$i"
            escribir_log "Procesado FASTA completado para $(basename "$i")"
        elif [[ "$TIPO" == "FASTQ" ]]; then
            procesar_fastq "$i"
            escribir_log "Procesado FASTQ completado para $(basename "$i")"
        fi
    else
        echo "❌ Saltando (Formato no válido): $(basename "$i")"
    fi
done

escribir_log "--- Fin de la ejecución del pipeline ---"