-- 1. quality
WITH query_quality AS (
SELECT query_name
     , ROUND(SUM(rating / position) / COUNT(*),2) AS quality
FROM Queries
GROUP BY query_name
),
-- 2. poor_query_percentage
poor_query AS (
SELECT query_name
     , ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100/ COUNT(*),2) AS poor_query_percentage 
FROM Queries
GROUP BY query_name
) 
SELECT qq.query_name
     , qq.quality
     , pq.poor_query_percentage
FROM query_quality qq
    INNER JOIN poor_query pq ON qq.query_name = pq.query_name
