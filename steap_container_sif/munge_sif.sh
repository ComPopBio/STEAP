#!/bin/bash

# Run the Singularity munge function

singularity exec \
steap_container.sif /bin/bash -c "
source /opt/miniconda/bin/activate munge_ldsc
python2  /STEAP/ldsc/mtag_munge.py \
--sumstats XXX.sumstats.txt \
--merge-alleles /STEAP/data/ldsc/w_hm3.snplist \
--a1 A1 \
--a2 A2 \
--snp MarkerName \
--p P \
--N-cas 170756 \
--N-con 329443 \
--signed-sumstats LogOR,0 \
--frq Freq \
--out ~/STEAP/gwas/XXX
"

    
