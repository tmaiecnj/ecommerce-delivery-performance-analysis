SELECT order_id, review_id, COUNT(*) AS combi_count
FROM order_reviews
GROUP BY order_id, review_id
HAVING COUNT(*) > 1;