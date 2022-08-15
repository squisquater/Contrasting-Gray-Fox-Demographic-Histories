#!/bin/bash -l
#SBATCH --job-name=bam_autosome_subset
#SBATCH --array=1-n
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 4:00:00
#SBATCH --mem=2GB
#SBATCH -p bmh
#SBATCH -A ctbrowngrp
#SBATCH -o bam_autosome_subset%a.out
#SBATCH -e bam_autosome_subset%a.err

SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" bamlist.txt | cut -f1)
BAM=$(sed "${SLURM_ARRAY_TASK_ID}q;d" bamlist.txt | cut -f2)
BEDIN=../../chr_keep.bed
BAMOUT=../../bam_subset_2/

module load bedtools

bedtools intersect -abam $BAM -b ${BEDIN} > ${BAMOUT}${SAMPLE}_subset.bam

##bamlist.txt is a file with 5 columns where:
##column 1 = sampleID
##column 2 = path to the .bam file
##column 3 = mean depth (not used in this script)
##column 4 = mean depth / 2 (not used in this script)
##column 5 = mean depth * 2 (not used in this script)
