# --- snakefile01 --- #

# ---
# Dummy workflow to run during class
# Notice how we haven't given any resources--this is all handled by default snakemake profile
# Task 1: pull this directory from github and run on sherlock/scg
# Task 2: try editing this workflow to stop at rule trim
# Task 3: try editing this workflow to change default resources
# ---

# --- Specify wildcards --- #
# Good way to make sure every file is processed
# Because snakemake is python-based, you can easily work out how to do additional things (e.g. specify file with list of all samples)
# snakemake can also infer wildcards e.g. if you want to run all files in a directory
# e.g. SAMPLES, = glob_wildcards("directory/{sample}.fastq")
SAMPLES = ["A", "B"]

configfile: "config.yaml" # config files make it very easy to customise in the future

# --- Snakemake rules --- #
rule all:
    # rule all tells the final file it needs to make. It then works backwards to figure out to workflow
    input:
        "results/all.txt"

rule trim:
    input:
        "data/input.txt",
    output:
        "data/trim/{sample}.txt"
    shell:
        "head -n 100 {input} > {output}"

# ---
# Example of expand() to aggregate
# You can also put expand() in rule all to run wildcards
# e.g. rule all: expand("data/trim/{sample}.txt", sample=SAMPLES)
# in which case every sample file will be run independently in parallel
# ---
rule concat:
    input:
        trim=expand("data/trim/{sample}.txt", sample=SAMPLES),
    output:
        "results/all.txt"
    resources:
        time="00:30:00" # e.g. changing default resource
    shell:
        "tail -n +2 {input.trim} >> {output}

# ---- Documentation --- #
# https://snakemake.readthedocs.io/en/v7.32.3/
# NB snakemake has a new version (v8)