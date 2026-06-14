#!/bin/bash

mkdir -p results/fastqc_trimmed

for fq in results/trimmed/*_trimmed.fastq.gz
do
    echo "Running FastQC on $fq"

    fastqc "$fq" \
      --outdir results/fastqc_trimmed \
      --threads 4
done
