-- Question 1
SELECT CONCAT_WS(' ',fname,lname) AS "User", librarynumber AS "Library Number", title AS "Book Title",
loanstart AS "Loan Start"
FROM libuser
RIGHT JOIN loan ON loanlibrarynumb = librarynumber
RIGHT JOIN book ON book.isbn = loan.isbn
WHERE fname = 'Carmelle' AND lname = 'Nuton';

-- Question 2
SELECT CONCAT_WS(' ',fname,lname) AS "User's Full Name"
FROM libuser
LEFT JOIN loan ON loanlibrarynumb = librarynumber
LEFT JOIN book ON book.isbn = loan.isbn
WHERE loan.isbn IS NULL;

-- Question 3
SELECT CONCAT_WS(' ',authorfname,authorlname) AS "Author's Name", genre AS "Book Genre"
FROM book b
JOIN bookgenre bg ON bg.isbn = b.isbn
JOIN genre g ON g.genreid = bg.genreid
JOIN wrote w ON wroteisbn = b.isbn
JOIN author a ON a.authorid = w.authorid
WHERE authorfname = 'Meaghan' AND authorlname = 'Beswell';

-- Question 4
SELECT CONCAT_WS(' ',fname,lname) AS "Lender's Full Name", title AS "Book Title", book.isbn AS "ISBN", 
loanstart AS "Loan Start"
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
WHERE fname = 'Ag' AND lname = 'Roncelli' AND loanstart = '2020-11-20';

-- Question 5
SELECT CONCAT_WS(' ',authorfname,authorlname) AS "Author's Name", title AS "Title"
FROM wrote w
JOIN book ON isbn = wroteisbn
JOIN author a ON a.authorid = w.authorid
WHERE LOWER(title) = 'adaptive 4th generation model';

-- Question 6
SELECT title AS "Title", loanstart AS "Loan Start"
FROM loan l
JOIN book b ON b.isbn = l.isbn
WHERE LOWER(title) = 'adaptive 4th generation model';

-- Question 7
SELECT title AS "Title",CONCAT_WS(' ',authorfname,authorlname) AS "Author",
CONCAT_WS(' ',fname,lname) AS "User", loanstart AS "Loan Start"
FROM loan l
JOIN book b ON b.isbn = l.isbn
JOIN libuser lb ON librarynumber = l.loanlibrarynumb
JOIN wrote w ON wroteisbn = b.isbn
JOIN author a ON a.authorid = w.authorid
WHERE LOWER(title) = 'adaptive 4th generation model' AND loanstart = '2020-01-28';

-- Question 8
SELECT CONCAT_WS(' ',authorfname,authorlname) AS "Author's Name", title AS "Title"
FROM book b
LEFT JOIN wrote w ON wroteisbn = isbn 
LEFT JOIN author a ON a.authorid = w.authorid
WHERE w.wroteisbn IS NULL;