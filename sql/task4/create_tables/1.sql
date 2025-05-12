CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Position NVARCHAR(100),
    Department NVARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

CREATE TABLE History (
    EmployeeID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Position NVARCHAR(100),
    Department NVARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    Removed BIT,
    DeletionDate DATETIME
);
