mkdir -p results/fastqc_trimmed

fastqc results/fastq_trimmed/*.fastq.gz \
-o results/fastqc_trimmed

# check the number of FASTQc files generated

ls results/fastqc_trimmed/*_fastqc.html | wc -l

# check the availabe space in your VM 

df -h
