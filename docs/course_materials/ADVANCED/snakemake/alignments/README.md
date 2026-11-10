# Snakemake exercice : Bowtie2 alignment pipeline

This folder containts two versions of the Bowtie2 alignement pipeline :

* wave : version realized all together during the course
* full : complete version including scratch data management

## How to run the pipelines

Load the snakemake module :

```
module load bioinfo-shared
module load snakemake/7.32.4
```

Make the `SLURM_EXPORT_ENV` variable is unset to fix a temporary JupyterLab bug :

```
unset SLURM_EXPORT_ENV
```

Snakemake 7.32.4 is using a version of Python that will not be supported by somme Python librairies used by snakemake in the future. It triggers some warning messages that can be safely ignored :

```
export PYTHONWARNINGS="ignore::FutureWarning"
```

Enter the version of the workflow you want to run :

```
cd wave
```

or

```
cd full
```

Generate the DAG

```
module load graphviz
snakemake --dag | dot -Tpdf > dag.pdf
```

Run the workflow

```
snakemake --profile profiles/slurm
```