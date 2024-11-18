# Data Transformation by dbt Core
In this data pipleline, it use dbt Core to transforme the raw Northwind transactional data in Snowflake into a dimensional model, creating fact and dimension tables in the Marts schema. The process involved writing SQL models in dbt to transdform the data from its original form into a star schema, optimized for analytical queries. It is created dimension tables for customers, products, geography, and dates. The fact_orders table was constructed to hold transactional data, with foreign keys linking to the dimension tables. This transformation process cleaned the data, applied business logic, and structured it for efficient querying and reporting. The resulting model enables easier analysis of sales performance across various dimensions like time, product categories, and customer segments.

## List of tables created:

dim_customers
dim_products
dim_geography
dim_dates
fact_orders
fact_orders_accumulating (accumulating fact table)
report_orders (i.e. one big table)



[Insert ER Diagram Here]
Caption: Entity-Relationship diagram showing the star schema with fact_orders at the center, connected to dimension tables (dim_customers, dim_products, dim_employees, dim_dates) via foreign key relationships.