# 일단 뭘 해야할까?
SELECT activity_date As day
     , COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'   
GROUP BY activity_date