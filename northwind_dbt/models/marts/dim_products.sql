-- models/marts/dim_products.sql

select
    {{ dbt_utils.generate_surrogate_key(['p.product_id']) }} as product_key,
    p.product_id,
    p.product_name,
    p.quantity_per_unit,
    p.unit_price as product_unit_price,
    p.units_in_stock,
    p.units_on_order,
    p.reorder_level,
    p.discontinued,
    c.category_id,
    c.category_name as product_category_name,
    c.description as category_description
from {{ source('northwind', 'products') }} p
inner join {{ source('northwind', 'categories') }} c
    on p.category_id = c.category_id