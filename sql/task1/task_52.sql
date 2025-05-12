SELECT 
    name_author AS 'Автор',
    DATEDIFF(YEAR, birthday, GETDATE()) AS 'Возраст'
FROM 
    authors
WHERE 
    DATEDIFF(YEAR, birthday, GETDATE()) < 
    (SELECT AVG(DATEDIFF(YEAR, birthday, GETDATE())) 
     FROM authors)
ORDER BY 
    name_author;









