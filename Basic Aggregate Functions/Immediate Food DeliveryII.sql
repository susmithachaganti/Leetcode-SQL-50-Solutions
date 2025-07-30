Table: Delivery
+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
  MYSQL CODE:
        WITH FirstOrders AS ( SELECT customer_id, MIN(order_date) AS first_order_date FROM Delivery GROUP BY customer_id),
       ImmediateFirstOrders AS (  SELECT d.customer_id FROM Delivery d JOIN FirstOrders fo ON d.customer_id = fo.customer_id AND d.order_date = fo.first_order_date 
       WHERE d.order_date = d.customer_pref_delivery_date)SELECT ROUND( (COUNT(DISTINCT i.customer_id) * 100.0) / (SELECT COUNT(DISTINCT customer_id) FROM FirstOrders),
        2 ) AS immediate_percentage FROM  ImmediateFirstOrders i;
Input: 
Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-12                  |
| 4           | 3           | 2019-08-24 | 2019-08-24                  |
| 5           | 3           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
| 7           | 4           | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+
Output: 
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00                |
+----------------------+
