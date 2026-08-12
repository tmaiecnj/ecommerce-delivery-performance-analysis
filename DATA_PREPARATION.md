# Data Preparation

The Olitst dataset were loaded into PostgreSQL and checked for data quality issues before analysis.

| Issue                                       | Table    | Action                                                    |
| ------------------------------------------- | -------- | --------------------------------------------------------- |
| Delivery orders with missing delivery dates | `orders` | Excluded affected records from delivery-time calculations |
