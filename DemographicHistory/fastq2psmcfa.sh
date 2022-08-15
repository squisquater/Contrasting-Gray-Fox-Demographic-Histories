#!/bin/bash -l
#SBATCH --job-name=fq2psmcfa
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 12:00:00
#SBATCH --mem=10GB
#SBATCH -p high
#SBATCH -o fq2psmcfa.out
#SBATCH -e fq2psmcfa.err

/home/hennelly/bin/psmc/utils/fq2psmcfa ../../PSMC/final_fqfiles/SanClemente_2009_subset.fq.gz > ../../PSMC_files_new/SanClemente_2009_autosomes.psmc.fa
/home/hennelly/bin/psmc/utils/fq2psmcfa ../../PSMC/final_fqfiles/SanMiguel_2008_subset.fq.gz > ../../PSMC_files_new/SanMiguel_2008_autosomes.psmc.fa
/home/hennelly/bin/psmc/utils/fq2psmcfa ../../PSMC/final_fqfiles/SanNicolas_1929_SE_subset.fq.gz > ~../../PSMC_files_new/SanNicolas_1929_SE_autosomes.psmc.fa
...
...
...

## Note these don't take very long so I ran them in sequence instead of making an array
