WITH quality_ratio AS (
SELECT query_name
     , ROUND(SUM(quality_ratio) / COUNT(*),2) AS quality
FROM (
    SELECT query_name
        , position
        , rating
        , rating / position AS quality_ratio
    FROM Queries
) AS sub 
GROUP BY query_name
),
poor_query AS (
SELECT total_cnt.query_name
     , CASE 
            WHEN ROUND((poor / total) * 100,2) IS NULL THEN 0 
            ELSE ROUND((poor / total) * 100,2)
       END AS poor_query_percentage
FROM (
    SELECT query_name
        , COUNT(*) AS total
    FROM Queries
    GROUP BY query_name
) AS total_cnt
LEFT JOIN (
    SELECT query_name
        , COUNT(*) AS poor
    FROM Queries
    WHERE rating < 3 
    GROUP BY query_name
) AS poor_cnt
ON total_cnt.query_name = poor_cnt.query_name
)
SELECT qr.query_name
     , quality
     , poor_query_percentage
FROM quality_ratio qr
    INNER JOIN poor_query pq ON qr.query_name = pq.query_name