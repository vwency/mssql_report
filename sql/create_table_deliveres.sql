CREATE TABLE deliveries (
    code_delivery INT PRIMARY KEY,
    name_delivery NVARCHAR(100) NOT NULL,
    name_company NVARCHAR(100),
    address NVARCHAR(200),
    phone NVARCHAR(20),
    inn NVARCHAR(20)
);


