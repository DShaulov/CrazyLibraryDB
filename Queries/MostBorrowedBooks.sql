SELECT b.Title, COUNT(bh.BookUniqueID) AS count
FROM books AS b JOIN bookhistories AS bh ON b.UniqueID = bh.BookUniqueID
WHERE bh.Action = 'Borrow'
GROUP BY bh.BookUniqueID
ORDER BY count DESC
LIMIT 100;