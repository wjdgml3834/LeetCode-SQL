-- 1. group by + count + HAVING
-- 2. num is exist -> MAX(num) ELSE return NULL 

SELECT CASE WHEN num IS NOT NULL THEN MAX(num) ELSE NULL END AS num
FROM (
    SELECT num
        , COUNT(*) AS cnt
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1 
) AS sub