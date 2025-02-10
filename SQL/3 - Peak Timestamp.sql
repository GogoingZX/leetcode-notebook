/*
table: livestream

| user_id |   start_timestamp   |    end_timestamp    |
| ------- | ------------------- | ------------------- |
| 1000001 | 2023-01-01 11:22:31 | 2023-01-01 14:05:15 |
| ------- | ------------------- | ------------------- |
| 1000035 | 2023-01-01 14:05:13 | 2023-01-01 17:41:05 |
|   ...   |          ...        |         ...         |

Find the peak timestamp and the number of livestreamings
*/

WITH temp_tab AS (
    SELECT
        user_id
        ,start_timestamp AS timestamp
        ,1 AS tag
    FROM livestream

    UNION ALL
    SELECT
        user_id
        ,end_timestamp AS timestamp
        ,-1 AS tag
    FROM livestream

    ORDER BY 2
)

SELECT
    timestamp
    ,SUM(tag) OVER (ORDER BY timestamp) AS total_cnt
FROM temp_tab
ORDER BY 2 DESC