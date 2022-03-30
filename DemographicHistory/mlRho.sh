#!/bin/bash -l
#SBATCH --job-name=mlrho_maxd2x
#SBATCH --array=1-x #Number of samples
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 16:00:00
#SBATCH --mem=2GB
#SBATCH -p bmm
#SBATCH -A ctbrowngrp
#SBATCH -o /home/sophiepq/GrayFoxWGS/GrayFox1/slurmlogs/mlrho_maxd2x_%A_%a.out
#SBATCH -e /home/sophiepq/GrayFoxWGS/GrayFox1/slurmlogs/mlrho_maxd2x_%A_%a.err

SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/GrayFoxWGS/GrayFox1/mlRho/bam_subset_2/bamlist_depth.txt | cut -f1)
BAM=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/GrayFoxWGS/GrayFox1/mlRho/bam_subset_2/bamlist_depth.txt | cut -f2)
MAX_DEPTH=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/GrayFoxWGS/GrayFox1/mlRho/bam_subset_2/bamlist_depth.txt | cut -f5)

cd ~/GrayFoxWGS/GrayFox1/mlRho

module load samtools

samtools view -b $BAM | samtools mpileup -d ${MAX_DEPTH} -q 20 -Q 20 - | cut -f 2,5 | awk -f /home/cbquinn/bin/MlRho_2.9/Scripts/bam2pro.awk | /home/cbquinn/bin/FormatPro_0.5/formatPro -c 4 -n ${SAMPLE}_d2x.c4
# compute the genome-wide scaled mutation rate (theta)
/home/cbquinn/bin/MlRho_2.9/mlRho -M 0 -I -n ${SAMPLE}_d2x.c4 > theta.${SAMPLE}_d2x.c4.txt

##bamlist_depth.txt is a file with 5 columns where:
##column = sampleID
##column 2 = path to the .bam file
##column 3 = mean depth (not used in this script)
##column 4 = mean depth / 2 (not used in this script)
##column 5 = mean depth * 2


######Instructions for Installing mlRho#########
##mlRho – a program for estimating the population mutation and recombination rates from shotgun-sequenced diploid genomes
##Estimates 4 parameters:
#1. mutation rate, θ = 4Neμ,
#2. error rate, ε,
#3. zygosity correlation, ∆, and
#4. recombination rate, ρ = 4Nec.

####Install mlRho####
#cd ~/bin
#wget <http://guanine.evolbio.mpg.de/mlRho/mlRho_2.9.tgz>
#tar -xvzf mlRho_2.9.tgz
#cd MlRho_2.9
#make
#./mlRho -h #list options

####install FormatPro####
#cd ~/bin
#wget <http://guanine.evolbio.mpg.de/mlRho/formatPro_0.5.tgz>
#tar -xvzf formatPro_0.5.tgz
#cd FormatPro_0.5/
#make
#~/bin/FormatPro_0.5/formatPro -h

####install inspectPro####
#cd ~/bin
#wget <http://guanine.evolbio.mpg.de/mlRho/fInspectPro_0.3.tgz>
#tar -xvzf InspectPro_0.3.tgz
#cd InspectPro_0.3/
#make
#~/bin/InspectPro_0.3/inspectPro -h
