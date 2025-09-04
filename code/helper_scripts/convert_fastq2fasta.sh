#!/bin/bash

# Adding conda and activating conda environment to run seqtk, this needs to be done prior by the user
source /home/yuj/anaconda3/etc/profile.d/conda.sh
conda activate convert2FASTA

# This is the line-separated text file that stores sample IDs one on each line
read_names="/input/sample/IDs/file"

# This is where the output goes
output_dir="/to/the/output/location"

# This is where the input files are 
input_dir="/to/the/input/location"

# change directory to the output location
cd ${output_dir}

# Loop through each pair of reads in the samples directory
while IFS=$'\t' read -r col1 col2 col3; do

    R0="$col1"

    seqtk seq -A ${input_dir}/${R0}_host_removed_1.fastq.gz > ${output_dir}/noContig/${R0}_1.fna
    seqtk seq -A ${input_dir}/${R0}_host_removed_2.fastq.gz > ${output_dir}/noContig/${R0}_2.fna

done < "$read_names"

#echo "Program finished"
