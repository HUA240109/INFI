SELECT d.level AS difficulty, COUNT(q.id) AS anzahl FROM Difficulty d 
JOIN Question q ON d.id = q.difficultyId 
GROUP BY d.level ORDER BY anzahl DESC;