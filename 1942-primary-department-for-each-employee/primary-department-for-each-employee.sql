SELECT employee_id
     , department_id
FROM (
    SELECT employee_id, 
           department_id, 
           primary_flag,
           COUNT(*) OVER (PARTITION BY employee_id) AS dept_cnt
    FROM Employee
) AS sub
WHERE (dept_cnt = 1) OR (dept_cnt > 1 AND primary_flag = 'Y')
