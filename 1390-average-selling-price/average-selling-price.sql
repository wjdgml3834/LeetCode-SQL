-- 1. join
-- 2. select only puchase date is in between start_date and end_date
-- 3. SUB QUERY + GROUP BY -> calculate average_price

SELECT product_id
     , CASE WHEN SUM(units) !=0 THEN ROUND(SUM(total_price) / SUM(units),2) ELSE 0 END AS average_price
FROM (
    SELECT p.product_id
        , p.price
        , us.units
        , p.price * us.units AS total_price
    FROM Prices p
        LEFT JOIN UnitsSold us ON p.product_id = us.product_id
        AND us.purchase_date BETWEEN p.start_date AND p.end_date
) AS sub
GROUP BY product_id