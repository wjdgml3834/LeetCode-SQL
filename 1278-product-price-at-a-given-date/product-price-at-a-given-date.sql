SELECT 
    product_id,
    CASE 
        WHEN change_date <= '2019-08-16' THEN new_price
        ELSE 10
    END AS price
FROM (
    SELECT 
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY 
                CASE WHEN change_date <= '2019-08-16' THEN 0 ELSE 1 END,
                change_date DESC
        ) AS rn
    FROM Products
) t
WHERE rn = 1
ORDER BY product_id;