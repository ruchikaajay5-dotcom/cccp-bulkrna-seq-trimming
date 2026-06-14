#!/bin/bash

mkdir -p results/multiqc_trimmed

multiqc results/ \
  -o results/multiqc_trimmed
