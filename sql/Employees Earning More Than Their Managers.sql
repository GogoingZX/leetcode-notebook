/*
Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

Q: Write an SQL query to find the employees who earn more than their managers.
*/
SELECT
    a.name AS Employee
FROM Employee AS a
JOIN Employee AS b
    ON a.managerId = b.id
    and a.salary > b.salary