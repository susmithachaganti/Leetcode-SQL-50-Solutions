Table: Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
Table: Product
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
  MY SQL CODE:
    SELECT DISTINCT c.customer_id FROM Customer c
    JOIN Product p ON c.product_key = p.product_key GROUP BY c.customer_id
    HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) FROM Product);
Input: 
Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+
Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+
Output: 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
