# Hands-on Exercise: Running Snakemake workflow

This is a hands-on exercise on running Snakemake workflows on the cluster (either SCG or Sherlock). Through a dummy workflow, students will learn the basics of a Snakemake workflow: rules; wildcards; resource management; environment management. 

We will run `snakefile01.smk` and `snakefile03.smk` during class. (We will just skim `snakefile02.smk`.

## Prerequisites
* Installed snakemake v7.32.2 on scg/sherlock
  * If you don't have conda on the cluster, install miniconda. Follow the instructions under [here](https://github.com/bhattlab/scg_tools?tab=readme-ov-file#setting-up-your-environment-with-conda). Make sure you've downloaded conda by trying `which python` and `which conda`.
  * Follow the instructions in this [link](https://snakemake.readthedocs.io/en/v7.32.2/getting_started/installation.html), making sure to specify the version [hint: use `snakemake=7.32.2`]
* Clone this repo to a dir on the cluster [hint: use `git clone`]

## Class exercise
You can choose either to run locally, or to send jobs (i.e. sbatch). All of this should be handled by snakemake profiles. You should try both!

To run locally, just provide no. of cores e.g.
`snakemake --snakefile <snakefile.smk> -c1`

To use slurm, use one of the snakemake profiles, depending if you're using scg/sherlock (feel free to change e.g. partition) e.g.
`snakemake --snakefile <snakefile.smk> --profile <snakemake_profiles/slurm_sherlock>`

If you use `snakemake_profiles`, please inspect the `config.yaml` file and `chmod u+x status-sacct.sh` 
* Make sure the paths in `config.yaml` makes sense and you understand what it's there to do. Notice a lot of these are just sbatch options
* `status-sacct.sh` is just a script to ask slurm the status of each job. For our class, this is a bit over the top. This makes sure we're aware of jobs that silently fails (the exact `sacct` status we're monitoring are in the script)

To do a dry-run (you should!), just put `-n` at the end, e.g. 
`snakemake --snakefile <snakefile.smk> -c1 -n`


Please follow the following instructions:

### `snakefile01.smk`
Try:
1. Review and check it makes sense. Run this as-is on scg/sherlock 
2. Edit `snakefile01.smk` to stop at `rule trim`
3. Edit this workflow to change default resources

### `snakefile03.smk`
1. Review and check it makes sense. Run this as-is on scg/sherlock
2. Try deleting intermediate files. What happens when you rerun the workflow? 



