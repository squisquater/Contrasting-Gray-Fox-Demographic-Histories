#!/usr/bin/env bash
#SBATCH --job-name=PSMC_Wang2020
#SBATCH --array=1-n
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 36:00:00
#SBATCH --mem=7GB
#SBATCH -o PSMC_Wang2020_%A_%a.out
#SBATCH -e PSMC_Wang2020_%A_%a.err
#SBATCH -p high

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
STARTTIME=$(date +"%s")

SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ../../PSMC/PSMC_files_new/IslandFoxList.txt | cut -f1)

echo "running PSMC analysis on $SAMPLE using the atomic intervals from Wang et al 2020"

/home/hennelly/bin/psmc/psmc -t15 -r5 -p "4+25*2+4+6" -o  ../../PSMC/PSMC_files_new/PSMC_t15_pwang_r5/${SAMPLE}_autosomes.psmc ../../PSMC/PSMC_files_new/${SAMPLE}_autosomes.psmc.fa

ENDTIME=$(date +%s)
TIMESPEND=$(($ENDTIME - $STARTTIME))
((sec=TIMESPEND%60,TIMESPEND/=60, min=TIMESPEND%60, hrs=TIMESPEND/60))
timestamp=$(printf "%d:%02d:%02d" $hrs $min $sec)
echo "Took $timestamp hours:minutes:seconds to complete..."
