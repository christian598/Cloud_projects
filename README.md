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

### 4. Infrastructure as Code - Terraform
Services used: Terraform, Bash, AMI, EC2
This project was for learning the concept of Infrastructure as Code. 

Requirements before running - Setup AWS CLI (User should have Admin role), Install terraform (local)

Terraform will create AMI group and user, launch EC2 instance (T3-MICRO), Create user/group on the linux server and set permissions for specific folder (user_data.sh).
1. **main.tf**: The main configuration file to define which resources/services terraform will create/launch
2. **variables.tf**: Variables/customizable parameters for example, region, EC2 AMI, EC2 type - Will be accessed by main.tf
3. **outputs.tf**: This file can be used specific information about the run after launching. Example, show public IP for connecting to the instance.
4. **user_data.sh**: User data file that can be configured with commands that should be run on the instance after launch.

RUN:
terraform init
terraform plan
terraform apply

terraform destroy


