#!/bin/bash

# '*' is a wildcard character in bash. It tells the shell to look for files which end in .fastq

cd /Users/jan/FAKS/PhD/LRR_project/Data/NANOPORE/Prefilter/Jan22

for f in *.fastq
do
	echo " ------------------------- Filtering and mapping... - $f 	----------------------------------"
	
	nanofilt --length 4100 --maxlength 4700 $f > $f.lengthfilt.fastq

	gsed -n '1~4s/^@/>/p;2~4p' $f.lengthfilt.fastq > $f.lengthfilt.fasta


done