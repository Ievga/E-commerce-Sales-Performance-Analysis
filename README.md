# E-commerce-Sales-Performance-Analysis

# Project Overview
This project focuses on analyzing sales data from an e-commerce platform. Using for data extraction, cleaning, interactive visualization **Google Sheets**, for analysis **SQL**. 
I transformed raw transactional data into actionable business insights.

## Dataset Structure
The analysis was performed on a dataset containing:
* **Transaction Info:** `order_id`, `order_date`, `payment_method`.
* **Product Info:** `product_id`, `category`, `price`, `quantity`, `discount`.
* **Customer Info:** `user_id`, `country`, `device`.
* **Financials:** `total` (revenue per order).

## Tech Stack & Methodology:

### 1. Data Analysis with SQL. [View Ecommerce_analysis_queries.sql](https://github.com/Ievga/E-commerce-Sales-Performance-Analysis/blob/main/Ecommerce_analysis_queries.sql)
The data was processed in BigQuery using  CTEs, and conditional logic. You can find the source code in analysis_queries.sql.
I developed a series of SQL queries to extract business metrics. The analysis includes identifying high-priority orders, performance tracking for VIP transactions, a
nd category-level revenue breakdowns.
* **Customer Loyalty (Retention):** Metric: Average Purchase Frequency. Business Value: Calculated how often customers return to the store. This helps in estimating Customer Lifetime Value (LTV).
* **Revenue Analysis:** Metric: Revenue by Category & Top 10 Orders. Business Value: Identified primary profit drivers. Analyzing top-tier transactions helps understand the profile of high-value customers.
* **Order Value Analysis:** Metrics: AOV (Average Order Value), Min/Max Order Value. Business Value: Defined the "standard" transaction size and identified outliers, allowing for better
* budget segmentation in marketing.
* **Logistics:** Metric: VIP Order Fulfillment Status.Business Value: Used CTEs and CASE statements to audit if high-priority (MAX value) orders were successfully delivered, ensuring revenue protection for the most critical transactions.

### 2. Interactive Dashboard (Google Sheets). [View Interactive Dashboard in Google Sheets](https://docs.google.com/spreadsheets/d/1y7j16Gm1QskmNCaUqLkg_CzXmyywo6wYNAMmhDONb8o/edit?usp=sharing)
 * **Revenue Contribution by Product Category:** Pie charts showing sales across product categories. Business Value: Helps identify "hero" categories that drive the business and low-performing ones that might need marketing support or inventory adjustment. Insight: there is no leader, contribution of the categories almost equal.
* **Monthly Revenue Trend** Bar chart demonstrating the total revenue month-over-month to identify seasonal patterns. Business Value: identifying high and low seasons (e.g., holiday peaks or summer drops) allows the business to optimize marketing spend and manage inventory more effectively. Insight: The business shows no clear signs of seasonality.
* **Order Status Distribution (Percentage):** Pie chart represents the proportional breakdown of all orders by their current fulfillment stage (Delivered, Returned, Cancelled, Pending). Business Value: Provides a high-level view of operational health. A high percentage of "Delivered" orders indicates a healthy supply chain, while a spike in "Cancelled" or "Returned" orders serves as an early warning signal to investigate product quality or delivery issues. Insight: investigation of product quality or delivery issues definitely need.
* **Total Profit by Country (Fulfilled Orders)** Bar  chart comparing geographical profitability by calculating the net profit from successfully delivered orders across different regions. Business Value: Highlights the most profitable markets. This helps in prioritizing logistics and localized marketing efforts in high-margin countries. Insight: no region stands out sagnificantly. India's contribution is slightly
higher.
* **Automation:** Used `ARRAYFORMULA` and **Pivot Tables** for automated data processing.
