#!/bin/bash

cd data
for f in $(ls *.csv); do
    gzip -k $f
    #rm -rf $f
    echo "Done deflating: $f"   
done
exit 0