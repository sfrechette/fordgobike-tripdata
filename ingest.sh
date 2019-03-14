#!/bin/bash
FILE=$1

bash download.sh $1
bash unzip.sh
bash rename.sh
bash gzip.sh
bash upload.sh