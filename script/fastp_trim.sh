#!/bin/bash

mkdir -p results/trimmed
mkdir -p results/trimmed_fastqc

for R1 in data/*/*_1.fastq.gz
do
    R2=${R1/_1.fastq.gz/_2.fastq.gz}

    SAMPLE=$(basename "$R1" _1.fastq.gz)

    echo "Processing $SAMPLE"

    fastp \
      -i "$R1" \
      -I "$R2" \
      -o "results/trimmed/${SAMPLE}_1_trimmed.fastq.gz" \
      -O "results/trimmed/${SAMPLE}_2_trimmed.fastq.gz" \
      --detect_adapter_for_pe \
      --qualified_quality_phred 20 \
      --length_required 36 \
      --thread 4 \
      --html "results/trimmed_fastqc/${SAMPLE}_fastp.html" \
      --json "results/trimmed_fastqc/${SAMPLE}_fastp.json"

done

