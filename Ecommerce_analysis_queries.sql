/*
1. AVERAGE PURCHASE FREQUENCY
Business Question: How loyal is the customer base? What is the average number of orders per customer?
Metric: Customer Retention & Engagement
*/
WITH user_order_cnt as
(
SELECT
user_id,
count(order_id) AS ttl_order_per_user
FROM `noted-phalanx-423414-j0.homework_bigquery.ecommers`
GROUP BY user_id
)
SELECT
AVG (ttl_order_per_user) AS order_avg
FROM user_order_cnt;

/*
2. REVENUE BY CATEGORIES
Business Question: Which product categories are the primary profit drivers?
Goal: To identify high-performing segments for marketing optimization and inventory planning.
*/
SELECT 
category,
round(SUM(total), 2) AS revenue_bycat
FROM `noted-phalanx-423414-j0.homework_bigquery.ecommers`
GROUP BY
category
ORDER BY revenue_bycat DESC;

/*
3. AVERAGE ORDER VALUE (AOV)
Business Question: What is the average revenue generated per single order?
Goal: This is a key performance indicator (KPI) used to evaluate sales effectiveness 
and set targets for revenue growth.
*/
SELECT
  ROUND(SUM(total) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM `noted-phalanx-423414-j0.homework_bigquery.ecommers`;

/*
4. ORDER VALUE RANGE (MIN & MAX)
Business Question: What is the range of the transaction sizes?
Goal: Identifying the 'entry-level' price point versus the 'peak' transaction size. 
Helps in distinguishing between standard customers and high-value outliers.
*/
SELECT
MIN(total) AS min_order,
MAX(total) AS max_order
FROM `noted-phalanx-423414-j0.homework_bigquery.ecommers`;

/*
5. TOP 10 HIGHEST-VALUE ORDERS
Business Question: What are the top 10 most expensive orders?
Goal: To identify the profile of the most valuable transactions. 
Analyzing these outliers helps in understanding the upper limits of the sales potential.
*/
  SELECT 
order_id,
total
FROM `noted-phalanx-423414-j0.homework_bigquery.ecommers`
ORDER BY total DESC
LIMIT 10;

/*
6. VIP ORDER FULFILLMENT CHECK
Business Question: Was the highest-value (MAX) order successfully delivered?
Goal: To monitor operational success for high-priority transactions. 
Failure to deliver a top-tier order results in maximum revenue loss and impacts VIP customer satisfaction.
*/
WITH MaxOrder AS (
    SELECT
        MAX(total) AS max_total_value
    FROM
        `noted-phalanx-423414-j0.homework_bigquery.ecommers`
)
SELECT
    t1.order_id,
    t1.total,
    t1.delivery_status,
    CASE
        WHEN t1.delivery_status = 'Delivered' THEN 'YES'
        ELSE 'No'
    END AS is_max_order_delivered
FROM
    `noted-phalanx-423414-j0.homework_bigquery.ecommers` AS t1,
    MaxOrder
WHERE
    t1.total = MaxOrder.max_total_value
    LIMIT 1;
/*
7. TOP 10 ORDERS FULFILLMENT STATUS
Business Question: What is the delivery status of the top 10 most valuable orders?
Goal: To audit the logistics performance for high-ticket transactions. 
Understanding if the biggest sales are actually reaching the customers is crucial for revenue protection.
*/
WITH RankedOrders AS (
   -- Step 1: Calculate total amount and retrieve status for each unique order
    SELECT
        order_id,
        user_id,
        MAX(delivery_status) AS final_delivery_status,
        SUM(total) AS final_order_total
    FROM
        `noted-phalanx-423414-j0.homework_bigquery.ecommers`
    GROUP BY
        order_id, user_id
)
-- Step 2: Select Top 10 orders by total value
SELECT
    order_id,
    final_order_total,
    final_delivery_status
FROM
    RankedOrders
ORDER BY
    final_order_total DESC
LIMIT 10;
