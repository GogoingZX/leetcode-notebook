/*
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.

Q: Write an SQL query to report all the duplicate emails.
*/

SELECT distinct
    email AS 'Email'
FROM (
    SELECT
        email
        ,COUNT(distinct id) AS id_cnt
    FROM Person
    GROUP BY 1
) AS a
WHERE
    a.id_cnt >= 2