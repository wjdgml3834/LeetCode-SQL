SELECT ROUND(SUM(CASE WHEN DATEDIFF(order_date,customer_pref_delivery_date) = 0 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) 
AS immediate_percentage
FROM (
    SELECT *
        , ROW_NUMBER () OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
) AS sub
WHERE rn = 1