#!/bin/bash -l
#SBATCH --job-name=bam2fq_autosomes
#SBATCH --array=1-n
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 20:00:00
#SBATCH --mem=4GB
#SBATCH -p high
#SBATCH -o bam2fq_autosomes%A_%a.out
#SBATCH -e bam2fq_autosomes%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" bamlist_depth.txt | cut -f1)
BAM=$(sed "${SLURM_ARRAY_TASK_ID}q;d" bamlist_depth.txt | cut -f2)
MIN_DEPTH=$(sed "${SLURM_ARRAY_TASK_ID}q;d" bamlist_depth.txt | cut -f4)
MAX_DEPTH=$(sed "${SLURM_ARRAY_TASK_ID}q;d" bamlist_depth.txt | cut -f5)

echo "converting .bam to .fastq for ${SAMPLE}"

module load htslib
module load samtools
module load bcftools

samtools mpileup -Q 30 -q 30 -u -v -f ~/Reference_Genomes/canFam3_withY.fa ${BAM} |
bcftools call -c |  
vcfutils.pl vcf2fq -d ${MIN_DEPTH} -D ${MAX_DEPTH} -Q 30 | gzip > ../../PSMC/final_fqfiles/${SAMPLE}.fq.gz

end=`date +%s`
runtime=$((end-start))
echo "finished converting ${SAMPLE}.bam to ${SAMPLE}.fastq after ${runtime} seconds"


##bamlist_depth.txt is a file with 5 columns where:
##column = sampleID
##column 2 = path to the .bam file
##column 3 = mean depth (not used in this script)
##column 4 = mean depth / 2 (not used in this script)
##column 5 = mean depth * 2

