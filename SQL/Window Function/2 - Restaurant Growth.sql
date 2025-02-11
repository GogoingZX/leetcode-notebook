/*
- Link: https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50

- Schema:
    Table: Customer
    +---------------+---------+
    | Column Name   | Type    |
    +---------------+---------+
    | customer_id   | int     |
    | name          | varchar |
    | visited_on    | date    |
    | amount        | int     |
    +---------------+---------+
    In SQL,(customer_id, visited_on) is the primary key for this table.
    This table contains data about customer transactions in a restaurant.
    visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
    amount is the total paid by a customer.

- Question:
    You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
    Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before).
    average_amount should be rounded to two decimal places.
    Return the result table ordered by visited_on in ascending order.
*/

-- https://learnsql.com/blog/sql-window-functions-rows-clause/
SELECT
    visited_on
    ,ROUND(SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS amount
    ,ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM (
    SELECT
        visited_on
        ,SUM(amount) AS amount
    FROM Customer
    GROUP BY 1
    ORDER BY 1
    )
ORDER BY 1
OFFSET 6