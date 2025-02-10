/*
- Link: https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

- Schema:
    Table: Activity
    +--------------+---------+
    | Column Name  | Type    |
    +--------------+---------+
    | player_id    | int     |
    | device_id    | int     |
    | event_date   | date    |
    | games_played | int     |
    +--------------+---------+
    (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
    This table shows the activity of players of some games.
    Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

- Quesion:
    Write a solution to report the fraction of players that logged in again on the day after the day they first logged in,
    rounded to 2 decimal places.
    In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date,
    then divide that number by the total number of players.
*/

WITH consecutive_login_info AS (
    SELECT
        player_id
        ,event_date - interval '1' day * rn + interval '1' day AS start_date
        ,COUNT(player_id) AS consecutive_login_days
    FROM (
        SELECT
            player_id
            ,event_date
            ,row_number() OVER (partition by player_id order by event_date) AS rn
        FROM Activity
        )
    GROUP BY 1, 2
    HAVING COUNT(player_id) >= 2
)

SELECT
    ROUND(CAST(COUNT(distinct CASE WHEN a.rn=1 and b.start_date is NOT NULL THEN a.player_id ELSE NULL END) as decimal) / COUNT(distinct a.player_id), 2) AS fraction
FROM (
    SELECT
        player_id
        ,event_date
        ,row_number() OVER (partition by player_id order by event_date) AS rn
    FROM Activity
    ) AS a
LEFT JOIN consecutive_login_info AS b
    ON a.player_id = b.player_id
    AND a.event_date = b.start_date