SELECT c.Passport, c.FirstName, c.LastName, c.Email,
    c.PhoneNumber,b.UniqueID, b.Title, bh.DateTime AS BorrowDate, DATEDIFF(CURRENT_DATE(), bh.DateTime) AS DaysOverdue
FROM bookhistories AS bh JOIN customers AS c ON bh.CustomerPassport = c.Passport JOIN books AS b ON bh.BookUniqueID = b.UniqueID
WHERE bh.Action = 'Borrow'
	AND NOT EXISTS (
        SELECT 1 
        FROM bookhistories AS ret 
        WHERE ret.BookUniqueID = bh.BookUniqueID 
        AND ret.CustomerPassport = bh.CustomerPassport
        AND ret.Action = 'Return'
        AND ret.DateTime > bh.DateTime
    )
    AND DATEDIFF(CURRENT_DATE(), bh.DateTime) > 30
ORDER BY DaysOverdue DESC;