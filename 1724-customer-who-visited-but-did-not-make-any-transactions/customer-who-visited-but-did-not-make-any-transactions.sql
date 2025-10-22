-- 2. COUNT(*) - COUNT(transaction_id) -> only null
SELECT v.customer_id
     , COUNT(*) - COUNT(t.transaction_id) AS count_no_trans
FROM Visits v
    LEFT JOIN Transactions t ON v.visit_id = t.visit_id
GROUP BY v.customer_id
HAVING count_no_trans != 0 

