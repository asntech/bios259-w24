# --- snakefile02 --- #
# Dummy workflow to just go through decorators

configfile: "config.yaml" # config files make it very easy to customise in the future
my_checksum = "b8bb75d49e66433ac9cd8b7e70fed15d" # this can be in config file, try it :^) 

# --- Snakemake rules --- #
rule all:
    input:
        "plots/dummy_plot.pdf"

# ---
# Example of a decorator: ensure()
# Can be used to check your output. Here is md5sum
# Again, because snakemake is python-based, you can work out how to tweak this for multiple files i.e.
# Having some dictionary {sample: md5sum}
# and a function that returns that
# e.g.
# def get_checksum(wildcards):
#    return my_checksums[wildcards.sample]
# and then:
# ensure(<some {sample} wildcard output>, sha256=get_checksum)
# ---

rule all: "results/all.txt"

rule download:
    output:
        ensure("data/powerball.txt", sha256=my_checksum) # check our download
    params:
        link="https://data.ny.gov/api/views/d6yy-54nr/rows.csv?accessType=DOWNLOAD" # put whatever params for the rule
    shell:
        "wget -O {output}"


rule some_operation:
    input:
        "powerball.txt"
    output:
        temp("data/powerball_transformed.txt") # temp lets us delete files once the next rule has successfully run
    shell:
        "some operation"

rule concat:
    input:
        "data/powerball_transformed.txt"
    output:
        protected("results/all.txt") 
    shell:
        "cat {input.trim} > {output}


# ---- More info on rules and decorators --- #
# https://snakemake.readthedocs.io/en/v7.32.3/snakefiles/rules.html
