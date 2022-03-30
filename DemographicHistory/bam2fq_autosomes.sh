#!/bin/bash -l
#SBATCH --job-name=bam2fq_autosomes
#SBATCH --array=1-16
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 20:00:00
#SBATCH --mem=4GB
#SBATCH -p high
#SBATCH -o /home/sophiepq/GrayFoxWGS/GrayFox1/slurmlogs/bam2fq_autosomes%A_%a.out
#SBATCH -e /home/sophiepq/GrayFoxWGS/GrayFox1/slurmlogs/bam2fq_autosomes%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/GrayFoxWGS/GrayFox1/mlRho/bam_subset_2/bamlist_depth.txt | cut -f1)
BAM=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/GrayFoxWGS/GrayFox1/mlRho/bam_subset_2/bamlist_depth.txt | cut -f2)
MIN_DEPTH=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/GrayFoxWGS/GrayFox1/mlRho/bam_subset_2/bamlist_depth.txt | cut -f4)
MAX_DEPTH=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/GrayFoxWGS/GrayFox1/mlRho/bam_subset_2/bamlist_depth.txt | cut -f5)

module load htslib
module load samtools
module load bcftools

samtools mpileup -Q 30 -q 30 -u -v -f ~/Reference_Genomes/canFam3_withY.fa ${BAM} |
bcftools call -c |  
vcfutils.pl vcf2fq -d ${MIN_DEPTH} -D ${MAX_DEPTH} -Q 30 | gzip > ~/GrayFoxWGS/GrayFox1/angsd/PSMC/final_fqfiles/${SAMPLE}.fq.gz


##bamlist_depth.txt is a file with 5 columns where:
##column = sampleID
##column 2 = path to the .bam file
##column 3 = mean depth (not used in this script)
##column 4 = mean depth / 2 (not used in this script)
##column 5 = mean depth * 2

