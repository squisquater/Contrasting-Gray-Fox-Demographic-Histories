# Contrasting-Gray-Fox-Demographic-Histories
Contrasting Demographic Histories of Eastern and Western Gray Fox Lineages using Reduced Representation (GBS) and Whole Genome Sequencing

## **Sample Info**
* [SampleList.md]

## **Data Processing**
* Trim reads [Trim.sh]
* Align to reference [Align.sh]
* Merge (if split) and clean reads [Merge_Clean.sh]
* Subset X-Chromosome and Autosomes [Subset_Autosomes.sh] & [Subset_XChr.sh] (Note that you will need to re-index afterwards. See [Index_Autosomes.sh] & [Index_XChr.sh])
* Calculate read depth across samples [ReadDepth.sh]

## Downsample high coverage genomes
* To test the effects of coverage on estimates of heterozygosity (mlRho) and demographic trajectories (PSMC), downsample high coverage genomes from both the mainland (n=2) and island (n=6) fox populations. [Downsample.sh]

## Estimate individual level heterozygosity using WGS data (mlRho)
*

## SNP Calling
* Genotype Likelihoods (angsd)

## Demographic History

### Heterozygosity

### PSMC

### SFS
