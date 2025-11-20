-- 1. INNER JOIN 
-- 2. GROUP BY + COUNT + AVG AGE 

SELECT m.employee_id, m.name
     , COUNT(DISTINCT e.employee_id) AS reports_count
     , ROUND(SUM(e.age) / COUNT(*)) AS average_age
FROM Employees e
    INNER JOIN Employees m  ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id