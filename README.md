End-to-End Retail Analytics Dashboard
1. Overview

This project implements a complete retail analytics pipeline using Python, PostgreSQL, and Power BI to transform raw transactional data into executive-level insights.

The objective was to:

Clean and validate transactional data

Design a relational database with enforced integrity

Perform analytical SQL (CTEs, window functions, cohort logic)

Build an interactive BI dashboard

Extract actionable business insights

Dataset: Olist Brazilian E-Commerce Dataset (Kaggle)

2. Architecture

The project follows a structured data workflow:

Raw CSV Data
      ↓
Python (Pandas) – Cleaning & Transformation
      ↓
PostgreSQL – Relational Modelling & Constraints
      ↓
SQL – Analytical Queries
      ↓
Power BI – Executive Dashboard
Key Design Decisions

Explicit timestamp conversion for temporal analytics

Monetary fields stored as NUMERIC(10,2) to prevent floating-point precision errors

Primary and foreign keys manually enforced to maintain referential integrity

Analytical logic separated from BI layer for reproducibility

3. Database Schema
Tables

customers

orders

order_items

Relationships

customers (1) → (many) orders

orders (1) → (many) order_items

Integrity Constraints

Primary keys on all entity tables

Foreign keys to enforce parent-child relationships

Invalid child rows removed prior to constraint creation

This ensures consistency between orders and order items and prevents orphaned records.

4. Analytical Techniques Implemented
Revenue Analysis

Monthly revenue aggregation

Time-series grouping using DATE_TRUNC

Month-over-Month growth using LAG() window function

Customer Analytics

Customer Lifetime Value (CLV)

Repeat purchase rate calculation

Revenue concentration (Top 20 customers)

Cohort retention analysis

SQL Features Used

CTEs

Window functions

Aggregations

Join operations

Referential integrity enforcement

5. Key Business Insights

Repeat Purchase Rate: ~3%
→ Indicates low customer retention and reliance on acquisition.

Revenue Concentration: Top 20 customers contribute only ~0.81% of revenue
→ Revenue is broadly distributed; low dependency on individual customers.

Revenue Growth: Strong acceleration observed during 2017
→ Suggests expansion phase or increased acquisition activity.

Interpretation

The business model appears acquisition-heavy with limited customer lifecycle optimisation. Improving retention could significantly increase lifetime value and reduce acquisition dependency.

6. Dashboard
Executive Overview

KPI summary (Revenue, Orders, Customers, AOV)

Monthly revenue trend

Revenue by state

Interactive date slicer

Customer Analytics

Repeat rate

Top 20 CLV analysis

Revenue concentration metrics

(Insert dashboard screenshots here)

7. Technologies Used

Python (Pandas, NumPy)

PostgreSQL

SQL (CTEs, Window Functions)

Power BI (DAX, Data Modelling)

8. Reproducibility

To reproduce this project:

Run Python data cleaning scripts.

Execute SQL schema setup.

Run analytical queries.

Connect Power BI to PostgreSQL.

Load dashboard file (.pbix).
