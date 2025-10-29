SELECT CASE WHEN num IS NOT NULL THEN MAX(num) ELSE NULL END AS num
FROM (
    SELECT num
        , COUNT(*) AS cnt
    FROM MyNumbers
    GROUP BY num
    HAVING cnt = 1 
) AS sub