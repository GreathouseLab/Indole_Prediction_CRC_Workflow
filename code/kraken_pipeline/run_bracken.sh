#!/bin/bash

# Adding conda and activating conda environment
source /home/yuj/anaconda3/etc/profile.d/conda.sh
conda activate metagenomics

# This is the line-separated text file that stores sample IDs one on each line
read_names="/input/sample/IDs/file"

# This is where the output goes
output_dir="/to/the/output/location"

# This is where the input files are 
input_dir="/to/the/input/location"

cd ${input_dir}

while IFS=$'\t' read -r col1; do

    R0="$col1"
    
    # -r - length of sameple reads 
    # -d - location of the bracken datbase, it is important there is a kmer length that matches the length -r specifies
    # -l - taxonomy level for the output, S is species (defult)
    bracken -i ${output_dir}/${R0}_kraken_report.txt \
            -o ${output_dir}/bracken_results/${R0}_bracken_species.txt \
            -r 100 \
            -d /home/yuj/greathousel/gh_software/bracken/bracken_db \
            -l S

done < "$read_names"