SELECT contest_id
     , ROUND((cnt / total) * 100,2) AS percentage
FROM (
    SELECT r.contest_id
        , COUNT(DISTINCT u.user_id) AS cnt
        , (SELECT COUNT(DISTINCT user_id) FROM Users) AS total
    FROM Register r
        LEFT JOIN Users u ON r.user_id = u.user_id
    GROUP BY r.contest_id
) AS sub
ORDER BY percentage DESC, contest_id ASC;