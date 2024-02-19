# --- snakefile03 --- #

# ---
# Dummy workflow to run during class
# What to do with rules that require packages etc? 
# Task 1: run on sherlock/scg (should pick up where you left off)
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
        "plots/dummy_plot.pdf"

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
    shell:
        "tail -n +2 {input.trim} >> {output}


rule plot_quals:
    input:
        "results/all.txt"
    output:
        "plots/dummy_plot.pdf"
    script:
        "scripts/plot.py"
    singularity:
        "docker://biocontainers/seaborn:0.12.2_cv1"
    resources:
        time="00:30:00"
    shell:
        "python {script} --input {input} --output {output}"

# ---- Documentation --- #
# https://snakemake.readthedocs.io/en/v7.32.3/snakefiles/deployment.html#running-jobs-in-containers

