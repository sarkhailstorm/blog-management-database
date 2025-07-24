-- Question 1
SELECT CONCAT(title,' ---> ',authorfname,' ',authorlname) AS "Title And Author", genre AS "Genre"
FROM bookgenre
JOIN book ON book.isbn = bookgenre.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE genre = 'Action';

-- Question 2
SELECT DISTINCT authorfname FROM author;

-- Question 3
SELECT COUNT(authorfname) AS "Total Names"
FROM (SELECT DISTINCT authorfname FROM author) AS authorfname;

-- Question 4
SELECT COUNT(*) AS "Total Authors" 
FROM author;

-- Question 5
SELECT COUNT(mname) AS "Customers With Middle Names"
FROM libuser;

-- Question 6
SELECT CONCAT_WS(',',authorlname,authorfname) AS "Author But No Books"
FROM author
LEFT JOIN wrote ON wrote.authorid = author.authorid
WHERE wrote.authorid IS NULL;

-- Question 7
SELECT CONCAT_WS(' ',fname,mname,lname) AS "User Name", emailaddress AS "User's Email Address", 
loanstart AS "Loan Start"
FROM libuser
LEFT JOIN loan ON loanlibrarynumb = librarynumber
WHERE loan.isbn IS NULL;

-- Question 8
SELECT authorfname,authorlname 
FROM author
ORDER BY authorlname DESC;

-- Question 9
SELECT authorfname,authorlname 
FROM author
WHERE authorfname LIKE 'B%'
ORDER BY authorlname DESC;

-- Question 10
SELECT title AS "Title", genre AS "Genre"
FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
ORDER BY genre;

-- Question 11
SELECT title AS "Title", genre AS "Genre"
FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
ORDER BY genre.genreid;

-- Question 12
SELECT title AS "Title", genre AS "Genre"
FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
ORDER BY genre, title DESC;
