Table: MyNumbers
+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
Find the largest single number. If there is no single number, report null.
  MYSQL CODE:
    WITH UniqueNumbers AS (SELECT num FROM MyNumbers GROUP BY 1 HAVING COUNT(num) = 1 )
    SELECT MAX(num) AS num FROM UniqueNumbers;
Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
