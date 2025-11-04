SELECT product_id
     , CASE WHEN SUM(units) IS NOT NULL THEN ROUND(SUM(total_price) / SUM(units),2) ELSE 0 END AS average_price
FROM (
    SELECT p.product_id
        , p.price
        , u.units
        , price * units AS total_price
    FROM Prices p
        LEFT JOIN UnitsSold u ON p.product_id = u.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date
) sub
GROUP BY product_id