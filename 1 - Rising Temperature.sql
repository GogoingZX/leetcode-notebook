/*
Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
*/

SELECT distinct
    today.id
FROM Weather AS today
JOIN Weather AS yesterday
    ON today.recordDate = (yesterday.recordDate + interval '1' day)
WHERE
    today.temperature > yesterday.temperature


-- It works ONLY IF the date is continuous
SELECT distinct
    id
FROM (
    SELECT
        id
        ,recordDate
        ,temperature
        ,LAG(temperature, 1, NULL) OVER (ORDER BY recordDate) AS temperature_ytd 
    FROM Weather
    )
WHERE
    temperature > temperature_ytd