CREATE TABLE books (
    code_book INT PRIMARY KEY,
    title_book NVARCHAR(200) NOT NULL,
    code_author INT,
    pages INT,
    code_publish INT,
    FOREIGN KEY (code_author) REFERENCES authors(code_author),
    FOREIGN KEY (code_publish) REFERENCES publishing_house(code_publish)
);







