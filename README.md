# Contrasting-Gray-Fox-Demographic-Histories
Contrasting Demographic Histories of Eastern and Western Gray Fox Lineages using Whole Genome and Reduced Representation (GBS) Sequencing

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


