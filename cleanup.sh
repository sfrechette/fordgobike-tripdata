#!/bin/bash

cd data 
for f in $(ls *.*); do
    rm -f $f
    echo "Done deleting: $f"   
done
exit 0