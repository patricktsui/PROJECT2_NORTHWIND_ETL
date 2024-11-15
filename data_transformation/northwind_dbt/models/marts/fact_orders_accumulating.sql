-- models/marts/fact_order_accumulating.sql

WITH fact_orders AS (
    SELECT * FROM {{ ref('fact_orders') }}
),

order_summary AS (
    SELECT
        order_id,
        customer_key,
        MIN(order_date) AS order_date,
        MIN(required_date) AS required_date,
        MAX(shipped_date) AS shipped_date,
        SUM(revenue) AS total_amount,
        COUNT(DISTINCT product_key) AS total_products
    FROM fact_orders
    GROUP BY order_id, customer_key
)

SELECT
    order_id,
    customer_key,
    order_date,
    required_date,
    shipped_date,
    total_amount,
    total_products,
    -- Calculate time spent in each stage
    DATEDIFF(day, order_date, required_date) AS days_to_required_date,
    DATEDIFF(day, order_date, shipped_date) AS days_to_ship,
    CASE 
        WHEN shipped_date IS NOT NULL AND required_date IS NOT NULL 
        THEN DATEDIFF(day, shipped_date, required_date) 
        ELSE NULL 
    END AS days_early_or_late
FROM order_summary