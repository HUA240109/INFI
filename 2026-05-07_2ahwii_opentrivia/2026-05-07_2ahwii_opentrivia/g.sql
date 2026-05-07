SELECT q.question, a.answer FROM Question q
JOIN Difficulty d ON q.difficultyId = d.id
JOIN Category c ON q.categoryId = c.id
JOIN Answer a ON q.correct_answer_id = a.id
WHERE d.level = 'easy' AND c.name = 'Sports'
ORDER BY q.question ASC LIMIT 5;