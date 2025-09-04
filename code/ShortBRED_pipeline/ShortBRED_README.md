## ShortBRED Description 
The ShortBRED software is a pipeline to take a set of protein sequences, reduce them to a set of unique identifying strings ("markers"), and then search for these markers in metagenomic data and determine the presence and abundance of the protein families of interest. The software is separated into two steps, with ShortBRED-Identify as the 1st step and ShortBRED-Quantify as the 2nd step. 

See the Official ShortBRED Github page here to read more about the tool here: [https://github.com/biobakery/shortbred](https://github.com/biobakery/shortbred)

---

## ShortBRED setup (Modified from ShortBRED repository)
To install ShortBRED, simply download the file below, and extract its contents.

[https://github.com/biobakery/shortbred/archive/0.9.4.zip](https://github.com/biobakery/shortbred/archive/0.9.4.zip)

You may also install it with Git by using the "Clone" command from the Git repo.

To run ShortBRED, you will need the following dependencies:

* Python 2.7.9
* Biopython v1.65
* ncbi-blast-2.2.28+
* usearch v6.0.307 (Please make sure this is up to date. Earlier versions of usearch use a different command for making database than what is expected by ShortBRED.)
* MUSCLE v3.8.31
* CD-HIT version 4.6

Or use the .yaml file here as a reference: [shortbred.yaml](shortbred.yaml)

---

## Things to consider before attempting ShortBRED-Identify setup on local machine or server for this workflow
1. Bacterial NCBI database for BLAST needs to be downloaded and setup.
1. Blast suite needs to be downloaded and installed.
1. ShortBRED identify runs on python 2 and requires many packages that are not straight forward to install.

---

## Common problems with ShortBRED (Updated as needed)
1. If there is an error with fasta formats due to sequence ID naming conventions, following the error instructions to fix any formatting problems from the shortbred_identify.py script