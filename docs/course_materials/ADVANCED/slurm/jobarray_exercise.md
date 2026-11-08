## Description

| Description              | Exercise with Job array                                                                                    |
|:-------------------------|:--------------------------------------------------------------------------------------------------------------------|
| Authors                  | Ndomassi TANDO (ndomassi.tando@ird.fr)                                                           |
| Creation Date            |08/11/2026                                                                                                          |
| Last Modified Date       | 08/11/2026                                                                                                          |
| Modified by              | ndomassi TANDO              |

-----------------------

### Summary

<!-- TOC depthFrom:2 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->

* [Preambule: Install your `ssh keys` ](#preambule)
* [First script: Create a  script to split the sequence file and index the database called `cutting.sh`](#first-script)
* [Second script: Launch a blastx analysis on the first six small fasta files](#second-script)
* [License](#license)


-----------------------
<a name="preambule"></a>
### Preambule: Objectives

- Retrieve a 1000 sequences fasta file
- Split it to obtain 1000 small sequences files
- Launch a job array to perform a blastx on the 6 first sequences of the folder


----------------------------------------------

<a name="first-script"></a>
### First script: Create a  script to split the sequence file and index the database called `cutting.sh` 

This script will be launch with `sbatch` and has the following first line:

```
#!/bin/bash
#SBATCH --account=wave
#SBATCH --partition=wave
```

In this script, you have to : 

1) Create a personal folder `/scratch/blastx_$USER`
2) Retrieve the folder `/projects/ADVANCED/slurm/data/blast` on storage using rsync in `/scratch/blastx_$USER`

3) Load blast/2.12.0 and emboss/6.6.0
4) In the `blast folder`  , launch the following command to perform a makeblastdb:

   `makeblastdb -in uniprot_plant.fasta -dbtype prot -parse_seqids`

5) In the `blast folder create the following folders: split logs results
6) Split the file  Oglab_var1_cds.only1000.fasta  in 1000 small fasta file in the `split` folder with the following command:

   `seqretsplit -sequence  Oglab_var1_cds.only1000.fasta -osformat fasta -osdirectory2 split -auto`

7) copy the `blast` folder to your `/home/$USER` on storage using rsync


   At the end of this step, you have retrieve an indexed databases in the `/home/$USER/blast` folder and 1000 small fasta files in the `/home/$USER/blast/split` folder
  


-----------------------


<a name="second-script"></a>
### Second script: Launch a blastx analysis on the first six small fasta files

Thanks to the blast folder retrieved earlier, you are about to launch a blastx analysis on the first six fasta files contained in the `/home/$USER/blast/split`

Create a script called `blastx_array.sbatch`

1. Add the sbatch options to launch a jobarray on the 6 first files 
2. Add the following line to load the softwares to use, create your `scratch` folder , transfer your files and create your variables:
```
module load bioinfo-shared
module load blast/2.12.0

scratch=/scratch/blastx_$USER
mkdir -p ${scratch}/results
rsync -ravz storage:/home/$USER/blast $scratch/
reference_file=/scratch/blastx_$USER/blast/uniprot_plant.fasta
``` 

3. Using the course, create the necessary variables `files` and `file_id` to index the fasta file in the  `/scratch/blastx_$USER/blast/split`folder
5. For  each indexed files, launch a blastx analysis  with the command:
```
blastx -query ${scratch}/blast/split/<index>.fasta -db $reference_file -num_threads 2 -outfmt "6 qseqid sseqid sacc stitle  pident length mismatch gapopen qstart qend sstart send evalue bitscore" -max_target_seqs 5 -out ${scratch}/results/<index>.blastx.csv2
```
Be careful : you have to replace `<index>` in the above command  to make the command work



6. Retrieve your results in your `/home/$USER`folder



        

-----------------------

### License
<a name="license"></a>

<div>
The resource material is licensed under the Creative Commons Attribution 4.0 International License (<a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">here</a>).
<center><img width="25%" class="img-responsive" src="http://creativecommons.org.nz/wp-content/uploads/2012/05/by-nc-sa1.png"/>
</center>
</div>
