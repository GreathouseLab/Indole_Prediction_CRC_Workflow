#!/bin/bash

# This is the line-separated text file that stores sample IDs one on each line
read_names="/input/sample/IDs/file"

# This is where is output location is
work_dir="/path/to/output/location"

# Define the paths to the Bowtie2 index
index="index/to/GRCh38_noalt_as/GRCh38_noalt_as"
t2t_index="/index/to/t2t_chm13/v1/chm13.draft_v1.0_plusY/chm13.draft_v1.0_plusY"

# change to work directory
cd ${work_dir}/trim_bowtie_host/

# Loop through each pair of reads in the previous trimmed_reads directory
while IFS=$'\t' read -r col1; do

    R0="$col1"

    # Define the output for host-removed reads
    output="${work_dir}/trim_bowtie_host/${R0}_host_removed_%.fastq.gz"

    input1="${work_dir}/trim_galore_trim/${R0}_1_val_1.fq.gz"
    input2="${work_dir}/trim_galore_trim/${R0}_2_val_2.fq.gz"

    # Run Bowtie2 for the current sample
    # -x - Bowtie2 Index location
    # -1 paired read 1
    # -2 paired read 2
    # --threads - number of threads (ppn on KODIAK)
    # --very-sensitive-local - removing threshold, recommended by documentation
    # --un-conc-gz - output location for host-removed reads
    # > /dev/null - standard output is trashed to save input output overhead
    /data/greathousel/gh_software/bowtie2/bowtie2-2.5.4-linux-x86_64/bowtie2 \
    -x ${index} \
    -1 ${input1} -2 ${input2} \
    --threads 8 \
    --very-sensitive-local \
    --un-conc-gz ${output} > /dev/null

done < "$read_names"

#echo "Program Done!"