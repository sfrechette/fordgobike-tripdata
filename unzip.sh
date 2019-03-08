#!/bin/bash

cd data
for f in $(ls *.zip); do
    unzip -a $f
    rm -rf $f
    echo "Done inflating: $f"   
done
exit 0