#!/bin/bash

S3BUCKET="s3://baywheels-data"

mkdir -p data
cd data  
if [ -z ${1} ] 
then
    aws s3 cp ${S3BUCKET} . --recursive --exclude "*.html"
    echo "Done downloading"
else
    aws s3 cp "${S3BUCKET}/${1}" . 
    echo "Done downloading: $1"
fi 
exit 0