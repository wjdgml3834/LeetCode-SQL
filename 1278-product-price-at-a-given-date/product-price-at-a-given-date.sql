SELECT p1.product_id
     , p1.new_price AS price
FROM Products p1
    INNER JOIN (
        SELECT product_id
             , MAX(change_date) AS recent_date
        FROM Products p1
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
) AS p2 
ON p1.product_id = p2.product_id AND p1.change_date = p2.recent_date
GROUP BY p1.product_id
UNION 
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN ( -- product_id 2번은 8월 16일 이전에 있었으므로 제외됨 
    SELECT product_id
    FROM Products 
    WHERE change_date <= '2019-08-16'
)

    
