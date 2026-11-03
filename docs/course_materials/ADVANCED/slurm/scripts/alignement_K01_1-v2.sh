#!/bin/bash
#SBATCH --cpus-per-task=10
#SBATCH --mem=1G

module load bowtie2/2.4.4 samtools/1.15.1

scratch=/scratch/demo_$USER
reference_index="/projects/ADVANCED/banks/arabidopsis_thaliana/TAIR10.1/bowtie2/Arabidopsis_thaliana.TAIR10.1_genomic"
file_id="KO1_1"

mkdir -p ${scratch}/results

srun bowtie2 --threads=10 -x "${reference_index}" -U "${scratch}/data/${file_id}.fastq.gz" -S "${scratch}/results/${file_id}.sam"
srun samtools view -hbS -q 30 -o "${scratch}/results/${file_id}.filtered.bam" "${scratch}/results/${file_id}.sam"
srun samtools sort -o "${scratch}/results/${file_id}.bam" "${scratch}/results/${file_id}.filtered.bam"