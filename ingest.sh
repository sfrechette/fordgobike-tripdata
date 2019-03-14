#!/bin/bash

bash download.sh $1
bash unzip.sh
bash rename.sh
bash gzip.sh
bash upload.sh