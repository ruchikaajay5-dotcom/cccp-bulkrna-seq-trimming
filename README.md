# Background:
CCCP is a mitochondrial uncoupler that disrupts oxidative phosphorylation and mitochondrial membrane potential. This project performs quality assessment of time point based RNA-seq data generated from CCCP-treated and DMSO-treated HeLa cells at two time points 6 hours and 12 hours.

# Dataset:
- GEO accession: GSE303802 
- Organism: Homo sapiens 
- Cell line: HeLa 
- Platform: Illumina NovaSeq 6000 
- Layout: Paired-end RNA-seq 
- Total number of Samples: 12 
- Replicates per group: 3 

# Downloading the data:
Data files were downloaded using the European Nucleotide Archive (ENA) database.

# Overview
This project performs trimming of the data using fastp after the initial analysis of the MultiQc reports. 

Due to temporary VM storage exhaustion during downstream QC, FastQC analysis of trimmed reads could not be completed for all samples.

Trimming quality assessment was therefore performed using Fastp-generated HTML/JSON reports summarized with MultiQC.

Fastp provides comprehensive pre- and post-trimming quality metrics including read retention, adapter removal statistics, quality score distributions, duplication rate estimates, and insert size distributions.

# Workflow
1. Quality assesment of MultiQC file (from the previous project)
2. Adapter trimming + quality filtering using fastp
3. Generation of fastp reports
4. Generation of MultiQC reports from fastp reports

# Tools
- Linux Command Line
- fastp – Read QC, adapter trimming, quality filtering
- MultiQC – Aggregation and visualization of QC metrics across samples

# Key Processing Steps
1. Quality Control & Trimming (fastp)
- Adapter removal
- Quality-based base trimming
- Filtering of low-quality and short reads
- Generation of per-sample QC reports (HTML + JSON)

Outputs:
Trimmed FASTQ files
fastp QC reports

2. Aggregated QC Reporting (MultiQC)
- Combined all fastp reports into a unified dataset view
 
Output:
multiqc_report.html

# Next Steps
- Read alignment (STAR / HISAT2)
- Gene quantification (featureCounts / Salmon)
- Differential expression analysis (DESeq2 / edgeR)
