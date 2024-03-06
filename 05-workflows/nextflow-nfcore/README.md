
## Hands-on Exercise
### Running Nextflow/nf-core Sarek Pipeline for Mutation Calling

This is a hands-on exercise to run the Nextflow-based nf-core Sarek pipeline for mutation calling. This exercise assumes that students have access to a computational environment with Nextflow installed, as well as access to a computing cluster or cloud environment for running the pipeline.

## Objective

The objective of this exercise is to introduce students to running the nf-core Sarek pipeline (https://nf-co.re/sarek/3.3.0
) version 3.3.0 for mutation calling using Nextflow on a cluster environment (Sherlock at Stanford).

## Prerequisites:

-  Access to a computing cluster or cloud environment
-  Installed Nextflow and Singularity on the cluster
-  Familiarity with basic Unix commands and workflow concepts

## Steps 

### SSH to Sherlock

``
ssh <SUNetID>@login.sherlock.stanford.edu
``

### Make a directory

Let's make a directory on the scratch space.

```
mkdir -p /scratch/users/${USER}/bios259/sarek
cd /scratch/users/${USER}/bios259/sarek
```

### Load the Java module, because Nextflow needs Java

We have a pre-installed copy of `Nextflow version 23.10.1`. If you already have a Nextflow installed, skip the step below.

Nextflow needs Java, so let's load Java using the module load.
```
module load java/18.0.2

## export the paths
export PATH=/scratch/users/azizk/bios259/bin:${PATH}
mkdir -p /scratch/users/${USER}/bios259/nf-core && export NXF_SINGULARITY_CACHEDIR=/scratch/users/${USER}/bios259/nf-core
```

### Try and check if Nexflow is working
Try this
``
nextflow -h
``
If this does not work, you can easily install Nextflow in the current dir using:
``
wget -qO- https://get.nextflow.io | bash && chmod +x nextflow
``
now try this
``
./nextflow -h
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
This is a small test data that uses only part of one chromosome. You need to find what chromosome is at the end. 

```
nextflow run nf-core/sarek -profile test,singularity --outdir results -r 3.3.0 --tools strelka
```

### View the results

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

Now, you can look for the CNAs. What chromosome number was used for this analysis?

### Install nf-core tools

```
conda install -c biocnda nf-core
```
**OR**
```
pip install nf-core
```
Once installed, you can view all the available pipelines.

```
nf-core list
```

```
(nf) CCC-YM6P2N5QX4:eniclust azizk$ nf-core list

                                          ,--./,-.
          ___     __   __   __   ___     /,-._.--~\
    |\ | |__  __ /  ` /  \ |__) |__         }  {
    | \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                          `._,._,'

    nf-core/tools version 2.13 - https://nf-co.re
    There is a new version of nf-core/tools available! (2.13.1)


┏━━━━━━━━━━━┳━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━┓
┃           ┃       ┃           ┃          ┃           ┃ Have     ┃
┃ Pipeline  ┃       ┃    Latest ┃          ┃      Last ┃ latest   ┃
┃ Name      ┃ Stars ┃   Release ┃ Released ┃    Pulled ┃ release? ┃
┡━━━━━━━━━━━╇━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━┩
│ rnaseq    │   744 │    3.14.0 │ 2 months │         - │ -        │
│           │       │           │      ago │           │          │
│ raredise… │    65 │     1.1.1 │ 7 months │         - │ -        │
│           │       │           │      ago │           │          │
│ detaxizer │     6 │       dev │  4 hours │         - │ -        │
│           │       │           │      ago │           │          │
│ nascent   │    13 │     2.2.0 │ 17 hours │         - │ -        │
│           │       │           │      ago │           │          │
│ mhcquant  │    29 │     2.5.0 │ 5 months │         - │ -        │
│           │       │           │      ago │           │          │
│ variantb… │     4 │       dev │ yesterd… │         - │ -        │

.
.
```

