#!/bin/bash

#SBATCH --cpus-per-task=10
#SBATCH --mem=1G
#SBATCH --time=05:00
#SBATCH --output=alignment-%j.out
#SBATCH --error=alignment-%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=mon@email.fr
#SBATCH --account=wave
#SBATCH --partition=wave

module load bowtie2/2.4.4 samtools/1.15.1

scratch=/scratch/demo_$USER
reference_index="/projects/ADVANCED/banks/arabidopsis_thaliana/TAIR10.1/bowtie2/Arabidopsis_thaliana.TAIR10.1_genomic"
file_id="KO1_1"

mkdir -p ${scratch}/results
rsync -ravz /projects/ADVANCED/slurm/data /scratch/demo_$USER/

srun bowtie2 --threads="${SLURM_CPUS_PER_TASK}" -x "${reference_index}" -U "${scratch}/data/${file_id}.fastq.gz" -S "${scratch}/results/${file_id}.sam"
srun samtools view -hbS -q 30 -o "${scratch}/results/${file_id}.filtered.bam" "${scratch}/results/${file_id}.sam"
srun samtools sort -o "${scratch}/results/${file_id}.bam" "${scratch}/results/${file_id}.filtered.bam"

rm "${scratch}/results/${file_id}.sam" "${scratch}/results/${file_id}.filtered.bam"
