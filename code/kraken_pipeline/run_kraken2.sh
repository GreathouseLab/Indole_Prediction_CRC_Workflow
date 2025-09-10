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

		# --db - The Kraken/Bracken DB needs to downloaded before this can be run
		# --paired - Running paired samples
		# --gzip-compressed - Input files are gzipped compressed
		# --threads - Number of threads (ppn for Kodiak)
		# --report - This is the result needed to run Bracken
		kraken2 --db /home/yuj/greathousel/gh_software/bracken/bracken_db \
            --paired \
            --gzip-compressed \
            --threads 8 \
            --report ${output_dir}/${R0}_kraken_report.txt \
            --output ${output_dir}/${R0}_kraken_output.txt \
            ${R0}_host_removed_1.fastq.gz ${R0}_host_removed_2.fastq.gz

done < "$read_names"