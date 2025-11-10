-- 삼각형이 되지 못하는 조건 -> a + b <= c
-- 삼각형이 되는 조건 -> a + b > c 

-- x + y <= z or x+z <=y or y+z <= x 
-- 가장 큰 변의 길이랑 비교를 하는게 맞지 

SELECT x
     , y
     , z
     , CASE 
            WHEN x< 0 OR y< 0 OR z< 0 THEN 'No'
            WHEN x + y <= z OR x + z <= y OR y+z <= x THEN 'No' 
            ELSE 'Yes' 
        END AS triangle
FROM Triangle