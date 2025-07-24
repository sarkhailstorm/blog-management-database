-- Question 1
SELECT title FROM libuser
JOIN loan ON librarynumber = loanlibrarynumb
JOIN book ON book.isbn = loan.isbn
WHERE librarynumber = 'DDE48080622';
--OR
SELECT title FROM book 
JOIN loan ON book.isbn = loan.isbn
JOIN libuser ON librarynumber = loanlibrarynumb
WHERE librarynumber = 'DDE48080622';

-- Question 2
SELECT fname, lname FROM libuser
JOIN loan ON librarynumber = loanlibrarynumb
JOIN book ON book.isbn = loan.isbn
JOIN bookgenre ON book.isbn = bookgenre.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE genre = 'Action' AND town = 'Gosport';
--OR
SELECT CONCAT(fname,' ',lname) AS "Name", title, town, genre FROM libuser
JOIN loan ON librarynumber = loanlibrarynumb
JOIN book ON book.isbn = loan.isbn
JOIN bookgenre ON book.isbn = bookgenre.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE genre = 'Action' AND town = 'Gosport';

-- Question 3
SELECT wroteisbn FROM wrote
JOIN book ON isbn = wroteisbn
JOIN author ON author.authorid = wrote.authorid
WHERE authorfname = 'Katherine' AND authorlname = 'Maxweell';
--OR
SELECT COUNT(*) AS bookcount FROM wrote
JOIN book ON isbn = wroteisbn
JOIN author ON author.authorid = wrote.authorid
WHERE authorfname = 'Katrine' AND authorlname = 'Maxweell';

-- Question 4
SELECT edition FROM book WHERE title = 'CUSTOMER-FOCUSED IMPACTFUL ENCODING';
SELECT edition, title FROM book WHERE title = 'CUSTOMER-FOCUSED IMPACTFUL ENCODING';

-- Question 5
SELECT title, genre FROM book
JOIN bookgenre ON book.isbn = bookgenre.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE title = 'VERSATILE ZERO TOLERANCE MODERATOR';

-- Question 6
SELECT authorfname, authorlname, title FROM author
JOIN wrote ON wrote.authorid = author.authorid
JOIN book ON isbn = wroteisbn
WHERE title = 'VERSATILE ZERO TOLERANCE MODERATOR';

-- Question 7
SELECT CONCAT(authorfname,' ',authorlname) AS "Author", genre AS "Genre" FROM book
JOIN bookgenre ON book.isbn = bookgenre.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
JOIN wrote ON book.isbn = wroteisbn
JOIN author ON author.authorid = wrote.authorid
WHERE authorfname = 'Lolita' AND authorlname = 'Mityukov';

-- Question 8
SELECT CONCAT(fname,' ',lname) AS "libuser", genre FROM libuser
JOIN loan ON librarynumber = loanlibrarynumb
JOIN book ON book.isbn = loan.isbn
JOIN bookgenre ON book.isbn = bookgenre.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE fname = 'Mikel' AND lname = 'Matyas';

-- Question 9
SELECT CONCAT(authorfname,' ',authorlname) AS "author", title, isbn FROM author
JOIN wrote ON wrote.authorid = author.authorid
JOIN book ON isbn = wroteisbn
WHERE isbn = '796212789-9';

-- Question 10
SELECT CONCAT(authorfname,' ',authorlname) AS "author", title, genre FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
JOIN wrote ON book.isbn = wroteisbn
JOIN author ON author.authorid = wrote.authorid
WHERE title = 'AMELIORATED MOTIVATING LEVERAGE';

-- Question 11
SELECT CONCAT(fname,' ', lname) AS "libuser", title, genre, loanstart FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE title = 'USER-FRIENDLY INTERACTIVE CAPACITY' AND loanstart = '2020-01-04';

-- Question 12
SELECT CONCAT(authorfname,' ',authorlname) AS "Author", title AS "Book name", genre AS "Genre", 
CONCAT(fname,' ',lname) AS "Library user", loanstart AS "Date"
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE authorfname = 'Nelie' AND authorlname = 'Cheesworth';