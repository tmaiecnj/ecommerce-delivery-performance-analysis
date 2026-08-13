SELECT customer_unique_id, COUNT(*) AS dup_customer_unique_id
FROM customers
GROUP BY customer_unique_id
HAVING COUNT(*) > 1;