#!/bin/bash

# Adding conda and activating conda environment
source /home/yuj/anaconda3/etc/profile.d/conda.sh
conda activate shortbred

shortbred_dir="/home/yuj/greathousel/gh_software/shortbred/shortbred-0.9.4"

data_file_name="/home/yuj/greathousel/DATASETS/Zeller_CRC/short_FASTA/zeller_paired_end_reads_00"

cd /home/yuj/greathousel/ANALYSES/INDOLE/shortbred

data_dir="/home/yuj/greathousel/DATASETS/Zeller_CRC"

while IFS=$'\t' read -r col1; do

    R0="$col1"
	  
    python ${shortbred_dir}/shortbred_quantify.py \
	    --markers markers/mytestmarkers_prebuiltdb3.faa \
	    --wgs ${data_dir}/short_FASTA/noContig/${R0}_1.fna ${data_dir}/short_FASTA/noContig/${R0}_2.fna \
	    --results run_noContig_three/results/${R0}_paired_results.tsv --usearch /home/yuj/greathousel/gh_software/usearch/usearch11.0.667_i86linux32 --tmp run_noContig_three/temp/${R0}_paired_quantify --threads 4

done < "$data_file_name"