SELECT r.contest_id
     , ROUND((COUNT(r.user_id) / u.total) * 100 ,2) AS percentage
FROM Register r
LEFT JOIN (
    SELECT user_id
        , user_name
        , COUNT(*) OVER() AS total
    FROM Users
) u 
ON r.user_id = u.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC