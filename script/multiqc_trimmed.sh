#!/bin/bash

mkdir -p results/multiqc_fastp_only

multiqc results/fastp_reports \
  -o results/multiqc_fastp_only
