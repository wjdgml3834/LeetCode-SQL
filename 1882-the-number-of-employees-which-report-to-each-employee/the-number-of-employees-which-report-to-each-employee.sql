SELECT rt.reports_to AS employee_id
     , e.name
     , COUNT(*) AS reports_count
     , ROUND(AVG(rt.age)) AS average_age
FROM(
    SELECT reports_to
         , age
    FROM Employees
    WHERE reports_to IN (SELECT employee_id FROM Employees)
) AS rt
INNER JOIN Employees e ON rt.reports_to = e.employee_id
GROUP BY rt.reports_to, e.name
ORDER BY employee_id