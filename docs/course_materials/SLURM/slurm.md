## Description

| Description              | Hands On Lab Exercises for Linux                                                                                    |
|:-------------------------|:--------------------------------------------------------------------------------------------------------------------|
| Related-course materials | [HPC initiation](https://github.com/CIBiG-wave/cibig-wave.github.io/blob/gh-pages/docs/course_materials/SLURM) |
| Authors                  | Ndomassi TANDO (ndomassi.tando@ird.fr)                                                           |
| Creation Date            | 24/09/2024                                                                                                          |
| Last Modified Date       | 25/11/2025                                                                                                          |
| Modified by              | ndomassi TANDO              |

-----------------------

### Summary

<!-- TOC depthFrom:2 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->

* [Practice 1: Connect to a linux server with `ssh`](#practice-1)
* [Practice 2: Reserve one core of a node using qrsh and create your working folder](#practice-2)
* [Practice 3: Transferring files to or from the storage with `rsync` ](#practice-3)
* [Practice 4: Transfer your data from the storage server to the node in `/data` with `rsync` ](#practice-4)
* [Practice 5: Use module environment to  load your tool](#practice-5)
* [Practice 6: Launch analyses ](#practice-6)
* [Practice 7: Transfering data to the san server `scp` ](#practice-7)
* [Practice 8: Deleting your temporary folder ](#practice-8)
* [Practice 9: Launch a job via sbatch](#practice-9)
* [Links](#links)
* [License](#license)


-----------------------


<a name="practice-1"></a>
### Practice 1: Connect to a linux server by `ssh`


1. Open a terminal
 Type  `ssh <your_login>@160.120.108.168` with <your_login>  the login given
  
2. In the console, enter the password when prompted.
Once you are successfully logged in, you will be use this console for the rest of the lecture. 
3. Type the command `sinfo` and comment the result
4. type the command `sinfo -N nodes --long` and noticed what have been added
5. Type the command <code>scontrol show nodes</code>

-----------------------


<a name="practice-2"></a>
### Practice 2: Reserve one core of a node using srun and create your working folder


1. Type the command `squeue` and noticed the result
2. Type the command `squeue -u your_login` with your_login to change with your  account and noticed the difference
3. More details with the command: `squeue -O "username,name:40,partition,nodelist,NumCPUs,state,timeused,timelimit"`
4. Type the command `hostname` then srun `hostname` , note the difference
5. Type the command `srun -p short -c 2 --pty bash -i ` then `squeue` again
6. Type the command `cd /data` then `mkdir <my_folder>`


        

-----------------------


<a name="practice-3"></a>
### Practice 3 : Transferring files to or from the storage with `rsync` 


1. Using rsync, transfer a file from your computer to your personnal folder <code>/home/login</code> on the storage server (160.120.108.168)
2. Verify the result with ls from the master (160.120.108.164)
3. Using rsync, transfer the file <code>/projects/SLURM/TP.txt</code> from the storage server to your PC





-----------------------


<a name="practice-4"></a>
### Practice 4: Transfer your data from the storage server to the node in `/data` with `rsync` 


1. Using rsync, transfer the folder `SHARE` located in `/projects/SLURM` into your working directory 
2. Check your result with ls
 


-----------------------
<a name="practice-5"></a>
### Practice 5: Use module environment to  load your tools


1. Load blast 2.12.0+ module
2. Check if the tool are loaded
 


-----------------------

<a name="practice-6"></a>
###  Practice 6 : Launch analyses

#### Perform a blast on your data

1) Perform a makeblastdb

Launch the command

```
makeblastdb -in uniprot_plant.fasta -dbtype prot -parse_seqids
```
2) Perform the blast analysis
   
```
blastx -query Oglab_var1_cds.only1000.fasta -db uniprot_plant.fasta -num_threads 2 -outfmt "6 qseqid sseqid sacc stitle  pident length mismatch gapopen qstart qend sstart send evalue bitscore" -max_target_seqs 5 -out Oglab_var1_cds.VS.uniprot.blastx.csv2
```



-----------------------
<a name="practice-7"></a>
### Practice 7: Transfering data to the storage server


1. Using rsync, transfer your results from your `/data/your_dir` to your `/home/login` 
2. Check if the transfer is OK with ls
 




-----------------------
<a name="practice-8"></a>
### Practice 8: Deleting your temporary folder

```
cd /data
rm -r your_dir
```

```
exit
```

 -----------------------
<a name="practice-9"></a>
### Practice 9: Launch a job with sbatch


Following the several steps performed during the practice, create a script to launch the analyses made in practice6:

1er step: create the Slurm section in your script 

1) Set  a name for your job
   
2) Choose the short partition
   
3) Reserve 2 cores
   

2nd step: type  the commands you want the script to launch:

1) create a personal folder in /data with `mkdir`

2) Using rsync, transfer your data

3) Load the software to use with module load

4) Launch the commands to perform your analysis

5) Using rsync, transfer your results from your `/data/your_dir` to your `/home/login` 


6) Delete the personal folder in the  `/data`


Launch the following commands to obtain info on the finished job:

```
seff <JOB_ID>
sacct --format=JobID,elapsed,ncpus,ntasks,state,node -j <JOB_ID>
```

-----------------------



### Links
<a name="links"></a>

* Related courses : [Linux for Dummies](https://)
* Tutorials : [Linux Command-Line Cheat Sheet](https://)

-----------------------

### License
<a name="license"></a>

<div>
The resource material is licensed under the Creative Commons Attribution 4.0 International License (<a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">here</a>).
<center><img width="25%" class="img-responsive" src="http://creativecommons.org.nz/wp-content/uploads/2012/05/by-nc-sa1.png"/>
</center>
</div>
