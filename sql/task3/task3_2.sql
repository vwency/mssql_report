SELECT 
    DocumentID,
    DocumentNumber,
    RegistrationDate,
    AppointmentDate,
    EmployeeID,
    PositionID
FROM 
    Documents
WHERE 
    RegistrationDate BETWEEN '2023-01-01' AND '2023-06-30'; -- укажи нужный период









