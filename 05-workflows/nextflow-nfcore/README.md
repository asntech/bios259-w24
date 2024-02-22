
## Hands-on Exercise: Running Nextflownf-core Sarek Pipeline for Mutation Calling

This is a hands-on exercise to run the Nextflow based nf-core Sarek pipeline for mutation calling. This exercise assumes that students have access to a computational environment with Nextflow installed, as well as access to a computing cluster or cloud environment for running the pipeline.

## Objective

The objective of this exercise is to introduce students to running the nf-core Sarek pipeline (https://nf-co.re/sarek/3.3.0
) version 3.3.0 for mutation calling using Nextflow on a cluster environment (Sherlock at Stanford).

## Prerequisites:

-  Access to a computing cluster or cloud environment.
-  Installed Nextflow and Docker/Singularity on the cluster.
-  Familiarity with basic Unix commands and Nextflow concepts.

## Steps 

### SSH to Sherlock

``
ssh <SUNetID>@login.sherlock.stanford.edu
``

### Make a direcotry

Let's make a directory on the scratch space.

```
mkdir -p /scratch/users/${USER}/bios259/sarek
cd /scratch/users/${USER}/bios259/sarek
```

### Load the Java module as Nextflow needs Java

Nextflow needs Java, so let's load Java using the module load.
```
module load java/18.0.2

## export the paths
export PATH=/scratch/users/azizk/bios259/bin:${PATH}
export NXF_SINGULARITY_CACHEDIR=/scratch/users/azizk/bios259/nf-core
```

### Try and check if Nexflow is working
Try this
``
nextflow -h
``

### Start an interactive session on Sherlock

We will use the `sh_dev` command to shart an interactive session on Sherlock

```
$ sh_dev -h
sh_dev: start an interactive shell on a compute node.

Usage: sh_dev [OPTIONS]
    Optional arguments:
        -c      number of CPU cores to request (OpenMP/pthreads, default: 1)
        -n      number of tasks to request (MPI ranks, default: 1)
        -N      number of nodes to request (default: 1)
        -m      memory amount to request (default: 4GB)
        -p      partition to run the job in (default: dev)
        -t      time limit (default: 01:00:00)
        -r      allocate resources from the named reservation (default: none)
        -J      job name (default: sh_dev)
        -q      quality of service to request for the job (default: normal)

    Note: the default partition only allows for limited amount of resources.
    If you need more, your job will be rejected unless you specify an
    alternative partition with -p.
```

Use this:
```
sh_dev -c 4 -m 8GB -t 01:00:00 -J sarek_test
```

### Run the Sarek pipeline using a test dataset

We will run the pipeline as a singularity on test data and call somatic mutations using Strelka2.
This is a small test data which uses only part of one chromosome. You need to find what chromosome is that at the end. 

```
nextflow run nf-core/sarek -profile test,singularity --outdir results -r 3.3.0 --tools strelka
```

### View the resuts

```
cd results
ls 
```

You can also view and download the results using the OnDemand: https://ondemand.sherlock.stanford.edu/
Read more about Sherlock OnDemand here - https://www.sherlock.stanford.edu/docs/user-guide/ondemand/

Try to locate the MultiQC outputs

### Let's resume the pipeline and also run CNVKit

Along the way, your PI wants to see the copy number alterations in the same sample.
You can simple go the same directory and resume the pipeline by providing cnvkit to tools arguments.

```
nextflow run nf-core/sarek -profile test,singularity --outdir results -r 3.3.0 --tools strelka,cnvkit -resume
```

Now you can look for the CNAs. Can you find what chromosome number was used for this analysis.
