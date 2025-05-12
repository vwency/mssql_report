-- Insert into Positions table
INSERT INTO Positions (PositionID, PositionTitle, PositionBenefits, QualificationRequirements)
VALUES 
(1, 'Manager', 'Company car, Bonus', '5 years management experience'),
(2, 'Developer', 'Flexible hours, Remote work', 'Strong coding skills, Bachelor''s degree'),
(3, 'Analyst', 'Health insurance, Annual bonus', 'Experience with data analysis tools'),
(4, 'Director', 'Stock options, Private office', '10 years leadership experience'),
(5, 'Accountant', 'Paid certification courses', 'Accounting degree, CPA certification');

-- Insert into Employees table
INSERT INTO Employees (EmployeeID, LastName, FirstName, MiddleName, HireDate, BirthDate, Gender)
VALUES
(1, 'Ivanov', 'Ivan', 'Ivanovich', '2020-01-15', '1985-05-10', 'M'),
(2, 'Petrova', 'Maria', 'Sergeevna', '2019-03-22', '1990-11-25', 'F'),
(3, 'Sidorov', 'Alexey', 'Petrovich', '2021-05-10', '1988-07-30', 'M'),
(4, 'Kuznetsova', 'Elena', 'Vladimirovna', '2018-11-05', '1983-02-14', 'F'),
(5, 'Smirnov', 'Dmitry', 'Alexandrovich', '2022-02-18', '1995-09-20', 'M');

-- Insert into Documents table
INSERT INTO Documents (DocumentID, DocumentNumber, RegistrationDate, AppointmentDate, EmployeeID, PositionID)
VALUES
(101, 'D-2023-001', '2023-01-10', '2023-01-15', 1, 1),
(102, 'D-2023-002', '2023-02-15', '2023-02-20', 2, 2),
(103, 'D-2023-003', '2023-03-20', '2023-03-25', 3, 3),
(104, 'D-2023-004', '2023-04-05', '2023-04-10', 4, 4),
(105, 'D-2023-005', '2023-05-12', '2023-05-17', 5, 5),
(106, 'D-2023-006', '2023-06-18', '2023-06-23', 1, 2),
(107, 'D-2023-007', '2023-07-22', '2023-07-27', 2, 3),
(108, 'D-2023-008', '2023-08-30', '2023-09-04', 3, 4),
(109, 'D-2023-009', '2023-09-14', '2023-09-19', 4, 5),
(110, 'D-2023-010', '2023-10-25', '2023-10-30', 5, 1);
