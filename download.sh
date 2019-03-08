#!/bin/bash
FILE=$1

cd data  
wget https://s3.amazonaws.com/fordgobike-data/$1 
echo "Done: $1"


