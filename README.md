# Northwind ETL Pipeline Project

This project sets up a complete data pipeline using Airbyte for data extraction and loading, dbt for transformation, and AWS services for orchestration and scheduling.

## Project Overview

1. Airbyte (on EC2): Extracts data from the Northwind database and loads it into Snowflake
2. dbt: Transforms the raw data in Snowflake into a dimensional model
3. Docker: Containerizes the dbt project
4. AWS ECR: Stores the Docker image
5. AWS ECS: Runs the dbt transformations
6. AWS EventBridge: Schedules the pipeline runs

## Project Structure
