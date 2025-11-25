---
layout: page
title: "Omics"
---

# __How to check raw fastq quality and to map reads against a reference genome ?__ 

Created by C. Tranchant (DIADE-IRD), J. Orjuela (DIADE-IRD), F. Sabot (DIADE-IRD) and A. Dereeper (PHIM-IRD)

***

# <span style="color: #006E7F">Table of contents</span>
<a class="anchor" id="home"></a>

## **Getting datasets for this training**

To analyze sequencing data, we usually use a lot of bioinformatics softwares generating a lot of data. It's very important to manage and organize your data. 

Firstly, we are going to download data we use in this training.

### <span style="color: #4CACBC;"> Download sequencing data and the reference genome <a class="anchor" id="download"> - `wget` </span>  

Data are available at the following URL : https://itrop.ird.fr/CIBIG2024/variants_trainings/SV_DATA.tar.gz

```
# download available compressed DATA 
wget --no-check-certificat -rm -nH --cut-dirs=1 --reject="index.html*" https://itrop.ird.fr/CIBIG2024/variants_trainings/SV_DATA_17.tar.gz 
# decompress data
tar xzvf variants_trainings/SV_DATA_17.tar.gz
rm variants_trainings/SV_DATA_17.tar.gz
```

### <span style="color: #4CACBC;"> List the content of your home directory and check that the directory SV_DATA have been created</span>  - `ls` 

### <span style="color: #4CACBC;"> List the content of the directory SV_DATA</span>  - `ls`

### <span style="color: #4CACBC;"> List the content of the directory REF</span>  - `ls`

What are the formats of the files present in this directory ? What do you think these file contains?
<br>
How many chromosomes does the reference file contain? `grep`



### <span style="color: #4CACBC;"> Go into the directory SV_DATA/SHORT_READS and list the content of this directory - `cd` `ls`</span>  
How many files does it contain ? What is the format ?

## 📌 Introduction

Le contrôle qualité (QC) est une étape essentielle dans l'analyse de
données NGS.\
Deux outils sont couramment utilisés :

-   **FastQC** : analyse individuelle des fichiers FASTQ\
-   **MultiQC** : agrégation et visualisation globale de multiples
    rapports (FastQC, alignement, quantification...)

Ce tutoriel explique :

✔ Installation\
✔ Commandes essentielles\
✔ Interprétation des résultats\
✔ Exemples concrets\
✔ « Captures d'écran » textuelles typiques de FastQC et MultiQC

------------------------------------------------------------------------

# 1. 🔧 Installation

### Avec conda (recommandé)

``` bash
conda install -c bioconda fastqc multiqc
```

### Versions rapides

``` bash
fastqc --version
multiqc --version
```
