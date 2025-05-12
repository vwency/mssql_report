-- Create Positions table
CREATE TABLE Positions (
    PositionID INT PRIMARY KEY,
    PositionTitle NVARCHAR(100) NOT NULL,
    PositionBenefits NVARCHAR(255),
    QualificationRequirements NVARCHAR(255)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    MiddleName NVARCHAR(50),
    HireDate DATE NOT NULL,
    BirthDate DATE NOT NULL,
    Gender NVARCHAR(1) CHECK (Gender IN ('M', 'F'))
);

-- Create Documents table
CREATE TABLE Documents (
    DocumentID INT PRIMARY KEY,
    DocumentNumber NVARCHAR(20) NOT NULL,
    RegistrationDate DATE NOT NULL,
    AppointmentDate DATE NOT NULL,
    EmployeeID INT NOT NULL,
    PositionID INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);
