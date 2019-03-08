#!/bin/bash
BUCKET=gs://fordgobike-tripdata-test

cd data
for f in $(ls *.*); do
	if [ ${f##*.} == 'gz' ] 
	then
    	YEAR=$(echo $f | cut -d'-' -f 3 | cut -b 1-4)
    	gsutil -m -h "Content-Encoding:gzip" cp $f "${BUCKET}/gz/${YEAR}/"
    	#rm -rf $f
    	echo "Done: $f"
    else
     	YEAR=$(echo $f | cut -d'-' -f 3 | cut -b 1-4)
    	gsutil -m cp $f "${BUCKET}/csv/${YEAR}/"
    	#rm -rf $f
    	echo "Done: $f" 
    fi   
done
