import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Reads')

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    download_path = '/tmp/input.fastq'
    s3.download_file(bucket, key, download_path)

    # Read FASTQ file and filter reads

    with open(download_path, 'r') as f:
        lines = []
        for line in f:
            lines.append(line.strip())
            if len(lines) == 4: 
                read_id = lines[0][1:]
                sequence = lines[1]
                quality = lines[3]

                qual = sum(ord(char) - 33 for char in quality) / len(quality)

                if qual >= 30:
                    table.put_item(
                        Item={
                            'read_id': read_id,
                            'sequence': sequence,
                            'quality': quality,
                            'length': len(sequence)
                        }
                    )

                lines = []  #Repeat

    return {
        'statusCode': 200,
        'body': f'Success {key}'
    }