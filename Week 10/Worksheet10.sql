-- Tutor Demonstration
SELECT librarynumber AS "Library Number", lname AS "Last Name", title AS "Book Title", loanstart AS "Date"
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
WHERE loanlibrarynumb = 'DEA10399837' AND title = 'SYNCHRONISED HOMOGENEOUS NEURAL-NET';

-- Student Tasks

-- Question 1-3
SELECT isbn AS "ISBN Number", title AS "Title", CONCAT(authorfname,' ',authorlname) AS "Author"
FROM book
JOIN wrote ON wroteisbn = isbn
JOIN author ON author.authorid = wrote.authorid
WHERE author.authorid = 2100;

-- Question 4
SELECT librarynumber AS "Library Number", CONCAT(fname,' ',mname,' ',lname) AS "Full Name"
FROM libuser
WHERE librarynumber = 'DCD88988829';

-- Question 5
SELECT CONCAT(fname,' ',mname,' ',lname) AS "Full Name", COUNT(*) AS "Loans"
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
WHERE librarynumber = 'DCD88988829'
GROUP BY fname, mname, lname;

-- Question 6
SELECT fname AS "First Name", lname AS "Last Name", title AS "Title" 
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
WHERE title = 'PROFIT-FOCUSED BANDWIDTH-MONITORED UTILISATION';

-- Question 7
SELECT UPPER(fname) AS "First Name", UPPER(lname) AS "Last Name", LOWER(title) AS "Title" 
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
WHERE title = 'PROFIT-FOCUSED BANDWIDTH-MONITORED UTILISATION';

-- Question 8
SELECT UPPER(CONCAT(fname,' ',lname)) AS "User Name", LOWER(title) AS "Title Of The Book Lended" 
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
WHERE title = 'PROFIT-FOCUSED BANDWIDTH-MONITORED UTILISATION';

-- Question 10
SELECT title AS "Title", CONCAT(authorfname,' ',authorlname) AS "Author" 
FROM book
JOIN wrote ON isbn = wroteisbn
JOIN author ON author.authorid = wrote.authorid
WHERE title = 'NETWORKED ENCOMPASSING INITIATIVE';

-- Question 11
SELECT title AS "Title", genre AS "Genre", CONCAT(authorfname,' ',authorlname) AS "Author"
FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE genre = 'Anime';

--Question 12
SELECT title AS "Title", genre AS "Genre", CONCAT(authorfname,' ',authorlname) AS "Author"
FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE genre = 'Thriller' AND authorfname = 'Kinna' AND authorlname = 'Kilfoyle';

