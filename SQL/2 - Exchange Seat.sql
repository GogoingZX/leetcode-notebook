/*
- Link: https://leetcode.com/problems/exchange-seats/?envType=study-plan-v2&envId=top-sql-50

- Schema:
    Table: Seat
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | id          | int     |
    | student     | varchar |
    +-------------+---------+
    id is the primary key (unique value) column for this table.
    Each row of this table indicates the name and the ID of a student.
    The ID sequence always starts from 1 and increments continuously.

- Question:
    Write a solution to swap the seat id of every two consecutive students.
    If the number of students is odd, the id of the last student is not swapped.
    Return the result table ordered by id in ascending order.
*/

SELECT
    a.id
    ,COALESCE(b.student, a.student) AS student
FROM Seat AS a
LEFT JOIN (
    SELECT
        id
        ,student
        ,(CASE
            WHEN mod(id, 2) = 0 THEN id-1
            WHEN mod(id, 2) = 1 THEN id+1
            ELSE NULL
            END) AS new_id
    FROM Seat
    ) AS b
    ON a.id = b.new_id
ORDER BY a.id


-- a better solution
SELECT
    (CASE 
        WHEN id % 2 = 0 THEN id-1
        WHEN id + 1 NOT IN (select id from Seat) THEN id
        ELSE id + 1
        END) AS id
    ,student
FROM Seat
ORDER BY 1