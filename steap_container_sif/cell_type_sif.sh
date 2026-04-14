#!/bin/bash

# Run the Singularity cell-type enrichment analysis
# change the config.yml file, and create the gwas, out folders for your anlaysis. You need to bind these files to the Singularity.

singularity exec \
    -B $HOME/STEAP/gwas:/STEAP/gwas \
    -B $HOME/STEAP/out:/STEAP/out \
    -B $HOME/STEAP/snakemake:/STEAP/.snakemake \
    -B $HOME/STEAP/config:/STEAP/config \
    steap_container.sif /bin/bash -c "
    source /opt/miniconda/bin/activate steap
    cd /STEAP
    snakemake --unlock --use-conda -j -s cellect-ldsc.snakefile --configfile config/config.yml
    snakemake --use-conda -j -s cellect-ldsc.snakefile --configfile config/config.yml
    snakemake --use-conda -j -s cellect-magma.snakefile --configfile config/config.yml || \
    snakemake --use-conda -j -s cellect-magma.snakefile --configfile config/config.yml
    snakemake --use-conda -j -s cellect-h-magma.snakefile --configfile config/config.yml || \
    snakemake --use-conda -j -s cellect-h-magma.snakefile --configfile config/config.yml"
