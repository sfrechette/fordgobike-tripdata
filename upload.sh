#!/bin/bash
BUCKET=$1

cd data
for f in $(ls *.gz); do
    gsutil -m -h "Content-Encoding:gzip" cp $f $1
    rm -rf $f
    echo "Done: $f"   
done
