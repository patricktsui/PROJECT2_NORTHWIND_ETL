WITH source AS (
    SELECT * FROM {{ source('northwind', 'customers') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    customer_id,
    company_name,
    contact_name,
    contact_title,
    address as customer_address,
    city as customer_city,
    region as customer_region,
    postal_code as customer_postal_code,
    country as customer_country,
FROM source