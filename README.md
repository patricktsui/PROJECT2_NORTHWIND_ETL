# Northwind ETL Pipeline Project

This project implements a complete data pipeline for the Northwind database using a modern data stack approach.

## High level solution architecture
![ssolution diagram](/docs/Northwind%20ETL%20Pipleline%20Solution%20Diagram.png)

## Project Structure

- `data_integration/`: Contains Airbyte setup for extracting and loading data
- `data_transformation/`: Houses the dbt project for data transformation
- `data_orchestration/`: Includes AWS configurations for running and scheduling the pipeline
- `docs/`: Detailed documentation about the project
- `tests/`: Integration and unit tests for the pipeline components

## Setup and Usage

### 1. Data Integration

Navigate to `data_integration/` and follow the README for setting up Airbyte on EC2 and configuring the Northwind to Snowflake connection.

### 2. Data Transformation

The `data_transformation/` directory contains our dbt project. 

1. Navigate to this directory
2. Install dependencies: `pip install -r requirements.txt`
3. Configure your `profiles.yml`
4. Run dbt: `dbt run`

For more details, see the README in the `data_transformation/` directory.

### 3. Data Orchestration

The `data_orchestration/` directory contains scripts and configurations for AWS services (ECR, ECS, EventBridge).

1. Build and push the Docker image to ECR
2. Set up the ECS task
3. Configure the EventBridge rule

Detailed instructions are in the README within the `data_orchestration/` directory.

## Documentation

Refer to the `docs/` directory for detailed information about:

- Overall architecture (`architecture.md`)
- Pipeline overview (`pipeline_overview.md`)
- Maintenance procedures (`maintenance.md`)
