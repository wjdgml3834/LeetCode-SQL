-- 1. group by + count + HAVING
-- 2. num is exist -> MAX(num) ELSE return NULL 
-- 3. MORE EASIEST WAY 

SELECT MAX(num) AS num 
FROM (
    SELECT num
        , COUNT(*) AS cnt
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1 
) AS sub