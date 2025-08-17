# Cloud_projects
Collection of small cloud projects for learning purposes


## Projects

### 1. FASTQ quality filter ETL pipeline
Services used: AWS Lambda, S3, DynamoDB, Python, IAM.

Filters sequencing reads based on phred score, stores high quality reads in DynamoDB

When a FASTQ file is uploaded to S3, a lambda function triggers.
1. **Extracts**: Reads the sequencing data from S3 bucket
2. **Transforms**: Calculates the phred quality score for each read and filters out low quality reads.
3. **Loads**: Stores the high quality reads in a DynamoDB.

### 2. QC Pipeline
Services used: AWS batch, S3, Nextflow, IAM.

Simple Quality Control Nextflow pipeline for testing S3 input/output and AWS batch for submitting compute jobs.

Pipeline created in Nextflow, and executed on AWS Batch, input and output files are stored in an S3 bucket.
1. **Initial QC**: Runs FastQC on raw sequencing reads 
2. **Read trimming**: Runs FastP for adapter trimming and low quality read filtering.
3. **Post QC**: Runs FastQC again on trimmed sequencing reads.
4. **Output**: Results are outputted to the same S3 bucket.

### 3. EC2 setup - Linux, AWS, Sys
Services used: EC2, EFS, Docker, GitHub, Cron, Linux user groups  

Markdown file documentation:
1. **Setup EC2**: Install dependencies, mount volumes, configure storage, mount AWS EFS
2. **Docker**: Build and push custom containers to AWS ECR
3. **GitHub**: Setup SSH keys, push/pull
4. **Cron Jobs**: Automate with Cron jobs.
5. **User/Group**: Manage Linux groups, permissions, and storage access  

