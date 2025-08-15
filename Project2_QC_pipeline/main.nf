#!/usr/bin/env nextflow

params.reads = "s3://qc-nextflow-bucket/sample.fastq" #s3 bucket

process FASTQC_RAW {
    container 'biocontainers/fastqc:v0.11.9_cv8'
    input:
    path reads
    output:
    path "fastqc_raw/*"
    script:
    """
    mkdir -p fastqc_raw
    fastqc $reads -o fastqc_raw
    """
}

process FASTP_TRIM {
    container 'quay.io/biocontainers/fastp:0.23.2--h5f740d0_0'
    input:
    path reads
    output:
    path "trimmed.fastq"
    path "fastp_report/*"
    script:
    """
    mkdir -p fastp_report
    fastp -i $reads -o trimmed.fastq -h fastp_report/fastp.html -j fastp_report/fastp.json
    """
}

process FASTQC_CLEAN {
    container 'biocontainers/fastqc:v0.11.9_cv8'
    input:
    path cleaned
    output:
    path "fastqc_clean/*"
    script:
    """
    mkdir -p fastqc_clean
    fastqc $cleaned -o fastqc_clean
    """
}

workflow {
    raw = file(params.reads)
    fastqc1 = FASTQC_RAW(raw)
    trimmed = FASTP_TRIM(raw)
    FASTQC_CLEAN(trimmed[0])
}

