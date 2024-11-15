-- models/marts/dim_geography.sql

WITH customer_locations AS (
    SELECT DISTINCT
        ship_country,
        ship_region,
        ship_city
    FROM {{ source('northwind','orders') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['ship_country', 'ship_region', 'ship_city']) }} as geography_key,
    ship_country,
    ship_region,
    ship_city
FROM customer_locations
WHERE ship_country IS NOT NULL
  AND ship_city IS NOT NULL