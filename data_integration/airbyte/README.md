# Airbyte-Powered Data Extraction and Loading
In this data pipeline, Airbyte, an open-source data integration platform, is hosted on an Amazon EC2 instance, serving as the central hub for data extraction and loading. The EC2 instance provides a flexible and scalable environment for running Airbyte, allowing for easy management and configuration. Airbyte is configured to connect to a PostgreSQL database hosted on Amazon RDS, which contains the Northwind dataset. Using its built-in PostgreSQL source connector, Airbyte efficiently extracts the Northwind data from Postgres. The extracted data is then seamlessly loaded into Snowflake, a cloud data warehouse, utilizing Airbyte's Snowflake destination connector. This setup enables a robust, cloud-based ETL process, efficiently moving data from the operational PostgreSQL database to the analytical Snowflake environment, setting the stage for subsequent transformation and analysis steps in the data pipeline.

The following screenshots provide visual documentation of performing full extractions, incremental extractions, Change Data Capture (CDC), and scheduling the job to run daily at 1:00 AM.

# Airbyte Connection
![Airbyte Connection](/screen_capture/Airbyte_connection.jpg)

# 2 Full Extractions
![Full sync](/screen_capture/Airbyte_full_sync.jpg)
![Full sync load](/screen_capture/Airbyte_full_sync_load.jpg)
# 3. Incremental Extractions1
# 4. Change Data Capture (CD)
# 5. Scheduling