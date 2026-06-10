# Bash_Bioinformatic_Tools

An automated, lightweight pipeline designed for core bioinformatic data processing using native Unix utilities and modular Bash scripting.

This repository provides an production-ready environment to process, filter, and analyze **FASTA** genomic sequences, **FASTQ** high-throughput sequencing reads, and **differential gene expression datasets**. By leveraging heavily optimized low-level Unix utilities (`awk`, `grep`, `sort`, `wc`), the pipeline achieves high-performance data transformation without the overhead of external dependencies.

---

## Key Features & Core Competencies

* **High-Throughput Sequence Parsing:** Optimized processing of multi-sequence FASTA and FASTQ structures.
* **Stream-Based Data Transformation:** Advanced column extraction, filtering, and deduplication of large-scale tabular data (`TSV`).
* **Automated Pipeline Orchestration:** End-to-end Bash workflows featuring robust error handling, structural validation, and execution isolation.
* **Comprehensive Logging:** Automated, timestamped execution tracking (`.log`) to guarantee strict auditability and computational reproducibility.
* **POSIX Compliance:** Built entirely upon standard native Unix tools, ensuring cross-platform compatibility across Linux, macOS, and WSL environments.

---

## Repository Architecture

```text
linux-bioinformatics-pipeline/
│
├── data/                  # Input datasets (FASTA, FASTQ, TSV)
│   ├── sec1.fasta
│   ├── sec2.fasta
│   ├── sec3.fasta
│   ├── test_reads.fastq
│   └── expresion_tratamientos.tsv
│
├── scripts/               # Production-grade Bash source scripts
│   ├── analisis1.sh
│   ├── analisis2.sh
│   ├── analisis3.sh
│   └── FASTQ.sh
│
├── results/               # Generated analytical reports and telemetry logs
│   ├── reports1.txt
│   ├── reports2.txt
│   ├── reports3.txt
│   ├── deejecucion.log
│   └── pipeline.log
│
└── README.md              # Project documentation
```

---

# System Requirements

The pipeline is completely self-contained and executes within standard POSIX-compliant environments. No external packages, package managers, or interpreters are required:

* bash (≥ 4.0 recommended)
* grep
* awk
* sort
* uniq
* wc
* column
* shuf

---

# Data Specs & Input Formats

## Genomic FASTA Records

Standard nucleotide sequence files. The core modules parse these files to identify structural patterns, map targeted motifs, and compute base composition metrics.

## High-Throughput FASTQ Reads

Standard 4-line per-record sequencing outputs containing unique read identifiers, raw nucleotide sequences, quality score delimiters, and Phred-scaled base quality strings.

## Quantitative Gene Expression Profiles (.tsv)

Tabular matrices mapping specific gene identifiers to experimental conditions and expression levels. Used to evaluate data integrity and perform downstream data cleaning.
---

# Script Specifications & CLI Usage

## analisis1.sh

Performs target motif mapping across individual FASTA files (defaults to searching for the **ATG** start codon).

Key Features

* Mechanics: Streams inputs via `grep` to extract target matching distributions and exports descriptive statistics.

* Executation:

```
bash scripts/analisis1.sh data/sec1.fasta
```

* Output

```
results/reports1.txt
```

---

## analisis2.sh

Executes automated filtration and matrix profiling on large gene expression tables.

* Mechanics: Isolates high-dimension features, normalizes gene structures, drops duplicate entries, and calculates global unique feature counts.

* Usage:

```
bash scripts/analisis2.sh data/expresion_tratamientos.tsv
```

* Output:

```
results/reports2.txt
```

---

## analisis3.sh

The primary batch-processing orchestration pipeline.

Mechanics: Runs automated structural file checks, parses multiple sequence records concurrently, aggregates motif frequencies, and writes comprehensive execution telemetry.

Usage:

```
bash scripts/analisis3.sh
```

Output:

```
results/reports3.txt
results/pipeline.log
```

---

## FASTQ.sh

Synthetic dataset generator engine designed to **output benchmarking sequences**.

* Mechanics: Leverages pseudorandom algorithms to generate structurally accurate FASTQ test data with variable quality metrics.

* Usage:

```
bash scripts/FASTQ.sh
```

Output:

```
data/test_reads.fastq
```

---

# End-to-End Execution Workflow

Execute the full suite using the following pipeline order to initialize datasets, perform single-molecule analysis, parse tables, and run batch workflows:

```
# 1. Initialize benchmarking FASTQ datasets
bash scripts/FASTQ.sh

# 2. Extract structural metrics from targeted FASTA records
bash scripts/analisis1.sh data/sec1.fasta

# 3. Process and normalize gene expression matrices
bash scripts/analisis2.sh data/expresion_tratamientos.tsv

# 4. Run the batch production pipeline across all multi-FASTA endpoints
bash scripts/analisis3.sh
```

---

# Pipeline Design Principles

To align with modern computational biology benchmarks, this pipeline adheres to strict operational standards:

* Computational Reproducibility: Fixed-seed data operations and deterministic pipeline structures yield identical outputs across identical environments.

* Data-Code Separation: Isolation of mutable data streams (data/, results/) from immutable source code logic (scripts/).

* Fail-Safe Processing: Scripts implement automated verification layers to trap errors early before downstream processing.


# Author

Carlos Garcia Corona

