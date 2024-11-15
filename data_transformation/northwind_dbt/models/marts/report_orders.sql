-- models/marts/report_orders.sql

select
    {{ dbt_utils.star(from=ref('fact_orders'), relation_alias='fact_orders', except=[
        "product_key", "customer_key", "ship_address_key", "order_date_key", "ship_country", "ship_region", "ship_city"
    ]) }},
    {{ dbt_utils.star(from=ref('dim_products'), relation_alias='dim_products', except=["product_key"]) }},
    {{ dbt_utils.star(from=ref('dim_customers'), relation_alias='dim_customers', except=["customer_key"]) }},
    {{ dbt_utils.star(from=ref('dim_geography'), relation_alias='dim_geography', except=["geography_key"]) }},
    {{ dbt_utils.star(from=ref('dim_dates'), relation_alias='dim_dates', except=["date_day"]) }}
from {{ ref('fact_orders') }} as fact_orders
left join {{ ref('dim_products') }} as dim_products on fact_orders.product_key = dim_products.product_key
left join {{ ref('dim_customers') }} as dim_customers on fact_orders.customer_key = dim_customers.customer_key
left join {{ ref('dim_geography') }} as dim_geography on fact_orders.ship_address_key = dim_geography.geography_key
left join {{ ref('dim_dates') }} as dim_dates on fact_orders.order_date = dim_dates.date_day
