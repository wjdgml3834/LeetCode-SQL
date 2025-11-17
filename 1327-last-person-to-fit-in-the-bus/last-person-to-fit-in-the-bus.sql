SELECT Name AS person_name
FROM(
    SELECT turn AS Turn
        , person_id AS ID
        , person_name AS Name
        , weight AS Weight
        , SUM(weight) OVER (ORDER BY turn) AS `Total Weight`
    FROM Queue
) AS sub
WHERE `Total Weight` <= 1000
ORDER BY `Total Weight` DESC
LIMIT 1
