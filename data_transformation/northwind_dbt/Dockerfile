FROM python:3.9-slim

WORKDIR /usr/app/dbt

# Copy dbt project files
COPY . .

# Install dependencies
RUN pip install dbt-snowflake boto3

# Set environment variable for profiles directory
ENV DBT_PROFILES_DIR=.

# Default command
CMD ["sh", "-c", "dbt run --profiles-dir . --project-dir . && python upload_artifacts.py"]

