/*
- Link: https://leetcode.com/problems/human-traffic-of-stadium/description

- Schema:
    Table: Stadium
    +---------------+---------+
    | Column Name   | Type    |
    +---------------+---------+
    | id            | int     |
    | visit_date    | date    |
    | people        | int     |
    +---------------+---------+
    visit_date is the column with unique values for this table.
    Each row of this table contains the visit date and visit id to the stadium with the number of people during the visit.
    As the id increases, the date increases as well.

- Question:
    Write a solution to display the records with three or more rows with consecutive id's,
    and the number of people is greater than or equal to 100 for each.
    Return the result table ordered by visit_date in ascending order.

- Examples:
    - Input:
        Stadium table:
        +------+------------+-----------+
        | id   | visit_date | people    |
        +------+------------+-----------+
        | 1    | 2017-01-01 | 10        |
        | 2    | 2017-01-02 | 109       |
        | 3    | 2017-01-03 | 150       |
        | 4    | 2017-01-04 | 99        |
        | 5    | 2017-01-05 | 145       |
        | 6    | 2017-01-06 | 1455      |
        | 7    | 2017-01-07 | 199       |
        | 8    | 2017-01-09 | 188       |
        +------+------------+-----------+
    - Output:
        +------+------------+-----------+
        | id   | visit_date | people    |
        +------+------------+-----------+
        | 5    | 2017-01-05 | 145       |
        | 6    | 2017-01-06 | 1455      |
        | 7    | 2017-01-07 | 199       |
        | 8    | 2017-01-09 | 188       |
        +------+------------+-----------+
*/

SELECT distinct
    id
    ,visit_date
    ,people
FROM (
    SELECT
        id
        ,visit_date
        ,people
        ,LAG(people, 2, NULL) OVER (ORDER BY visit_date) AS last_2
        ,LAG(people, 1, NULL) OVER (ORDER BY visit_date) AS last_1
        ,LEAD(people, 1, NULL) OVER (ORDER BY visit_date) AS next_1
        ,LEAD(people, 2, NULL) OVER (ORDER BY visit_date) AS next_2
    FROM Stadium
    )
WHERE
    (people >= 100 and next_1 >= 100 and next_2 >= 100)
    OR (people >= 100 and last_1 >= 100 and last_2 >= 100)
    OR (people >= 100 and last_1 >= 100 and next_1 >= 100)
ORDER BY 1