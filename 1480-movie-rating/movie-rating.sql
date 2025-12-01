WITH user_rating AS (
    SELECT mr.user_id, u.name
         , COUNT(*) AS rating_num
    FROM MovieRating mr
        INNER JOIN Users u ON mr.user_id = u.user_id
    GROUP BY mr.user_id, u.name
),
movie_rating AS (
    SELECT mr.movie_id, m.title
         , AVG(rating) AS avg_rating
    FROM MovieRating mr
        INNER JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id, m.title
)
(
    SELECT name AS results
    FROM user_rating
    WHERE rating_num = (SELECT MAX(rating_num) FROM user_rating)
    ORDER BY name ASC
    LIMIT 1 
)
UNION ALL 
(
    SELECT title AS results
    FROM movie_rating
    WHERE avg_rating = (SELECT MAX(avg_rating) FROM movie_rating)
    ORDER BY title ASC
    LIMIT 1 
)
