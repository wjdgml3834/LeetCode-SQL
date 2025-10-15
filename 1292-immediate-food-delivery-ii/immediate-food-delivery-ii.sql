WITH delivery_category AS ( -- immediate, scheduled 구분 테이블 
    SELECT CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS delivery_status
         , customer_id
         , order_date
    FROM Delivery
),
first_order AS ( -- 고객 id별 첫 주문인지 판단 테이블 
    SELECT customer_id 
         , MIN(order_date) AS min_date
    FROM Delivery
    GROUP BY customer_id
)
SELECT ROUND(SUM(CASE WHEN delivery_status = 'immediate' THEN 1 ELSE 0 END) / COUNT(*) * 100 ,2) AS immediate_percentage
FROM delivery_category dc
    INNER JOIN first_order fo ON dc.customer_id = fo.customer_id AND dc.order_date = fo.min_date 