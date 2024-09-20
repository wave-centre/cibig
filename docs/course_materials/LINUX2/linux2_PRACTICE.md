---
layout: page
title:  "Advanced Linux Practice"
permalink: /LINUX2/linux2_PRACTICE/
---

| Description | Hands On Lab Exercises for Linux |
| :------------- | :------------- | :------------- | :------------- |
| Related-course materials | [Linux for Jedi](https://github.com/CIBiG-wave/cibig-wave.github.io/blob/gh-pages/docs/course_materials/LINUX1/)) |
| Authors | Christine Tranchant-Dubreuil (christine.tranchant@ird.fr) & Gautier Sarah (gautier.sarah |
| Creation Date | 11/03/2018 |
| Last Modified Date | 19/09/2024 |
| Modified by | Christine Tranchant-Dubreuil |

-----------------------

### Summary

<!-- TOC depthFrom:2 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->
* [Practice 1: Using the `&&` separator](#practice-1)
* [Practice 2: Downloading files from SRA](#practice-2)
* [Practice 3: Searching for text using `regex101.com`](#practice-3)
* [Practice 4: Displaying lines with `sed`](#practice-4)
* [Practice 5: Modifying files with `sed`](#practice-5)
* [Practice 11: Manipulating files with `awk`](#practice-11)
* [Practice 12: For loop with bash](#practice-12)
* [Links](#links)
* [License](#license)

-----------------------

<a name="practice-1"></a>
### Practice 1 : Using the && separator

* Connect to node17 using `srun` command (slurm command)
  
   `srun -p formation -c 2 --pty bash -i`
  
* Move into the directory /scratch/Put_Your_Login_Here

* On the console, type the 2 following linux commands to get data necessary for the next :

```
# get the file on the web and decompress the gzip file 
wget http://itrop.ird.fr/LINUX-TP/LINUX4JEDI-TP.tar.gz && tar -xzvf LINUX4JEDI-TP.tar.gz && rm LINUX4JEDI-TP.tar.gz
```

* Check the content of your home directory on the server now 
* Execute the `tree` command 

<details>
```
bash-4.2# tree -L 2  
.
|-- 1-fastq
|   |-- SRR8517015_1.10000.fastq
|   |-- SRR8517015_2.10000.fastq
|   |-- SRX5320622_1.10000.fastq
|   |-- SRX5320622_2.10000.fastq
|   |-- SRX5320631_1.10000.fastq
|   `-- SRX5320631_2.10000.fastq
|-- 2-bam
|   |-- B1.starMSU7.chr1.sorted.bam
|   |-- B1.starMSU7.chr1.sorted.bam.bai
|   |-- B2.starMSU7.chr1.sorted.bam
|   |-- B2.starMSU7.chr1.sorted.bam.bai
|   |-- G1.starMSU7.chr1.sorted.bam
|   |-- G1.starMSU7.chr1.sorted.bam.bai
|   |-- G2.starMSU7.chr1.sorted.bam
|   `-- G2.starMSU7.chr1.sorted.bam.bai
|-- 3-RNAseqCount
|   |-- erz340_suppl_supplementary_table_s5.csv
|   `-- erz340_suppl_supplementary_table_s5_new.csv
|-- 4-vcf
|   `-- OgOb-all-MSU7-CHR6.GATKVARIANTFILTRATION.shuf.100000.vcf.gz
|-- 9-denovoAssembly
|   |-- DAOSW_abyss-contigs.fa -> Ob/DAOSW_abyss-contigs.fa
|   |-- Ob
|   |-- Og
|   `-- TOG5681_abyss-contigs.fa -> Og/TOG5681_abyss-contigs.fa
|-- Bank
|   |-- all.con
|   `-- all.seq
|-- Other
|   |-- abcd.txt
|   |-- contact.txt
|   |-- example.txt
|   `-- test.list
|-- Script
|   |-- helloworld-var.sh
|   |-- helloworld.sh
|   |-- q
|   |-- script.sh
|   `-- testNum.sh
|-- erz340.pdf
`-- erz340_suppl_supplementary_table_s1.csv
```

 </details>
 
-----------------------
<a name="practice-2"></a>
### Practice 2 :  Downloading files from SRA 

* Go into the directory `LINUX4JEDI-TP/1-fastq` 
* Display the size of all fastq files - `ls -lh, du -h`

We want to download two fastq files from NCBI SRA (available here https://www.ncbi.nlm.nih.gov/sra?linkname=bioproject_sra_all&from_uid=518559) using SRAtoolkit as below :

```
module load sratoolkit/3.0.1

prefetch SRRXXX
fasterq-dump --split-files SRRXXX
```

https://www.ncbi.nlm.nih.gov/sra/docs/sradownload/

-----------------------



<a name="practice-3"></a>
### Practice 3 : Searching for text using `https://regex101.com/`

* Go to the web site https://regex101.com/
* Copy the following text and paste it in the field `test string`

```
Nom              | Email                        | Téléphone           | Code Postal | Site web
Kouassi Yao      | yao.kouassi@exemple.ci        | +225 07 12 34 56    | 00225       | https://yaokouassi.ci
Ahoua Konan      | ahoua.konan@fournisseur.ci    | +225 01 22 33 44    | 00225       | http://ahouakonan.com
Ouedraogo Salif  | salif.ouedraogo@exemple.bf    | +226 70 45 67 89    | 00226       | https://salifouedraogo.bf
Kaboré Ibrahim   | ibrahim.kabore@fournisseur.bf | +226 60 34 56 78    | 00226       | http://ibrahimkabore.com
Martin Durand    | martin.durand@exemple.fr      | +33 6 12 34 56 78   | 75000       | https://martindurand.fr
Dupont Claire    | claire.dupont@fournisseur.fr  | +33 7 89 45 23 67   | 69000       | http://clairedupont.fr
```

* print only the line that meet the following criteria – treat each criterion separately
> * contain the code postal 00225
> * contain the letter d or h (uppercase/lowercase)
> * contain the letters k and o in that order
> * contain the letters k and o in that order with two single letters between them
> * start with m or M or a or A
> * start with m or M or a or A ans end with fr
> * contain three digits following a + sign in a row

* What do this criteria ? ```^[A-Z][a-z]+ [A-Z][a-z]+```
 

------------------------

<a name="practice-4"></a>
### Practice 4 :  Displaying lines with `sed`
For this exercise, you will work on the fastq file LINUX4JEDI-TP/1-fastq/SRR8517015_1.10000.fastq

* Print the 8 first lines
* Print the lines 5 to 12
* Print only the sequences ids
* Print only the sequences ids and nucleotides sequences

-----------------------

<a name="practice-5"></a>
### Practice 5 : File modification with `sed`

#### From fasta files in `LINUX-TP/Fasta`
* In the `LINUX4JEDI-TP/9-denovoAssembly` directory, there are two files : `DAOSW_abyss-contigs.fa`and `TOG5681_abyss-contigs.fa`. Before merging both libraries into a unique file, we would like to tag each sequence per its origin. In each file, add the respective tag DAOSW_ / TOG5681_ just before the identifier.

```
# File DAOSW_abyss-contigs.fa initially
>0 71 531
CTTTTTGAACTTTTTCATTCCGGTCAAAAAAATATCGCACCCGTGGGGGCTCAATATATGCCAATATTGGC
>2 217 449


# File DAOSW_abyss-contigs.rename.fasta
>DAOSW_0 71 531
CTTTTTGAACTTTTTCATTCCGGTCAAAAAAATATCGCACCCGTGGGGGCTCAATATATGCCAATATTGGC
>DAOSW_2 217 449
```

Rq : First test the sed command on one file, then store the results in new files named DAOSW_abyss-contigs.renamed.fasta and TOG5681_abyss-contigs.renamed.fasta

> BONUS : try to modify each line starting with > such as :  `>0 71 531` to `>DAOSW_0`

#### vcf file `LINUX4JEDI-TP/4-vcf/OgOb-all-MSU7-CHR6.GATKVARIANTFILTRATION.shuf.100000.vcf.gz`
* Now, in the VCF file, we would like to replace the genotypes by allelic dose. This means that we should replace the whole field by `0` when the genotype is `0/0`, by `1` when the genotype is `0/1` and `2` when the genotype is `1/1`

#### With fastq files in LINUX4JEDI-TP/1-fastq/
* Transform the file SRR8517015_1.10000.fastq into a fasta format
* In one command line, transform all fastq files of the directory in fasta (save the files before) - `sed -i`

-----------------------

<a name="practice-6"></a>
### Practice 6 : Manipulating files with `awk`

### From a fasta file

#### seqtk
Seqtk (https://github.com/lh3/seqtk) is a fast and lightweight tool for processing sequences in the FASTA or FASTQ format. It seamlessly parses both FASTA and FASTQ files which can also be optionally compressed by gzip.

We are going to use seqtk comp to get statistics  get the nucleotide composition of FASTA/Qprint the size of the genome 

* Run seqtk comp on the file `Bank/all.con - `seqtk comp all.con`  
* Using awk, first print the whole line of the output generated by seqtk, then print only the columns 1 and 2 - `| awk `
* Print the column 1 and 2 only for chr1 to chr12
* Calculate the genome size in pb

#### From the gff file precedently downloaded
* Extract the coordinate from the gff file
* Calculate the mean of the gene length
* Calculate the mean of the gene length for the chromosome 1
* Count the number of genes above 2000bp length
* Bonus: calculate the mean of gene length for each chromosome in one command line


-----------------------

<a name="practice-12"></a>
### Practice 12 : For loop with bash

* Go into the directory `LINUX4JEDI-TP/1-fastq/`
* List the directory content
* Run fastq-stats program ( [more](http://manpages.ubuntu.com/manpages/xenial/man1/fastq-stats.1.html) to get stats about the fastq file `SRR8517015_1.10000.fastq`
* 
```
fastq-stats -D SRR8517015_1.10000.fastq
```

* Use a `for` loop to run fastq-stats with each fastq file in the directory
* 
```
for file in *fastq; do 
  fastq-stats -D $file > $file.fastq-stats ; 
done;
```

-----------------------
<a name="practice-13"></a>
### Practice 13 : The last but not the least practice

#### A bash script to download fastq files from a file that contains a list of accessions

Write a bash script that :
* takes as argument a file that contains a list of accessions (/scratch/accession.list)
* reads this file and downloads fastq files (reverse and forward) for each accession - fastq-dump

```
# Use the following code to read the file (variable $filename) line by line
while read line;
do
echo $line;
done < $filename
```

-----------------------
#### A bash script to get basic statistics on each fastq file (in the directory 1-fastq) using fastq-stats

##### Before writing the script, we will test the fastq-stats command on a bash terminal

* Run fastq-stats on a fastq file
* Run fastq-stats on a fastq file and get the column 2 of the output of the command 
* Run fastq-stats on a fastq file, get the column 2 of the output of the command and turn the column into a single row - `linux command: paste -s`
* Save the output of the command in the file 
 
```
# fastq-dump output
reads	10000
len	125
len mean	125.0000
len stdev	0.0000
len min	125
phred	33
window-size	10000
cycle-max	35
qual min	2
qual max	38
qual mean	36.1021
qual stdev	4.2358
%A	25.5594
%C	24.3560
%G	26.1111
%T	23.8691
%N	0.1043
total bases	1250000

# We want this format
10000	125	125.0000	0.0000	125	33	10000	35	2	38	36.1021	4.2358	25.5594	24.3560	26.111123.8691	0.1043	1250000
```

##### Write a bash script 

Write a bash script that :
* takes as argument a directory (absolute path) that contains fastq files 
* executes the command fastq-stats as seen just before , the output is saved into a file

##### Bonus

On a terminal, use awk to parse all files created by the previous bash script and to generate the following output:

```
SRR8517015_1.10000.fastq.stats          10000        125        125.0000        0.0000        125        33        10000        35        2        38        36.1021        4.2358        25.5594        24.3560        26.1111        23.8691        0.1043        1250000
SRR8517015_2.10000.fastq.stats          10000        125        125.0000        0.0000        125        33        10000        35        2        38        34.4527        7.0727        23.5631        25.5657        25.6063        25.2649        0.0000        1250000
SRX5320622_1.10000.fastq.stats          10000        125        125.0000        0.0000        125        33        10000        35        2        38        36.4891        3.6410        26.3371        24.0457        24.8703        24.6883        0.0586        1250000
```

----------------------- 
#### Analysis of the read count file `3-RNAseqCount/erz340_suppl_supplementary_table_s5.csv`

Goal : Get the chromosome and its positions (start-stop) for some genes differentially expressed using the read count file and the gff file downladed

##### Get the first ten rows with the lowest p-value 
* display the first lines of this file
* substitute the ";" by the "\t"
* As the file is already sorted, extract the first ten lines and save the result in a new file called `my_10_genes.tab`

<details>
```
[tranchant@node6 3-RNAseqCount]$ head erz340_suppl_supplementary_table_s5.csv 
gene_id;log2FoldChange;lfcSE;pvalue;padj;symbols;MsuAnnotation
LOC_Os06g06750;4,02391987172844;0,291852309336462;4,76E-32;1,20E-27;MADS5;OsMADS5 - MADS-box family gene with MIKCc type-box, expressed
LOC_Os03g11614;6,14058803847572;0,534044090654195;2,40E-25;3,03E-21;LHS1;OsMADS1 - MADS-box family gene with MIKCc type-box, expressed
LOC_Os04g43580;-2,32647724746766;0,178467573376802;1,70E-22;1,43E-18;G1L4;DUF640 domain containing protein, putative, expressed
LOC_Os02g45770;4,57158531291166;0,416805180501083;1,13E-21;7,08E-18;MFO1;OsMADS6 - MADS-box family gene with MIKCc type-box, expressed
LOC_Os03g14140;5,01958570820803;0,502245405032766;1,05E-18;5,29E-15;;POEI16 - Pollen Ole e I allergen and extensin family protein precursor, expressed
```
</details>

* sort the file on the locus name and save the result into a new file `my_10_genes.sorted.tab`

##### Get the columns chr, start, stot, info from the gff file

* print the columns chr, start, stot, info of the gff file
* print the columns chr, start, stot, info of the gff file but only for lines with the word `gene` in the gff file
* print only the locus identifier of each line of the gff file (eg : ID=LOC_Os01g01010)
* print only the locus identifier of each line of the gff file (eg : LOC_Os01g01010)
* generate the following file : 

```
[tranchant@node6 3-RNAseqCount]$ head all.gene.loc.csv 
Chr1 gene 2903 10817 LOC_Os01g01010
Chr1 gene 11218 12435 LOC_Os01g01019
Chr1 gene 12648 15915 LOC_Os01g01030
Chr1 gene 16292 20323 LOC_Os01g01040
```

* sort the file all.gene.loc.csv on the locus name and save the output in a new file

##### Join the lines of the two files previously created on the common field (locus identifier) - linux command join


-----------------------

### License
<a name="license"></a>

<div>
The resource material is licensed under the Creative Commons Attribution 4.0 International License (<a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">here</a>).
<center><img width="25%" class="img-responsive" src="http://creativecommons.org.nz/wp-content/uploads/2012/05/by-nc-sa1.png"/>
</center>
