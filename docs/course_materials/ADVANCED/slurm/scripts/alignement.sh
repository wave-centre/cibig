#!/bin/bash
#SBATCH --array=0-5
#SBATCH --cpus-per-task=10
#SBATCH --mem=1G
#SBATCH --time=00:04:00

module load bowtie2/2.4.4 samtools/1.15.1

scratch=/scratch/demo_$USER
reference_index="/projects/ADVANCED/banks/arabidopsis_thaliana/TAIR10.1/bowtie2/Arabidopsis_thaliana.TAIR10.1_genomic"
files=(/scratch/demo_$USER/data/*fastq.gz)
file_id=$(basename -s .fastq.gz "${files[$SLURM_ARRAY_TASK_ID]}")

mkdir -p ${scratch}/results
rsync -ravz /projects/ADVANCED/slurm/data /scratch/demo_$USER/

srun -J "${file_id} bowtie2" bowtie2 --threads="${SLURM_CPUS_PER_TASK}" -x "${reference_index}" -U "${scratch}/data/${file_id}.fastq.gz" -S "${scratch}/results/${file_id}.sam"
srun -J "${file_id} filter" samtools view -hbS -q 30 -o "${scratch}/results/${file_id}.filtered.bam" "${scratch}/results/${file_id}.sam"
srun -J "${file_id} sort" samtools sort -o "${scratch}/results/${file_id}.bam" "${scratch}/results/${file_id}.filtered.bam"

rm "${scratch}/results/${file_id}.sam" "${scratch}/results/${file_id}.filtered.bam"
