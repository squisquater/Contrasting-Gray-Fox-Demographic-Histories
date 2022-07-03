# Contrasting-Gray-Fox-Demographic-Histories
Contrasting Demographic Histories of Eastern and Western Gray Fox Lineages using Whole Genome and Reduced Representation (GBS) Sequencing

Population genomics reveals distinct demographic histories among extant gray fox lineages in North America
## **Sample Info**
* [WGS-SampleList.md](https://github.com/squisquater/Contrasting-Gray-Fox-Demographic-Histories/blob/main/WGS-SampleList.md)
* [GBS-SampleList.md](https://github.com/squisquater/Contrasting-Gray-Fox-Demographic-Histories/blob/main/GBS-SampleList.md)

## **Data Processing**
* Trim reads [Trim.sh]
* Align to reference [Align.sh]
* Merge (if split) and clean reads [Merge_Clean.sh]
* Subset X-Chromosome and Autosomes [Subset_Autosomes.sh] & [Subset_XChr.sh] (Note that you will need to re-index afterwards. See [Index_Autosomes.sh] & [Index_XChr.sh])
* Calculate read depth across samples [ReadDepth.sh]

## Range Wide Population Structure

### SNP Calling
* Genotype Likelihoods (angsd)

## Demographic History

### Infer demographic trajectories using WGS data (PSMC)
* Subset the autosomes [Subset_Autosomes.sh] (Note that you will need to re-index afterwards. See [Index_Autosomes.sh]
* Calculate mean autosomal depth across all samples [WGSReadDepth.sh]
* Convert bam files to fastq files [bam2fq_autosomes.sh]
* Convert fastq file to psmcfa file [fq2psmcfa.sh]
* Run PSMC using the following parameters as described in Wang et al. 2020 (-t15 -r5 -p "4+25*2+4+6") [psmc.sh]
* For low coverage samples apply appropriate FNR correction (See below)

#### False negative rate (FNR) corrections for low coverage genomes
* Downsample a high coverage genome at corresponding depths (4-8x)
* Determine appropriate FNR correction at each downsampled coverage level to recover the "correct" PSMC trajectory
* Fit a model to these values and apply this model to existing low coverage data. 


### Test impacts of WGS coverage on demographic inference
* Downsample genomes from both the mainland (n=2) and island (n=6) fox populations to test the effects of coverage on estimates of heterozygosity (mlRho) and demographic trajectories (PSMC)[Downsample.sh]
* Follow basic flow outlined in the mlRho section below to determine effects of coverage on heterozygosity.
* Follow basic flow outlined in the PSMC section below to obtain an uncorrected PSMC trajectory for each downsampled genome.
* Apply False Negative Rate (FNR) corrections until downsampled genomes match high coverage genomes. 

### Estimate individual level heterozygosity using WGS data (mlRho)
* [mlRho.sh]

### Infer demographic trajectories using WGS data (PSMC)
* Convert bam files to fastq files [bam2fq_autosomes.sh]
* Convert fastq file to psmcfa file [fq2psmcfa.sh]
* Run PSMC [psmc.sh]

### Estimate end of gene flow between populations (hPSMC)

### Site Frequency Spectrum (SFS) using GBS data


