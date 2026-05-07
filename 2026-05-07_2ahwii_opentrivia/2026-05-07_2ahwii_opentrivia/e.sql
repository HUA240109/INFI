SELECT q.question, a.answer FROM Question q
JOIN Difficulty d ON q.difficultyId = d.id
JOIN Category c ON q.categoryId = c.id
JOIN Answer a ON q.correct_answer_id = a.id
WHERE d.level = 'hard' AND c.name = 'Science: Gadgets'
ORDER BY q.question ASC;