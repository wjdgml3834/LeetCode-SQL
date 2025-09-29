SELECT product_id
     , CASE 
            WHEN units IS NULL THEN 0
            ELSE ROUND((SUM(price_products) / SUM(units)),2) 
       END AS average_price
FROM (
    SELECT p.product_id
        , p.price
        , u.units
        , p.price * u.units AS price_products
    FROM Prices p
        LEFT JOIN UnitsSold u ON p.product_id = u.product_id
    WHERE (u.purchase_date BETWEEN p.start_date AND p.end_date) OR units IS NULL 
    ORDER BY p.product_id, p.start_date
) AS sub
GROUP BY product_id
