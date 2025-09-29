SELECT P.product_id, 
       CASE WHEN SUM(units) != 0 
            THEN ROUND(SUM(price * units) / SUM(units), 2) 
            ELSE 0 
       END AS average_price
FROM Prices P
    LEFT JOIN UnitsSold US ON P.product_id = US.product_id
      AND US.purchase_date >= P.start_date 
      AND US.purchase_date <= end_date
GROUP BY P.product_id;
