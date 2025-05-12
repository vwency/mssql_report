SELECT 
    d.RegistrationDate,
    p.PositionTitle,
    e.LastName + ' ' + e.FirstName + ' ' + e.MiddleName AS FullName
FROM 
    Documents d
JOIN 
    Employees e ON d.EmployeeID = e.EmployeeID
JOIN 
    Positions p ON d.PositionID = p.PositionID
WHERE 
    d.RegistrationDate BETWEEN '2023-01-01' AND '2023-06-30'; -- укажи нужный период









