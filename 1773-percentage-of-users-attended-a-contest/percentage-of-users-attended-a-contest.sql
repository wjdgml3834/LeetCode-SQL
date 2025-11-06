-- 2. window function to get total numbers of users

SELECT r.contest_id
     , ROUND(COUNT(DISTINCT r.user_id) /  u.total_user * 100 ,2) AS percentage
FROM (
    SELECT user_id
         , user_name
         , COUNT(*) OVER () AS total_user
    FROM Users
) AS u 
    INNER JOIN Register r ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;

