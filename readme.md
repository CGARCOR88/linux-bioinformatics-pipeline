# Linux Bioinformatics Pipeline

Pipeline de práctica para análisis básico de datos bioinformáticos utilizando herramientas estándar de Unix y scripting en Bash.

Este proyecto forma parte de un bootcamp de Linux orientado a bioinformática. El objetivo es demostrar cómo procesar archivos **FASTA**, **FASTQ** y **tablas de expresión génica** utilizando herramientas de línea de comandos como `grep`, `awk`, `sort` y `wc`, además de automatizar tareas mediante scripts Bash.

---

# Objetivos del proyecto

Este repositorio demuestra competencias básicas necesarias en entornos de bioinformática:

* Navegación y manipulación de archivos en Linux
* Uso de herramientas Unix para análisis de datos biológicos
* Procesamiento de archivos FASTA y FASTQ
* Filtrado y transformación de datos tabulares
* Automatización mediante scripts Bash
* Generación de reportes reproducibles
* Organización profesional de un proyecto bioinformático

---

# Estructura del repositorio

```
linux-bioinformatics-pipeline/
│
├── data/                  # Archivos de entrada (FASTA, FASTQ, TSV)
│   ├── sec1.fasta
│   ├── sec2.fasta
│   ├── sec3.fasta
│   ├── test_reads.fastq
│   └── expresion_tratamientos.tsv
│
├── scripts/               # Scripts Bash del pipeline
│   ├── analisis1.sh
│   ├── analisis2.sh
│   ├── analisis3.sh
│   └── FASTQ.sh
│
├── results/               # Resultados generados y logs
│   ├── reports1.txt
│   ├── reports2.txt
│   ├── reports3.txt
│   ├── ejecucion.log
│   └── pipeline.log
│
└── README.md              # Documentación del proyecto
```

---

# Requisitos

El proyecto utiliza herramientas estándar disponibles en la mayoría de sistemas Linux o entornos WSL:

* bash
* grep
* awk
* sort
* uniq
* wc
* column
* shuf

No se requieren dependencias externas adicionales.

---

# Tipos de datos utilizados

## Archivos FASTA

Archivos de secuencias biológicas simuladas utilizados para pruebas.

```
data/sec1.fasta
data/sec2.fasta
data/sec3.fasta
```

Estos archivos contienen secuencias de nucleótidos que se analizan en busca de motivos específicos.

---

## Archivo FASTQ

Archivo con lecturas simuladas de secuenciación.

```
data/test_reads.fastq
```

El formato FASTQ contiene:

* identificador de lectura
* secuencia
* separador
* calidad de la secuencia

---

## Tabla de expresión génica

Archivo tabular que contiene genes asociados a diferentes tratamientos.

```
data/expresion_tratamientos.tsv
```

Este archivo se utiliza para practicar extracción de columnas y eliminación de duplicados.

---

# Scripts del proyecto

## analisis1.sh

Script que analiza archivos FASTA para buscar el motivo **ATG**.

Funciones principales:

* lectura de archivo FASTA
* búsqueda de patrones con `grep`
* conteo de ocurrencias
* generación de reporte

Ejemplo de ejecución:

```
bash scripts/analisis1.sh sec1.fasta
```

Salida generada:

```
results/reports1.txt
```

---

## analisis2.sh

Script que procesa la tabla de expresión génica.

Funciones:

* extracción de la columna de genes
* ordenación de genes
* eliminación de duplicados
* cálculo del número total de genes únicos

Ejemplo:

```
bash scripts/analisis2.sh expresion_tratamientos.tsv
```

Salida:

```
results/reports2.txt
```

---

## analisis3.sh

Pipeline automatizado que procesa múltiples archivos FASTA.

El script:

* valida la existencia de archivos
* procesa múltiples FASTA
* cuenta ocurrencias del motivo `ATG`
* genera un reporte consolidado
* crea logs de ejecución con fecha

Ejecución:

```
bash scripts/analisis3.sh
```

Salida:

```
results/reports3.txt
results/pipeline.log
```

---

## FASTQ.sh

Script para generar **lecturas FASTQ simuladas**.

Utiliza secuencias aleatorias para crear datos de prueba que pueden utilizarse en pipelines de bioinformática.

Ejecutar:

```
bash scripts/FASTQ.sh
```

Salida generada:

```
data/test_reads.fastq
```

---

# Ejemplo de flujo de trabajo

Un flujo típico de análisis podría ser:

```
# generar FASTQ de prueba
bash scripts/FASTQ.sh

# analizar un archivo FASTA
bash scripts/analisis1.sh sec1.fasta

# analizar expresión génica
bash scripts/analisis2.sh expresion_tratamientos.tsv

# ejecutar pipeline sobre múltiples FASTA
bash scripts/analisis3.sh
```

---

# Buenas prácticas aplicadas

El proyecto sigue algunas prácticas habituales en pipelines de bioinformática:

* uso de **scripts reproducibles**
* generación automática de **logs**
* organización clara de datos, scripts y resultados
* uso de **herramientas Unix estándar**
* estructura de proyecto compatible con entornos de investigación

---

# Autor

Carlos
Proyecto de práctica – Linux Bootcamp de Bioinformática
