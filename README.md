# Northwind ETL Pipeline Project

This project implements a complete data pipeline for the Northwind database using a modern data stack approach.

## High level solution architecture
![solution diagram](/diagram/Northwind%20ETL%20Pipleline%20Solution%20Diagram.png)

The Northwind ETL pipeline architecture leverages a combination of cloud services and data tools to create a scalable and efficient data processing system. The pipeline begins with data extraction from the Northwind Database which hosted on RDS for PostgresSQL, facilitated by Airbyte running on an Amazon EC2 instance. Airbyte efficiently extracts and loads the data into Snowflake. For data transformation, the architecture employs dbt Core, which runs within containers orchestrated by Amazon ECS with Fargate, ensuring scalable and serverless execution of transformation jobs. These containers are built from images stored in Amazon Elastic Container Registry (ECR), allowing for version control and easy deployment of the transformation logic. The transformed data resides in Snowflake, ready for analytics, while dbt artifacts and logs are securely stored in Amazon S3 for documentation and auditing purposes. To manage the scheduling of these ETL processes, Amazon EventBridge Scheduler is utilised, triggering the dbt runs at predetermined intervals. Sensitive credentials and connection strings are securely managed using AWS Secrets Manager, ensuring a high level of security throughout the pipeline. Finally, the transformed data in Snowflake connected to visualization tools Preset, completing the data pipeline from source to insights.

## Project Structure

- `data_integration/`: Contains Airbyte setup for extracting and loading data
- `data_transformation/`: Houses the dbt project for data transformation
- `data_orchestration/`: Includes AWS configurations for running and scheduling the pipeline
- `data_consumption/`: Contains Preset setup for BI consumption
- `diagram/`: Architecture diagram and ER diagram
- `screen_capture/`: Images provide visual documentation of the process.

## Configuration and Usage

### 1. Data Integration

Navigate to `data_integration/` and follow the README for setting up Airbyte on EC2 and configuring the Northwind to Snowflake connection.

### 2. Data Transformation

The `data_transformation/northwind_dbt` directory contains the dbt project. 

1. Navigate to this directory
2. Configure your `profiles.yml`
3. Run dbt: `dbt run`

For more details, see the [README](/data_transformation/README.md) in the `data_transformation/` directory.

### 3. Data Orchestration

The `data_orchestration/` directory contains screenshots and configurations for AWS services (ECR, ECS, EventBridge).

1. Build and push the Docker image to ECR
2. Set up the ECS task
3. Configure the EventBridge rule

Detailed are in the [README](/data_orchestration/AWS/README.md) within the `data_orchestration/` directory.

### 4. Data Consumption

The `data_consumption/` directory contains screenshots and configurations for Preset for data visualisation.
For more details, see the [README](/data_consumption/README.md) in the `data_consumption/` directory.