## Description

| Description              | Hands On Lab Exercises for Linux                                                                                    |
|:-------------------------|:--------------------------------------------------------------------------------------------------------------------|
| Related-course materials | [Reproductibility:Apptainer(singularity) and Conda](https://github.com/CIBiG-wave/cibig-wave.github.io/blob/gh-pages/docs/course_materials/REPRO/CONTAINERS/) |
| Authors                  | Ndomassi TANDO (ndomassi.tando@ird.fr)                                                           |
| Creation Date            | 13/09/2024                                                                                                          |
| Last Modified Date       | 13/09/2024                                                                                                          |
| Modified by              | ndomassi TANDO              |

-----------------------

### Summary

<!-- TOC depthFrom:2 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->
* [Preambule: Softwares to install before connecting to a distant linux server ](#preambule)
* [Practice 1: Install miniconda on your PC](#practice-1)
* [Practice 2: Create your first environment](#practice-2)
* [Practice 3: Launch an analysis on the cluster using your conda environment](#practice-3)
* [Practice 4 : Retreive a appatainer container on the cluster using pull](#practice-4)
* [practice-5 : Launch an analysis on the cluster using containers](#practice-5)
* [practice-6 : Generate a container using a definition file](#practice-6)
* [Links](#links)
* [License](#license)


-----------------------

<a name="preambule"></a>
### Preambule


##### Getting connected to a Linux servers from Windows with SSH (Secure Shell) protocol

| Platform                                                              | Software  | Description | url |
|:----------------------------------------------------------------------| :------------- | :------------- | :------------- |
| <img width="10%" class="img-responsive" src="img/osWin.png"/> | mobaXterm |An enhanced terminal for Windows with an X11 server and a tabbed SSH client | [More](https://mobaxterm.mobatek.net/) |



##### Transferring and copying files from your computer to a Linux servers with SFTP (SSH File Transfer Protocol) protocol

| Platform                                                                                                                                                                                     | Software  | Description | url |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :------------- | :------------- | :------------- |
| <img width="10%" class="img-responsive" src="img/osApple.png"/> <img width="10%" class="img-responsive" src="img/osLinux.png"/> <img width="10%" class="img-responsive" src="img/osWin.png"/>| <img width="10%" class="img-responsive" src="img/filezilla.png"/> filezilla |  FTP and SFTP client  | [Download](https://filezilla-project.org/download.php?type=client)  |


##### Viewing and editing files on your computer before transferring on the linux server or directly on the distant server

| Type | Software  | url |
| :------------- | :------------- | :------------- |
| Distant, consol mode |  nano | [Tutorial](http://www.howtogeek.com/howto/42980/) |  
| Distant, consol mode |  vi | [Tutorial](https://www.washington.edu/computing/unix/vi.html)  |  
| Distant, graphic mode| komodo edit | [Download](https://www.activestate.com/komodo-ide/downloads/edit) |
| Linux & windows based editor | Notepad++ | [Download](https://notepad-plus-plus.org/download/v7.5.5.html) |

-----------------------


<a name="practice-1"></a>
### Practice 1 : Install miniconda on your PC

* Create a directory called `miniconda`

   ```bash
   mkdir miniconda3
   ```

* Download the Miniconda installation script for Linux (Google Cloud Shell runs on a Linux virtual machine):
  ```bash
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  ```

* Run the Miniconda installation script (`-b` to be able to run unattended, which means that all of the agreements are automatically accepted without user prompt. `-u` updates any existing installation in the directory of install if there is one. `-p` is the directory to install into):
  ```bash
  bash Miniconda3-latest-Linux-x86_64.sh  -b -u -p ~/miniconda
  ```

* Add this conda initialization incantation to your .bashrc:

  ```bash
  ~/miniconda3/bin/conda init bash
  ```

* After the install is complete, source your **.bashrc** to refresh the terminal with information about conda:

  ```bash
  source .bashrc
  ```

* This will start the conda environment. Notice that your command prompt now includes **(base)**, e.g.,:
  ```
  (base) dom@dom-PC:~$
  ```

* If you don't want conda to start every time you open a terminal, simply add the following line at the end of your .bashrc:

   ```bash
   conda deactivate
   ```


-----------------------

<a name="practice-2"></a>
###  Practice 2 : Create your first conda environment



-----------------------

<a name="practice-3"></a>
### Practice 3 : Launch an analysis on the cluster using your conda environment



-----------------------

<a name="practice-4"></a>
### Practice 4 :  Retreive a appatainer container on the cluster using pull

-----------------------

<a name="practice-5"></a>
### Practice 5 : Launch an analysis on the cluster using containers

-----------------------

<a name="practice-6"></a>
### Practice 6 : Generate a container using a definition file


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
