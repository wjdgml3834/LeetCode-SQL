WITH fl AS (
     SELECT player_id
            , MIN(event_date) AS first_login
     FROM Activity
     GROUP BY player_id
),
joined AS (
    SELECT fl.player_id
         , CASE WHEN a.event_date IS NOT NULL THEN 1 ELSE 0 END AS logged_again
    FROM fl
        LEFT JOIN Activity a ON fl.player_id = a.player_id AND DATE_ADD(fl.first_login, INTERVAL 1 DAY) = a.event_date
)
SELECT ROUND(SUM(logged_again) / COUNT(*),2) AS fraction
FROM joined
