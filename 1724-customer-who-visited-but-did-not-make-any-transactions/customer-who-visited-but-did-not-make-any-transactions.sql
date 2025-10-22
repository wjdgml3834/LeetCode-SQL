-- 1. GROUP BY + CASE WHEN -> COUNT 1 ELSE 0 -> SUM
SELECT customer_id
     , SUM(CASE WHEN t.transaction_id IS NULL THEN 1 ELSE 0 END) AS count_no_trans
FROM Visits v
    LEFT JOIN Transactions t ON v.visit_id = t.visit_id
GROUP BY customer_id
HAVING count_no_trans != 0 
