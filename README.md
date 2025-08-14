# Cloud_projects
Collection of small cloud projects


## Projects

### 1. FASTQ quality filter ETL pipeline
Services used: AWS Lambda, S3, DynamoDB, Python.

Filters sequencing reads based on phred score, stores high quality reads in DynamoDB

When a FASTQ file is uploaded to S3, a lambda function triggers.
1. **Extracts**: Reads the sequencing data from S3 bucket
2. **Transforms**: Calculates the phred quality score for each read and filters out low quality reads.
3. **Loads**: Stores the high quality reads in a DynamoDB.
