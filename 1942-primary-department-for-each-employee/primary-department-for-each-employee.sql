-- FIRST WAY: divide -> UNION ALL 

-- 1. employee who has only unuique department
(
SELECT employee_id
      , MAX(department_id) AS department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1 
)
UNION ALL

(
-- 2. multiple department
SELECT employee_id
     , department_id
FROM Employee
WHERE primary_flag = 'Y'
)