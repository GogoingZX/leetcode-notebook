/*
Q: Write an SQL query to find all numbers that appear at least three times consecutively.

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
id is an autoincrement column.
*/

SELECT distinct
    a.num AS ConsecutiveNums
FROM (
    SELECT
        num
        ,LEAD(num, 1, NULL) over (ORDER BY id) AS next_num
        ,LAG(num, 1, NULL) over (ORDER BY id) AS last_num
    FROM Logs
) AS a
WHERE
    num = next_num
    AND num = last_num