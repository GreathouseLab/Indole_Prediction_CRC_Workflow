#!/bin/bash

# Loading in both path to java and python ro run trim galore on HPC
###
# Local machines may need to modify the following lines to satisfy requirements
### 
module load java/18
module load python/3.13.0

# This is where is output location is
work_dir="/path/to/output/location"

cd ${work_dir}

data_dir="/input/file/directory/location"

# This is the line-separated text file that stores sample IDs one on each line
read_names="/input/sample/IDs/file"

# Loop through the sample IDs to feed into the trim galore software
while IFS=$'\t' read -r col1 col2 col3; do

    R0="$col1"
		
		# path to cutadapt is done through a python virtual env, 
		# this needs to be created by the user and cutadapt need to be added to the env before it can be used
		# 
		# cores - number of threads (ppn in Kodiak)
		# paired - samples are paried sample reads
		# retain_unpaired - quality check and trim galore will keep reads that cannot be mapped to its paired files
		# gzip - output will be gzipped (avoids large storage consumption)
		# -o - output location
		# > - redirecting run report to location given by user
    /data/greathousel/gh_software/trim_galore/TrimGalore-0.6.10/trim_galore \
        --path_to_cutadapt /home/yuj/privatemodules/multiqc_venv/bin/cutadapt \
        --cores 4 \ 
        --paired \
        --retain_unpaired \
        --gzip \
        -o ${work_dir} \
        ${data_dir}/${R0}_1.fastq.gz ${data_dir}/${R0}_2.fastq.gz > ${work_dir}/run_report/${R0}.txt 2>&1

done < "$read_names"