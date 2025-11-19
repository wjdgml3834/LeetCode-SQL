SELECT employee_id
FROM Employees 
WHERE manager_id IS NOT NULL
      AND manager_id NOT IN (SELECT employee_id FROM Employees)
      AND salary < 30000
ORDER BY 1 -- 1하면 첫번째 컬럼 기준으로 정렬하라는 뜻이다. 
