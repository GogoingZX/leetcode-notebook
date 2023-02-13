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

Q: Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id.
Note that you are supposed to write a DELETE statement and not a SELECT one.
*/

DELETE FROM Person
WHERE
    id NOT IN (
        select distinct t.id
        from (
            select email, min(id) as id from Person group by email
        ) as t
    )