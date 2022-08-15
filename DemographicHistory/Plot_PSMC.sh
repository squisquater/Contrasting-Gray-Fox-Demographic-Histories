#!/bin/bash -l
#SBATCH --job-name=PSMC_t15_pwang_r5_plot
#SBATCH --array=1-n
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 10:00
#SBATCH --mem=100M
#SBATCH -p bmm
#SBATCH -A ctbrowngrp
#SBATCH -o PSMC_t15_pwang_r5_plot%A_%a.out
#SBATCH -e PSMC_t15_pwang_r5_plot%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ../../PSMC/PSMC_files_new/IslandFoxList.txt | cut -f1)

/home/hennelly/bin/psmc/utils/psmc_plot.pl -u 4.5e-09 -g 2 -R ../../PSMC/PSMC_files_new/PSMC_t15_pwang_r5/Plots/${SAMPLE}_u4.5e9g2 ../../PSMC/PSMC_files_new/PSMC_t15_pwang_r5/${SAMPLE}_autosomes.psmc

# -u = the mutation rate
# =g = generation time
