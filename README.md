# baywheels-tripdata-bash  

## TODO: Clean up README.md, now Lyft instead of previous Ford GoBike

Lyft Bay Wheels is the Bay Area's new bike share system, with thousands of public bikes for use across San Francisco, East Bay and San Jose.

System Data: <https://www.lyft.com/bikes/bay-wheels/system-data>  
Lyft Bay Wheels's trip history data: <https://s3.amazonaws.com/baywheels-data/index.html>

## Automating the ingestion of data into Google Cloud Storage (GCS) with bash scripts

**In a nutshell these scripts do the following:**  
Downloads all or a specified baywheels-tripdata file(s) from an AWS S3 bucket, inflate(s), rename(s) the CSV file(s) then deflates(s) a copy and upload(s) the .csv file(s) to a **csv** folder and upload(s) .gzip(s) file(s) to a **gz** folder to the provided Google Cloud Storage bucket you need to supply in the upload.sh script.

### Depencies

In order to download files from the AWS S3 bucket you need to install and configure the AWS CLI. Please refer to the following documentation <https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html>

### Bash scripts

Master file is **ingest.sh** which executes the following bash scripts in order:

* **download.sh** -> download(s) file(s) from the following AWS S3 bucket s3://baywheels-data to the /data directory. If no specific file (paramter) is passed, it will download all files from the S3 bucket.  
* **unzip.sh** -> inflate(s) zip file(s) downloaded from the AWS S3 bucket.  
* **rename.sh** -> rename(s) CSV file(s), placing date information 'YYYYMM' at the end, i.e.: from 201801-fordgobike-tripdata.csv to fordgobike-tripdata-201801.csv  
* **gzip.sh** -> deflate(s) file(s) to gzip format.  
* **upload.sh** -> upload(s) file(s) to Google Cloud Storage using gsutil, according to supplied BUCKET parameter (edit a your convinience).  

*optional file*: **cleanup.sh** -> delete(s) file(s) in the /data directory once all completed successfully.

### Installation

Clone or download repository

```shell
git clone [https://github.com/sfrechette/fordgobike-tripdata.git]  
cd fordgobike-tripdata
```

### Usage

To download all files from AWS S3 bucket s3://baywheels-data and execute all other activities (scripts):

```shell
./ingest
```

To download a specific file from AWS S3 bucket s3://baywheels-data and execute all other activities (scripts):

```shell
./ingest 201909-baywheels-tripdata.csv.zip
```
