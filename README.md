# RNA-seq Trimming Pipeline

# Overview
This project performs trimming of the data using fastp after the initial analysis of the FASTQc and MultiQc reports.

# Workflow
Raw FASTQ files
→ Quality assessment (fastp internal QC)
→ Adapter trimming + quality filtering using fastp
→ Generation of fastp reports
→ Generation of MultiQC reports from fastp reports

# Tools
fastp – Read QC, adapter trimming, quality filtering
MultiQC – Aggregation and visualization of QC metrics across samples

# Key Processing Steps
1. Quality Control & Trimming (fastp)
Adapter removal
Quality-based base trimming
Filtering of low-quality and short reads
Generation of per-sample QC reports (HTML + JSON)

Outputs:
Trimmed FASTQ files
fastp QC reports

2. Aggregated QC Reporting (MultiQC)
Combined all fastp reports into a unified dataset view 
Output:
multiqc_report.html

# Next Steps
- Read alignment (STAR / HISAT2)
- Gene quantification (featureCounts / Salmon)
- Differential expression analysis (DESeq2 / edgeR)
