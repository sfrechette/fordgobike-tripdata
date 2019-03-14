# fordgobike-tripdata #
Ford GoBike is the Bay Area's new bike share system, with thousands of public bikes for use across San Francisco, East Bay and San Jose.

System Data: <https://www.fordgobike.com/system-data>   
Ford GoBike trip history data: <https://s3.amazonaws.com/fordgobike-data/index.html>

## Automating the ingestion of data into Google Cloud Storage (GCS) with bash scripts ##
In a nutshell these scripts downloads fordgobike-tripdata from an AWS S3 bucket, transforms (rename) them, gzip and uploads the CSV and GZ file(s) to a Google Cloud Storage bucket...

### Depencies ###
In order to download files from the AWS S3 bucket you need to install and configure the AWS CLI. Please refer to the following documentation <https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html>

### Bash scripts ###
Master file is **ingest.sh** which executes the following bash scripts in order:

*  **download.sh** -> download(s) file(s) from the following AWS S3 bucket s3://fordgobike-data to the /data directory. If no specific file (paramter) is passed, it will download all files from the S3 bucket.
*  **unzip.sh** -> inflate(s) zip file(s) downloaded from the AWS S3 bucket.
*  **rename.sh** -> rename(s) CSV file(s), placing date information 'YYYYMM' at the end, i.e.: from 201801-fordgobike-tripdata.csv to fordgobike-tripdata-201801.csv
*  **gzip.sh** -> deflate(s) file(s) to gzip format. 
*  **upload.sh** -> upload(s) file(s) to Google Cloud Storage using gsutil, according to supplied BUCKET parameter (edit a your convinience).

*optional file*: **cleanup.sh** -> delete(s) file(s) in the /data directory once all completed successfully.

### Installation ###
Clone or download repository
```shell
git clone [https://github.com/sfrechette/fordgobike-tripdata.git] 
cd fordgobike-tripdata
```

### Usage ###
To download all files from AWS S3 bucket s3://fordgobike-data and execute all other activities (scripts):
```shell
./ingest
```

To download a specific file from AWS S3 bucket s3://fordgobike-data and execute all other activities (scripts):
```shell
./ingest 201801-fordgobike-tripdata.csv.zip
```
