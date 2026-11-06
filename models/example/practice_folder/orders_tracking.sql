WITH cte AS (
    SELECT 
        c.id AS customer_id,
        c.last_name || ' ' || c.first_name AS name,
        o.order_date,
        o.status
    FROM raw.jaffle_shop.customers c
    LEFT JOIN raw.jaffle_shop.orders o 
        ON o.user_id = c.id
)
SELECT 
    name,
    MIN(order_date) AS first_trading_date,
    MAX(order_date) AS last_trading_date,
    COUNT(order_date) AS total_orders
FROM cte
GROUP BY name
order by MIN(order_date)