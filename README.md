# CCCP Bulk RNA-seq: Read Trimming and Quality Control

## Project Overview

This repository contains the trimming and post-trimming quality control workflow for a bulk RNA-seq dataset investigating transcriptional responses to Carbonyl Cyanide m-Chlorophenyl Hydrazone (CCCP) treatment.

The dataset consists of 12 paired-end RNA-seq samples:

* CCCP-treated cells
* DMSO controls
* 6-hour and 12-hour treatment timepoints
* 3 biological replicates per condition

---

## Experimental Design

| Condition | Timepoint | Replicates |
| --------- | --------- | ---------- |
| CCCP      | 6 h       | 3          |
| DMSO      | 6 h       | 3          |
| CCCP      | 12 h      | 3          |
| DMSO      | 12 h      | 3          |

Total samples: **12 paired-end RNA-seq libraries**

---

## Workflow

```text
Raw FASTQ
    ↓
FastQC
    ↓
MultiQC
    ↓
fastp
    ↓
Trimmed FASTQ
    ↓
FastQC
    ↓
MultiQC
```

---

## Read Trimming

Read trimming was performed using **fastp**.

### Parameters Used

| Parameter           | Value                          | Purpose                                        |
| ------------------- | ------------------------------ | ---------------------------------------------- |
| Adapter detection   | `--detect_adapter_for_pe`      | Automatic paired-end adapter detection         |
| Quality threshold   | `--qualified_quality_phred 20` | Retain bases with Phred score ≥ 20             |
| Minimum read length | `--length_required 36`         | Remove reads shorter than 36 bp after trimming |
| Threads             | `--thread 4`                   | Parallel processing                            |

### Rationale

The selected parameters provide a balance between:

* Removing low-quality bases
* Removing adapter contamination
* Retaining sufficient sequencing depth
* Preserving biologically informative reads

---

## Quality Control

Quality control was assessed before and after trimming using **FastQC** and summarized with **MultiQC**.

Metrics evaluated included:

* Per-base sequence quality
* Per-sequence quality scores
* Adapter contamination
* Sequence duplication levels
* GC content distribution
* Overrepresented sequences

---

## Repository Structure

```text
.
├── metadata/
├── scripts/
│   └── fastp_trim.sh
├── results/
│   ├── fastp_reports/
│   ├── fastqc_trimmed/
│   └── multiqc_trimmed/
└── README.md
```

---

## Software

| Software       | Purpose                                 |
| -------------- | --------------------------------------- |
| FastQC         | Raw and trimmed read quality assessment |
| MultiQC        | Aggregated QC reporting                 |
| fastp          | Adapter removal and quality trimming    |
| Linux (Ubuntu) | Computational environment               |

---

## Key Outputs

* Fastp trimming reports (HTML and JSON)
* FastQC reports for trimmed reads
* MultiQC summary report
* Quality-controlled FASTQ files for downstream alignment

---

## Next Step

Alignment of trimmed reads to the human reference genome using HISAT2.
