-- models/marts/fact_orders.sql

with orders as (
    select
        order_id,
        customer_id,
        employee_id,
        ship_via,
        order_date,
        required_date,
        shipped_date,
        freight,
        ship_name,
        ship_address,
        ship_city,
        ship_region,
        ship_postal_code,
        ship_country
    from {{ source('northwind', 'orders') }}
),

order_details as (
    select
        order_id,
        product_id,
        unit_price,
        quantity,
        discount,
        unit_price * quantity * (1 - discount) as revenue
    from {{ source('northwind', 'order_details') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['od.order_id', 'od.product_id']) }} as order_detail_key,
    {{ dbt_utils.generate_surrogate_key(['o.customer_id']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['o.employee_id']) }} as employee_key,
    {{ dbt_utils.generate_surrogate_key(['od.product_id']) }} as product_key,
    {{ dbt_utils.generate_surrogate_key(['o.ship_via']) }} as shipper_key,
    {{ dbt_utils.generate_surrogate_key(['o.ship_country', 'o.ship_region', 'o.ship_city']) }} as ship_address_key,
    o.order_id,
    o.order_date,
    o.required_date,
    o.shipped_date,
    o.freight,
    od.unit_price as order_unit_price,
    od.quantity as order_quantity,
    od.discount,
    od.revenue,
    o.ship_country,
    o.ship_region,
    o.ship_city
from order_details od
inner join orders o on od.order_id = o.order_id