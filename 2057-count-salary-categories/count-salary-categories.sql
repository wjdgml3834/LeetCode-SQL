SELECT temp_category.category
     , COUNT(DISTINCT main_category.account_id) AS accounts_count
FROM(
    SELECT 'High Salary' AS category
    UNION ALL
    SELECT 'Low Salary'
    UNION ALL
    SELECT 'Average Salary'
) AS temp_category
LEFT JOIN (
    SELECT account_id
         , income
         , CASE 
                WHEN income  < 20000 THEN 'Low Salary'
                WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
                WHEN income > 50000 THEN 'High Salary'
         END AS category
    FROM Accounts
) AS main_category
ON temp_category.category = main_category.category
GROUP BY temp_category.category