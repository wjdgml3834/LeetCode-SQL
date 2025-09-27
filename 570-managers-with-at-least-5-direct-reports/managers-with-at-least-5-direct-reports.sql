SELECT e1.name
FROM Employee e1
    INNER JOIN (
        SELECT managerId
        FROM Employee
        WHERE managerId IS NOT NULL
        GROUP BY managerId
        HAVING COUNT(*) >= 5
    ) AS e2
    ON e1.id = e2.managerId