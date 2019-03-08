#!/bin/bash
FILE=$1
S3BUCKET=s3://fordgobike-data

cd data  
if [ -z "$1" ] 
then
    aws s3 cp ${S3BUCKET} . --recursive --exclude "*.html"
    echo "Done"
else
    aws s3 cp "${S3BUCKET}/${1}" . 
    echo "Done: $1"
fi 

