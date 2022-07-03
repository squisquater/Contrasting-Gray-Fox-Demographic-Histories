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
* Calculate mean read depth across samples [WGS-ReadDepth.sh]

## SNP Calling for GBS Data
* See [Kierepka et al. (in review)](https://github.com/squisquater/Cryptic-Gray-Fox-Lineages-Secondary-Contact)

## Demographic History

### Infer demographic trajectories using WGS data (*PSMC*)
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

### Infer more recent demographic trajectories using the Site Frequency Spectrum derived from GBS Data (*Stairwayplot*)
* Generate and ancestral fasta file
* Calculate mean read depth for all gray fox GBS samples (n = 194) ([GBS-ReadDepth.sh]
* Make a bamlist for each population
* Generate a site allele frequency files for each population
* Generate 1-D site frequency spectrum for each population
* Incorporate the 1-D SFS into your input file to run Stairwayplot

## Contemporary patterns of expansion and contraction (*Δθ*)
* Generate and ancestral fasta file
* Calculate mean read depth for all gray fox GBS samples (n = 194) ([GBS-ReadDepth.sh]
* Make a bamlist for each population
* Generate a site allele frequency files for each population
* Generate 1-D site frequency spectrum for each population
* Generate allele frequency posterior probabilities and associated statistics (-dothetas) using the 1-D SFS as a prior
* Extract thetas (-thetaStat)

## Contemporary patterns of diversity (*Heterozygosity*)
* Generate and ancestral fasta file
* Calculate mean read depth for all gray fox GBS samples (n = 194) ([GBS-ReadDepth.sh]
* Make a bamlist file for every sample (not a single bamlist with all bamfiles listed)
* Make an InfoFile.txt with several columns (SampleID, bamlist.txt, meandepth, meandepth x 0.5, meandepth x 2.5)
* Generate site allele frequency files for all individuals
* Generate 1-D site frequency spectrum for all individuals
* Extract SFS results to a summary file 

## Population Structure??? Include this?

