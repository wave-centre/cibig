## Description

| Description              | Hands On Lab Exercises for Linux                                                                                    |
|:-------------------------|:--------------------------------------------------------------------------------------------------------------------|
| Related-course materials | [HPC initiation](https://github.com/CIBiG-wave/cibig-wave.github.io/blob/gh-pages/docs/course_materials/SLURM) |
| Authors                  | Ndomassi TANDO (ndomassi.tando@ird.fr)                                                           |
| Creation Date            | 24/09/2024                                                                                                          |
| Last Modified Date       | 05/11/2026                                                                                                          |
| Modified by              | ndomassi TANDO              |

-----------------------

### Summary

<!-- TOC depthFrom:2 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->

* [Preambule: Install your `ssh keys` ](#preambule)
* [Practice 1: Connect to a linux server with `ssh`](#practice-1)
* [Practice 2: Reserve one core of a node using srun and create your working folder](#practice-2)
* [Practice 3: Transferring files to or from the storage with `rsync` ](#practice-3)
* [Practice 4: Transfer your data from the storage server to the node in `/data` with `rsync` ](#practice-4)
* [Practice 5: Use module environment to  load your tool](#practice-5)
* [Practice 6: Launch analyses ](#practice-6)
* [Practice 7: Transfering data to the san server `rsync` ](#practice-7)
* [Practice 8: Deleting your temporary folder ](#practice-8)
* [Practice 9: Launch a job via sbatch](#practice-9)
* [Links](#links)
* [License](#license)


-----------------------
<a name="preambule"></a>
### Preambule: Install you ssh keys

Ssh keys allow you to connect to a remote server without password using a couple of private and public keys.

Your public key will be stored by the remote server to be acknowledege everytime you connect

1. Open a terminal
2. Create your ssh keys couple

`ssh-keygen -t rsa`

Leave the default location for you 
For more security, you can choose to set a passphrase but for the practice leave it blank by pressing enter

3.  Send your publickey to the remote server

`ssh-copy-id login@wavebc.wavecenter.tech`

with login being you own login .

Then enter your password for the last time
`

----------------------------------------------

<a name="practice-1"></a>
### Practice 1: Connect to a linux server by `ssh`

 
1. Open a terminal
 Type  `ssh <your_login>@wavebc.wavecenter.tech` with <your_login>  the login given
  
Once you are successfully logged in, you will be use this console for the rest of the lecture. 

3. Type the command `sinfo` and comment the result
   
5. type the command `sinfo -N nodes --long` and noticed what have been added
   
7. Type the command <code>scontrol show nodes</code>

-----------------------


<a name="practice-2"></a>
### Practice 2: Reserve one core of a node using srun and create your working folder


1. Type the command `squeue` and noticed the result
2. Type the command `squeue -u your_login` with your_login to change with your  account and noticed the difference
3. More details with the command: `squeue -O "username,name:40,partition,nodelist,NumCPUs,state,timeused,timelimit"`
4. Type the command `hostname` then srun `hostname` , note the difference
5. Type the command `srun -p short -c 2 --pty bash -i ` then `squeue` again
6. Type the command `cd /scratch` then `mkdir <my_folder>`


        

-----------------------


<a name="practice-3"></a>
### Practice 3 : Transferring files to or from the storage with `rsync` 


1. Using rsync, transfer a file from your computer to your personal folder <code>/home/login</code> on the storage server (storage-bc.wavecenter.tech)
2. Verify the result with ls from the master (wavebc.wavecenter.tech)
3. Using rsync, transfer the file <code>/projects/SLURM/TP.txt</code> from the storage server to your PC





-----------------------


<a name="practice-4"></a>
### Practice 4: Transfer your data from the storage server to the node in `/scratch` with `rsync` 


1. Using rsync, transfer the folder `SHARE` located in `/projects/SLURM` into your working directory 
2. Check your result with ls
 


-----------------------
<a name="practice-5"></a>
### Practice 5: Use module environment to  load your tools


1. Load blast 2.12.0 module using the bioinfo-shared environment
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


1. Using rsync, transfer your results : the  `Oglab_var1_cds.VS.uniprot.blastx.csv2` file from your `/scratch/your_dir` to your `/home/login` 
2. Check if the transfer is OK with ls
 




-----------------------
<a name="practice-8"></a>
### Practice 8: Deleting your temporary folder

```
cd /scratch
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

1) create a personal folder in /scratch with `mkdir`

2) Using rsync, transfer your data

3) Load the software to use with module load

4) Launch the commands to perform your analysis

5) Using rsync, transfer your results: the `Oglab_var1_cds.VS.uniprot.blastx.csv2` file from your `/scratch/your_dir` to your `/home/login` 


6) Delete the personal folder in the  `/scratch`


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
