SELECT *
FROM purchases
WHERE date_order >= DATEADD(YEAR, -2, GETDATE())
ORDER BY date_order DESC;







