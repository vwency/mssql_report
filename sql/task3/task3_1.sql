SELECT 
    e.EmployeeID,
    e.LastName,
    e.FirstName,
    e.MiddleName,
    p.PositionTitle
FROM 
    Employees e
JOIN 
    Documents d ON e.EmployeeID = d.EmployeeID
JOIN 
    Positions p ON d.PositionID = p.PositionID
WHERE 
    p.PositionTitle = 'Manager'; -- здесь указываешь нужную должность
