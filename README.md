# Olist E-Commerce: Delivery Performance & Revenue Analysis

![Data Analysis](https://img.shields.io/badge/Data%20Analysis-00599C?style=for-the-badge)
![Data Visualization](https://img.shields.io/badge/Data%20Visualization-00599C?style=for-the-badge)
![Data Modeling](https://img.shields.io/badge/Data%20Modeling-00599C?style=for-the-badge)
![ETL](https://img.shields.io/badge/ETL-00599C?style=for-the-badge)

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge)
![DAX](https://img.shields.io/badge/DAX-7F8C8D?style=for-the-badge)

_Description_

---

## Business Problem:

> Customer satisfaction has been inconsistent and delivery performance may be one of the key factors affecting customer reviews. This analysis aims to understand how delivery times, seller performance and product categories relate to customer satisfaction, while also identifying where revenue is concentrated and which areas are growing.

## Objective:

Analyze order, delivery, payment and review data to identify what drives customer satisfaction and revenue performance across sellers, product categories and geographic regions and recommend where Olist should focus operational and commercial investment.

## Dataset:

- **Source:** [Kaggle - Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Size:** ~100,000 orders, 2016-2018
- **Tables:** 9 (customers, orders, order payments, order reviews, products, product category translation, sellers, order items, geolocation)
- **_Note:_** _2016 (4 months) and 2018 (10 months) are partial years - see [Data Profiling](./DATA_PROFILING.md)_

## Database Schema

_A relational database connecting customers, orders, products, sellers, payments, and reviews for analyzing sales, delivery performance, and customer satisfaction._

![ERD E-Commerce Database Schema](./images/erd.png)

## Data Profiling & Cleaning

Seven data quality checks were performed during import and profiling, each analyze the root cause:

1.
2.
3.
4.
5.
6.
7.

_Documented in: [Data Profiling](./DATA_PROFILING.md)_

## Business Questions Answered

- What is Olist's total revenue, order volume and average order value?
- How do customers prefer to pay, and does payment method affect order value?
- What does the review score distribution look like?
- Which product categories generate the most revenue?
- Does late delivery correlate with lower review scores?
- Are high-revenue categories also highly-rated?
- Which sellers drive the most business?
- Which states generate the most revenue and experience the slowest deliveries?
