# upload_artifacts.py
import os
import boto3
from datetime import datetime

s3 = boto3.client('s3')

# Function to upload an entire directory to S3
def upload_directory(path, bucket, destination):
    for root, dirs, files in os.walk(path):
        for file in files:
            local_path = os.path.join(root, file)
            relative_path = os.path.relpath(local_path, path)
            s3_path = os.path.join(destination, relative_path)
            s3.upload_file(local_path, bucket, s3_path)

# S3 bucket name where artifacts will be uploaded
bucket_name = 's3_bucket_name'
#  Local path where dbt artifacts are stored on the container
artifact_path = '/usr/app/dbt/target'
# S3 destination path, including current date for organization
destination = f'dbt-artifacts/{datetime.now().strftime("%Y-%m-%d")}'

upload_directory(artifact_path, bucket_name, destination)