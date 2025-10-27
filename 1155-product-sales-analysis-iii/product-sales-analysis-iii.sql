SELECT s.product_id
     , f.first_year
     , quantity
     , price
FROM Sales s
    INNER JOIN (
            SELECT product_id
            , MIN(year) AS first_year
            FROM Sales
            GROUP BY product_id
    ) f 
    ON s.product_id = f.product_id AND s.year = f.first_year

    
