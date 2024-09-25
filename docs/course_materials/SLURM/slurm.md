## Description

| Description              | Hands On Lab Exercises for Linux                                                                                    |
|:-------------------------|:--------------------------------------------------------------------------------------------------------------------|
| Related-course materials | [HPC initiation](https://github.com/CIBiG-wave/cibig-wave.github.io/blob/gh-pages/docs/course_materials/SLURM) |
| Authors                  | Ndomassi TANDO (ndomassi.tando@ird.fr)                                                           |
| Creation Date            | 24/09/2024                                                                                                          |
| Last Modified Date       | 25/09/2024                                                                                                          |
| Modified by              | ndomassi TANDO              |

-----------------------

### Summary

<!-- TOC depthFrom:2 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->

* [Practice 1: Get connecting on a linux server by `ssh`](#practice-1)
* [Practice 2: Reserve one core of a node using qrsh and create your working folder](#practice-2)
* [Practice 3: Transfering files with filezilla `sftp` ](#practice-3)
* [Practice 4: Transfering data to the node `scp`](#practice-4)
* [Practice 5: Use module environment to  load your tool](#practice-5)
* [Practice 6: Launch analyses ](#practice-6)
* [Practice 7: Transfering data to the san server `scp` ](#practice-7)
* [Practice 8: Deleting your temporary folder ](#practice-8)
* [Practice 9: Launch a job via sbatch](#practice-9)
* [Links](#links)
* [License](#license)


-----------------------


<a name="practice-1"></a>
### Practice 1: Get Connecting on a linux server by `ssh`

In mobaXterm:
1. Click the session button, then click SSH.
* In the remote host text box, type: bioinfo-master1.ird.fr
* Check the specify username box and enter your user name
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
4. Type the command `srun -p short --pty bash -i ` then `squeue` again 

```
        

-----------------------


<a name="practice-3"></a>
### Practice 3 : Transferring files with filezilla `sftp` 


##### Download and install FileZilla


##### Open FileZilla and save the IRD cluster into the site manager





1. Add the hostname bioinfo-san.ird.fr to have access to /home
2. Set the Login with yours and insert your  password used to connect on the IRD cluster
3. Choose port 22
4. Press the "Connect" button.


##### Transferring files

<img width="100%" class="img-responsive" src="https://southgreenplatform.github.io/trainings//images/tpLinux/tp-filezilla2.png"/>

1. From your computer to the cluster : click and drag an text file item from the left local colum to the right remote column 
2. From the cluster to your computer : click and drag an text file item from he right remote column to the left local column
3. Retrieve the file you want from the right window into your folder on your PC



-----------------------


<a name="practice-4"></a>
### Practice 4: Transfer your data from the san server to the node


1. Using scp, transfer the folder `Ebola` located in `/share/formation/Slurm/TPassembly` into your working directory
2. Check your result with ls
 


-----------------------
<a name="practice-5"></a>
### Practice 5: Use module environment to  load your tools


1. Load abyss 2.2.5 module
2. Check if the tool are loaded
 


-----------------------

<a name="practice-6"></a>
###  Practice 6 : Launch analyses

#### Perform an assembly with abyss-pe

With abyss software, we reassembly the sequences using the 2 fastq files ebola1.fastq and ebola2.fastq

Launch the command

```
abyss-pe k=35 in='ebola1.fastq ebola2.fastq' name=k35
```

NB: you can do the same thing using srun directly from the master assuming that the data have been transfer to the /scratch of your node and that you know the nodename:

From the master, type the following commands:

```
module load abyss/2.2.5
srun -p partitionname --nodelist=nodename --chdir=/scratch/login/TPassembly/Ebola abyss-pe k=35 -j1 np=1  in='ebola1.fastq ebola2.fastq' name=k35
```

the -p allows to indicate the partition to use , replace `partitionname`parameter 
the --nodelist allows to indicate the node to use , replace `nodename`parameter 
the `--chdir` allows to change the working directory and to precise in which directory the analysis will be done directly into the node.

-----------------------
<a name="practice-7"></a>
### Practice 7: Transfering data to the san server


1. Using scp, transfer your results from your `/scratch/login` to your `/home/login` 
2. Check if the transfer is OK with ls
 




-----------------------
<a name="practice-8"></a>
### Practice 8: Deleting your temporary folder

```
cd /scratch
rm -r login
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

2) Precise your email

3) Choose the short partition

2nd step: type  the commands you want the script to launch:

1) create a personal folder in /scratch with `mkdir`

2) Using scp, transfer the folder `Ebola` located in `/share/formation/Slurm/TPassembly` into your working directory

3) Launch abyss version 2.2.5 with module load

4) Into the the folder `Ebola`, launch the following command:

```
abyss-pe k=35 in='ebola1.fastq ebola2.fastq' name=k35
```

5) Using scp, transfer your results from your `/scratch/login` to your `/home/login` 


6) Delete the personal folder in the  `/scratch`


Launch the following commands to obtain info on the finished job:

```
seff <JOB_ID>
sacct --format=JobID,elapsed,ncpus,ntasks,state,node -j <JOB_ID>
```


Bonus:
-------

We are  going to launch a 4 steps analysis:

1) Perform a multiple alignment with the nucmer  tool

2) Filter these alignments with the delta-filter  tool

3) Generate a tab file easy to parse the with show-coords tools

4) Generate a png image with mummerplot


- Retrieve the script /projects/medium/formation/Slurm/scripts/alignment_slurm.sh into your /home/login

- modify the Slurm section and the variables

- launch the script with sbatch:

```
sbatch alignment.sh
```

- Do a `ls -altr` in your `/home/login`. What do you notice?

- Launch the following commands to obtain info on the finished job:

```
seff <JOB_ID>
sacct --format=JobID,elapsed,ncpus,ntasks,state,node -j <JOB_ID>
```

- Open filezilla and retrieve the png image to your computer

- Launch the following commande to clear the /scratch of the node

```
sh /opt/scripts/scratch-scripts/scratch_use.sh
```

and choose the number of the node used

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
