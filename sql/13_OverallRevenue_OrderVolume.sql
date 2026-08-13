-- What is Olist's total revenue, total number of orders, and average order value?

WITH calculated_cols AS (
    SELECT SUM(price) AS total_revenue,
        COUNT(DISTINCT order_id) AS total_orders
    FROM order_items
)
SELECT total_revenue, total_orders,
    total_revenue / total_orders AS avg_order_value
FROM calculated_cols;