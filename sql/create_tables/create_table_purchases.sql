CREATE TABLE purchases (
    code_purchase INT PRIMARY KEY,
    code_book INT,
    date_order DATETIME,
    code_delivery INT,
    type_purchase BIT,
    cost MONEY,
    amount INT,
    FOREIGN KEY (code_book) REFERENCES books(code_book),
    FOREIGN KEY (code_delivery) REFERENCES deliveries(code_delivery)
);









