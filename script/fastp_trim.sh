#!/bin/bash

mkdir -p results/fastq_trimmed
mkdir -p results/trimmed_fastp_reports

for R1 in data/*/*_1.fastq.gz
do
R2=${R1/_1.fastq.gz/_2.fastq.gz}

```
SAMPLE=$(basename "$R1" _1.fastq.gz)

echo "Processing $SAMPLE"

fastp \
  -i "$R1" \
  -I "$R2" \
  -o "results/fastq_trimmed/${SAMPLE}_1_trimmed.fastq.gz" \
  -O "results/fastq_trimmed/${SAMPLE}_2_trimmed.fastq.gz" \
  --detect_adapter_for_pe \
  --qualified_quality_phred 20 \
  --length_required 36 \
  --thread 4 \
  --html "results/trimmed_fastp_reports/${SAMPLE}_fastp.html" \
  --json "results/trimmed_fastp_reports/${SAMPLE}_fastp.json"
```

done

echo "Trimming complete."

# check the integrity of your gzip files 

gzip -t results/fastq_trimmed/SAMPLE_1_trimmed.fastq.gz
gzip -t results/fastq_trimmed/SAMPLE_2_trimmed.fastq.gz
