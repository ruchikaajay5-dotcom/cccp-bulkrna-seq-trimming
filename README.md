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

## Interpretation:
- Mean quality scores: before trimming the mean quality scores sat firmly in the green zone (Q >30) across all positions, after trimming the mean quality scores remained the same, thus indicating high base-call quality.
- Per sequence quality scores: before trimming, vast majority of reads peaked at around Q35-Q36, after trimming, the distribution remained the same. Thus indicating, the library preparation was done properly and it had very few poor-quality reads. 
- Per Sequence GC content: before trimming the GC distribution showed a smooth, bell shaped curve and the peak was obtained at around 45-50% GC, which is consistent for a mammalian GC. After trimming, the distribution remained almost the same and sice GC bias was not present, trimming was not aggressively done.
- Per Base N content: before trimming, N content was nearly 0% across all positions. After trimming, an identical pattern was observed too.
- Sequence duplication levels: before trimming, ~30% of sequences appear as level-1 duplicates, indicating that they are unique. A bump at higher duplication levels (>10x) was seen, which in bulk RNA-seq experiments reflect PCR bias or highly expressed genes. Since the results of this analysis has been consistently promising, the secondary bump is likely due to highly expressed genes. After trimming, the pattern is nearly identical.
- Sequence Length distribution: before trimming, all the reads are uniform 150bp. After trimming, the distribution peak at a region between 140-150 bp, yet still closer to 150bp. This indicates that the low quality tails were trimmed and it resulted in reads being shortened. 
- Adapter content: before trimming, low adapter contamination was seen at 1-1.5%, after trimming the adapter signal significantly reduced across all positions to ~0.5%.

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
