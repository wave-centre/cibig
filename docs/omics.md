---
layout: page
title: "Omics"
---

# OMICS training: From sequencing raw reads to SNP analysis

Created by C. Tranchant (DIADE-IRD), J. Orjuela (DIADE-IRD), F. Sabot (DIADE-IRD) and A. Dereeper (PHIM-IRD)

***

# <span>Table of contents</span>
<a class="anchor" id="home"></a>

[I- Getting datasets for this training](#data)

[II- Quality control: checking the reads quality](#quality) 

***



# <span> I- Getting datasets for this training <a class="anchor" id="data"></a></span>  

To analyze sequencing data, we usually use a lot of bioinformatics softwares generating a lot of data. It's very important to manage and organize your data. 

Firstly, we are going to download data we use in this training.

### <span> Download sequencing data and the reference genome <a class="anchor" id="download"> - `wget` </span>  

Data are available at the following URL : https://itrop.ird.fr/CIBIG2024/variants_trainings/SV_DATA.tar.gz

```
# download available compressed DATA 
wget --no-check-certificat -rm -nH --cut-dirs=1 --reject="index.html*" https://itrop.ird.fr/CIBIG2024/variants_trainings/SV_DATA_17.tar.gz 
# decompress data
tar xzvf variants_trainings/SV_DATA_17.tar.gz
rm variants_trainings/SV_DATA_17.tar.gz
```
### <span> Check the content of the directory SV_DATA</span>  - `ls`

#### <span> List the content of your home directory and check that the directory SV_DATA have been created</span>  - `ls` 

#### <span> List the content of the directory SV_DATA</span>  - `ls`

#### <span> List the content of the directory REF</span>  - `ls`

What are the formats of the files present in this directory ? What do you think these file contains?
<br>
How many chromosomes does the reference file contain? `grep`


#### <span> Go into the directory SV_DATA/SHORT_READS and list the content of this directory - `cd` `ls`</span>  

How many files does it contain ? What is the format ?

# <span> II- Quality Control of RNA-seq / DNA-seq Data with **FastQC** and **MultiQC** <a class="anchor" id="quality"></a></span>  

## Introduction

Quality control (QC) is an essential step in the analysis of NGS data.\
Two tools are commonly used:

-   **FastQC** --- individual analysis of FASTQ files
-   **MultiQC** --- aggregation and visualization of multiple QC reports
    (FastQC, alignment, quantification, etc.)

This tutorial covers:

✔ Fastq files checking\
✔ Essential commands\
✔ How to interpret QC metrics\
✔ Concrete examples\
✔ Simulated "screenshots" of FastQC and MultiQC

------------------------------------------------------------------------

## 1. Fastq files checking

#### <span> Go into the directory SV_DATA/SHORT_READS and list the content of this directory - `cd` `ls`</span>  

How many files does it contain ? What is the format ?


#### <span> List the 10 first lines of one file</span>  - `head` `zcat` `wc`

How many sequences are there in the first fastq file?

#### <span> Go into your working directory and create the directory 1-FASTQC</span>  `mkdir`

------------------------------------------------------------------------

## 2. Running FastQC

### Quick version check

``` bash
fastqc --version
multiqc --version
```

### Display options for fastqc

``` bash
fastqc --help
```


### Here are examples of command for running fastqc

On a single FASTQ file

``` bash
fastqc sample_01.fastq.gz
```
 
On multiple files at once

``` bash
fastqc *.fastq.gz -o fastqc_results/
```

### Run fastqc on all raw fastq files

------------------------------------------------------------------------

## 3. Example of FastQC Output

FastQC generates two files:

-   `sample_01_fastqc.html` → graphical report\
-   `sample_01_fastqc.zip` → raw QC metrics

Below are **simulated screenshots** of the main report sections.

------------------------------------------------------------------------

## Example: FastQC Summary (simulated)

    >> Basic Statistics            PASS
    >> Per base sequence quality   PASS
    >> Per sequence GC content     WARN
    >> Adapter Content             FAIL
    >> Overrepresented sequences   FAIL

------------------------------------------------------------------------

## Example: Per-base quality plot (simplified ASCII)

    Quality (Phred)
    40 | ████████████████████████████████
    35 | ████████████████████████████████
    30 | ██████████████████████████████
    25 | ███████████████████████████
        -------------------------------------------------------
          A     C     G     T     N  (read positions)

------------------------------------------------------------------------

## Example: Adapter contamination (simulated)

    Adapter Content (%)
    100 |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
     80 |
     60 |
     40 |■■■■■■■■■■■■
     20 |
      0 |-------------------------------------------------------
          0      20      40      60      80     100 (position)

------------------------------------------------------------------------

## 4. Inspecting and Extracting FastQC Data

To extract the ZIP file:

``` bash
unzip sample_01_fastqc.zip -d fastqc_extracted/
```

Useful data is in:

    fastqc_extracted/fastqc_data.txt

------------------------------------------------------------------------

## 5. MultiQC: Aggregating All Reports

### Basic command in a folder containing multiple FastQC reports

``` bash
multiqc fastqc_results/ -o multiqc_report/
```


### <span> Run `MultiQC`</span>  

* go into the directory 1-FASTQC
* run MultiQC into this directory

------------------------------------------------------------------------

## Example: MultiQC Summary (simulated)

    ==================== MultiQC Report ====================

    FastQC
    --------------------------------------------------------
    Samples processed : 12
    PASS : 8
    WARN : 2
    FAIL : 2

    Worst modules:
     - Adapter Content (2 FAIL)
     - Per base sequence quality (1 WARN)
     - GC Content (1 WARN)

------------------------------------------------------------------------

## Example: MultiQC Table (simulated)

    Sample       | Reads (M) | %GC | Q30 (%) | Adapter Fail
    --------------------------------------------------------
    sample_01    |   25.1    | 48  |   92     |    YES
    sample_02    |   26.3    | 49  |   94     |    NO
    sample_03    |   21.9    | 47  |   93     |    NO

------------------------------------------------------------------------

## 6. Interpretation of Key FastQC Modules

    -----------------------------------------------------------------------------
    Module              What to check               Common issues
    ------------------- --------------------------- -----------------------------
    **Per base          Boxplots across read        Decrease at read ends,
    quality**           positions                   degraded sequencing

    **GC content**      Curve vs theoretical        Contamination, GC biases
                        distribution                

    **Adapter content** Adapter levels across       Need for adapter trimming
                        positions                   

    **Overrepresented   Repeated sequences          rRNA, adapters, PCR
    sequences**                                     contamination
    -----------------------------------------------------------------------------

------------------------------------------------------------------------

## 7. Follow-up: Adapter Trimming (optional)

Example using **Trimmomatic**:

``` bash
trimmomatic PE -threads 8   sample_01_R1.fastq.gz sample_01_R2.fastq.gz   sample_01_R1_trimmed.fastq.gz sample_01_R1_unpaired.fastq.gz   sample_01_R2_trimmed.fastq.gz sample_01_R2_unpaired.fastq.gz   ILLUMINACLIP:TruSeq3-PE.fa:2:30:10   LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
```

Then rerun QC:

``` bash
fastqc trimmed/*.fastq.gz
multiqc .
```

------------------------------------------------------------------------

## 8. Take-home messages

With FastQC and MultiQC you can:

-   quickly assess raw FASTQ quality\
-   detect adapter contamination\
-   identify GC biases\
-   visualize QC for all samples simultaneously

