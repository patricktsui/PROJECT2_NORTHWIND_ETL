# End-to-End dbt Deployment on AWS

The dbt models are initially developed and tested in a local environment. Once the transformation logic is validated, a Docker image is built, encapsulating the dbt project, Snowflake connection details, and a custom Python script for dbt artifact management. This image is then pushed to Amazon Elastic Container Registry (ECR) for versioned storage and easy deployment. An Amazon Elastic Container Service (ECS) cluster is set up to run the containerized dbt tasks using AWS Fargate, providing a serverless compute environment. When executed, the ECS task runs the dbt models, which perform the data transformations directly in Snowflake, leveraging its processing capabilities. Sensitive credentials and connection strings are securely managed using AWS Secrets Manager. Upon completion, the [embedded Python script](/data_transformation/northwind_dbt/upload_artifacts.py) uploads the generated dbt artifacts to a designated Amazon S3 bucket. This entire process is automated and scheduled using Amazon EventBridge, which triggers the ECS task at predetermined intervals, typically set for daily execution at 2:00 AM. This architecture ensures consistent, scheduled data transformations in Snowflake with proper artifact storage and management in AWS.

The following screenshots provide visual documentation of the process.

## Dcoker image pushed to ECR's repositry northwind-dbt
![ECR image](/screen_capture/ECR_images.jpg)

## Setting up An Amazon Elastic Container Service (ECS) cluster
![ECR Cluster](/screen_capture/ECS_cluster.jpg).

## Create containerized dbt [tasks](/data_orchestration/ecsTaskDefinition.json) using AWS Fargate
![ECR Task Definition](/screen_capture/ECS_task_definitions.jpg)

## ECS schedule task by Amazon EventBridge
![ECR Scheduler](/screen_capture/ECS_scheduled_task.jpg)

## Sensitive credentials and connection strings are securely managed using AWS Secrets Manager
![Secret Manager](/screen_capture/Secret_Manager.jpg)

## Amazon S3 bucket created for storage dbt arctifacts
![S3 bucket](/screen_capture/S3_bucket_dbt_atifacts.jpg)

## dbt transformed data on Snowflake
![Transformed Data](/screen_capture/Snowfalke_Marts.jpg)