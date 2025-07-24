-- Question 1
SELECT title AS "Book Title", CONCAT(fname,' ',lname) AS "User Name", loanstart AS "Date"
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
WHERE fname = 'Aldo' AND lname = 'Fedder';

-- Question 2
SELECT title AS "Book Title", genre AS "Genre"
FROM book b
JOIN bookgenre bg ON bg.isbn = b.isbn
JOIN genre g ON g.genreid = bg.genreid
WHERE genre = 'Action';

-- Question 3
SELECT title AS "Book Title", CONCAT(fname,' ',lname) AS "User Name", loanstart AS "Date"
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
WHERE fname = 'Roy' AND lname = 'Skene' AND loanstart = '2020-06-25';

-- Question 4
SELECT CONCAT(fname,' ',lname) AS "User Name", title AS "Book Title", genre AS "Genre", loanstart AS "Date"
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
JOIN bookgenre bg ON bg.isbn = b.isbn
JOIN genre g ON g.genreid = bg.genreid
WHERE fname = 'Roy' AND lname = 'Skene' AND loanstart = '2020-06-25';

-- Question 5

-- There is no genre associated with the book that "Roy Skene" lended on '2020-06-25' in the genre table.

-- Question 6
SELECT librarynumber AS "User ID", datepublished AS "Date Published" 
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
WHERE librarynumber = 'DDE60951577';

-- Question 7
SELECT librarynumber AS "User ID", title AS "Book Title", datepublished AS "Date Published" 
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
WHERE librarynumber = 'DDE60951577';

-- Question 8
SELECT librarynumber AS "User ID", LOWER(title) AS "Book Title", datepublished AS "Date Published" 
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
WHERE librarynumber = 'DDE60951577';

-- Question 9
SELECT COUNT(*) AS "Total Books" FROM book;

-- Question 10
SELECT COUNT(*) AS "Total Books Loaned", loanstart AS "Date" 
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
WHERE loanstart = '2020-12-30'
GROUP BY loanstart;

-- Question 11
SELECT MIN(loanstart) AS "Earliest Loanstart date"
FROM loan;

-- Question 12
SELECT MAX(loanstart) AS "Latest Loanstart date"
FROM loan;

-- Question 13
SELECT MIN(loanstart) AS "First", MAX(loanstart) AS "Last"
FROM loan;

-- Question 14
SELECT CONCAT(fname,' ',mname,' ',lname) AS "User", librarynumber AS "Library Number", loanstart AS "Loan Start",
l.isbn AS "ISBN", title AS "Book Title", edition AS "Edition", CONCAT(authorfname,' ',authorlname) AS "Author",
genre AS "Genre"
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
JOIN bookgenre bg ON bg.isbn = b.isbn
JOIN genre g ON g.genreid = bg.genreid
JOIN wrote w ON wroteisbn = b.isbn
JOIN author a ON a.authorid = w.authorid
WHERE fname = 'Roxanne' AND mname = 'Iona' AND lname = 'Noakes';

-- Question 15
SELECT CONCAT(fname,' ',mname,' ',lname) AS "User Name", COUNT(*) AS "Total Books Loaned"
FROM libuser
JOIN loan l ON loanlibrarynumb = librarynumber
JOIN book b ON b.isbn = l.isbn
WHERE fname = 'Roxanne' AND mname = 'Iona' AND lname = 'Noakes'
GROUP BY fname, mname, lname;

-- Question 16
SELECT COUNT(*) AS "Books loaned in November"
FROM loan
WHERE loanstart BETWEEN '2020-11-01' AND '2020-11-31';
-- OR
SELECT COUNT(*) AS "Books loaned in November"
FROM loan
WHERE loanstart >= '2020-11-01' AND loanstart < '2020-12-01';

