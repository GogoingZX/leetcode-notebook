/*
- Link: https://leetcode.com/problems/product-price-at-a-given-date/description/?envType=study-plan-v2&envId=top-sql-50

- Schema:
    Table: Products
    +---------------+---------+
    | Column Name   | Type    |
    +---------------+---------+
    | product_id    | int     |
    | new_price     | int     |
    | change_date   | date    |
    +---------------+---------+
    (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
    Each row of this table indicates that the price of some product was changed to a new price at some date.

- Question:
    Write a solution to find the prices of all products on 2019-08-16.
    Assume the price of all products before any change is 10.
    Return the result table in any order.
*/

WITH dim AS (
    SELECT distinct
        product_id
    FROM Products
)

,latest_price_info AS (
    SELECT
        product_id
        ,new_price
    FROM (
        SELECT
            product_id
            ,new_price
            ,change_date
            ,row_number() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
        FROM Products
        WHERE
            change_date <= date('2019-08-16')
        )
    WHERE
        rn = 1
)

SELECT
    a.product_id
    ,COALESCE(b.new_price, 10) AS price
FROM dim AS a
LEFT JOIN latest_price_info AS b
    ON a.product_id = b.product_id