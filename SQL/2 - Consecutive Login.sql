/*--------------------------------------------------------------------------------------------------
- Question:
    Find the users who have logged in for at least 3 consecutive days

- Table Example: login_tab
    + ------- + --------- + ---------- +
    | user_id | user_name | login_date |
    + ------- + --------- + ---------- +
    |  10001  |    Tom    | 2022-01-01 |
    + ------- + --------- + ---------- +
    |  10001  |    Tom    | 2022-01-02 |
    + ------- + --------- + ---------- +
    |  10002  |   Jerry   | 2022-01-04 |
    + ------- + --------- + ---------- +
    |   ...   |    ...    |    ....    |
    + ------- + --------- + ---------- +

--------------------------------------------------------------------------------------------------*/

WITH login_info AS (
    SELECT
        user_id
        ,user_name
        ,login_date
        ,date_sub(login_date, rn) AS refer_date
    FROM (
        SELECT
            user_id
            ,user_name
            ,login_date
            ,row_number() OVER (partition by user_id order by login_date) AS rn
        FROM login_tab
        )
)

SELECT distinct
    user_id
    ,user_name
FROM (
    SELECT
        user_id
        ,user_name
        ,refer_date + interval '1' day AS consecutive_login_start_date
        ,COUNT(refer_date) AS consecutive_login_days
    FROM login_info
    GROUP BY 1, 2, 3
    )
WHERE
    consecutive_login_days >= 3