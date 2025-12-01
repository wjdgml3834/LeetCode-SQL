-- 1. 최대한 많은 영화를 평가한 사람을 찾기 
(
SELECT u.name AS results
FROM MovieRating mr
    INNER JOIN Users u ON mr.user_id = u.user_id
GROUP BY mr.user_id, u.name
ORDER BY COUNT(*) DESC, name ASC
LIMIT 1)
UNION ALL
#2. 2020년도에 가장 높은 평가를 받은 영화 찾기
(
SELECT m.title
FROM MovieRating mr
    INNER JOIN Movies m ON mr.movie_id = m.movie_id
WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
GROUP BY m.title
ORDER BY AVG(rating) DESC, m.title ASC
LIMIT 1 
)