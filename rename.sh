#!/bin/bash

cd data
for f in $(ls *.csv); do
    FILESUBSTR1=$(echo $f | cut -d'-' -f 1)
    FILESUBSTR2=$(echo $f | cut -d'-' -f 2)
    FILESUBSTR3=$(echo $f | cut -d'-' -f 3 | cut -d'.' -f 1)
    FILESUBSTR4=$(echo $f | cut -d'.' -f 2) 
    FILESTR="${FILESUBSTR2}-${FILESUBSTR3}-${FILESUBSTR1}.${FILESUBSTR4}"   
    mv $f $FILESTR
    echo "Done: $FILESTR"
done
