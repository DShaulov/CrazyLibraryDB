SELECT a.FirstName, a.LastName, COUNT(bh.Id) AS count
FROM authors AS a JOIN books AS b ON a.Id = b.AuthorId JOIN bookhistories as bh ON bh.BookUniqueID = b.UniqueID
WHERE bh.Action = 'Borrow'
GROUP BY a.Id, a.FirstName, a.LastName
ORDER BY count DESC
LIMIT 100;