SELECT c.name AS kategorie, COUNT(q.id) AS anzahl FROM Category c
JOIN Question q ON c.id = q.categoryId
GROUP BY c.name HAVING anzahl >= 300
ORDER BY anzahl DESC;