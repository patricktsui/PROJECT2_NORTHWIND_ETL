# upload_artifacts.py
import os
import boto3
from datetime import datetime

s3 = boto3.client('s3')

def upload_directory(path, bucket, destination):
    for root, dirs, files in os.walk(path):
        for file in files:
            local_path = os.path.join(root, file)
            relative_path = os.path.relpath(local_path, path)
            s3_path = os.path.join(destination, relative_path)
            s3.upload_file(local_path, bucket, s3_path)

bucket_name = 's3_bucket_name'
artifact_path = '/usr/app/dbt/target'
destination = f'dbt-artifacts/{datetime.now().strftime("%Y-%m-%d")}'

upload_directory(artifact_path, bucket_name, destination)