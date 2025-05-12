SELECT DISTINCT
    b.title_book AS 'Название книги'
FROM 
    books b
JOIN 
    purchases p ON b.code_book = p.code_book
JOIN 
    deliveries d ON p.code_delivery = d.code_delivery
WHERE 
    d.name_company = N'ЗАО Квантор'
ORDER BY 
    b.title_book;










