## Hands-on Exercise: Running Snakemake workflow

This is a hands-on exercise on running Snakemake workflows on the cluster (either SCG or Sherlock). Through a dummy workflow, students will learn the basics of a Snakemake workflow: rules; wildcards; resource management; environment management. 

### Snakemake cli commands
To run locally, just provide no. of cores e.g.
`snakemake --snakefile <snakefile.smk> -c1`

To use slurm, use one of the snakemake profiles, depending if you're using scg/sherlock (feel free to change e.g. partition) e.g.
`snakemake --snakefile <snakefile.smk> --profile <snakemake_profiles/slurm_sherlock>`

To do a dry-run (you should!), just put `-n` at the end, e.g. 
`snakemake --snakefile <snakefile.smk> -c1 -n`

If you use `snakemake_profiles`, please inspect the `config.yaml` file and `chmod u+x status-sacct.sh` 
* This is just a script to ask slurm the status of each job. For our class, this is a bit over the top. This makes sure we're aware of jobs that silently fails (the exact `sacct` status we're monitoring are in the script)
