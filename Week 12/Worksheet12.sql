-- Question 1
SELECT COUNT(*)
FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE genre.genreid = 9;
-- a AND b:
SELECT title AS "Book Title", genre AS "Book Genre", genre.genreid AS "Genre ID"
FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE genre.genreid = 9
ORDER BY title DESC;

-- Question 2
SELECT fname AS "First Name", lname AS "Last Name", title AS "Book Loaned", 
genre AS "Book Genre", genre.genreid AS "Genre ID", loanstart AS "Loan Start"
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE genre.genreid = 7;

-- Question 3
SELECT CONCAT(fname,' ',lname) AS "Library User", title AS "Book Loaned", 
genre AS "Book Genre", genre.genreid AS "Genre ID", loanstart AS "Loan Start"
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE genre.genreid = 7;

-- Question 4
SELECT lname AS "Last Name", title AS "Book Loaned", loanstart AS "Loan Start"
FROM libuser
JOIN loan ON loanlibrarynumb = librarynumber
JOIN book ON book.isbn = loan.isbn
WHERE lname = 'Khrishtafovich' AND LOWER(title) = 'diverse tertiary knowledge user';

-- Question 5
SELECT title AS "Book Title", edition AS "Edition", CONCAT(authorfname,' ',authorlname) AS "Author's Name"
FROM book
JOIN wrote ON wroteisbn = isbn
JOIN author ON author.authorid = wrote.authorid
WHERE edition = 'Second';

-- Question 6
SELECT CONCAT(authorfname,' ',authorlname) AS "Authors Of Mystery Genre", genre AS "Genre" 
FROM book
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE genre = 'Mystery';

-- Question 7
SELECT title AS "Book Title", book.isbn AS "ISBN", edition AS "Edition", loanstart AS "Loan Start"
FROM book
JOIN loan ON loan.isbn = book.isbn
WHERE edition = 'Second'
ORDER BY book.isbn DESC;

-- Question 8
SELECT title AS "Book Title", CONCAT(authorfname,' ',authorlname) AS "Author's Name"
FROM book
JOIN wrote ON wroteisbn = isbn
JOIN author ON author.authorid = wrote.authorid
WHERE authorfname = 'Lionel' AND authorlname = 'Aarons';

-- Question 9
SELECT title AS "Book Title", CONCAT(authorfname,' ',authorlname) AS "Author's Name"
FROM book
JOIN wrote ON wroteisbn = isbn
JOIN author ON author.authorid = wrote.authorid
WHERE (authorfname = 'Justina' AND authorlname = 'Lincey') 
OR (authorfname = 'Misty' AND authorlname = 'Manueli');
-- a)
SELECT title AS "Book Title"
FROM book
JOIN wrote ON wroteisbn = isbn
JOIN author ON author.authorid = wrote.authorid
WHERE (authorfname = 'Justina' AND authorlname = 'Lincey') 
OR (authorfname = 'Misty' AND authorlname = 'Manueli')
GROUP BY title HAVING COUNT(wrote.authorid) = 2; 

-- Question 10
SELECT title AS "Title", genre AS "Genre", loanstart AS "Loan Start"
FROM book
JOIN loan ON loan.isbn = book.isbn
JOIN bookgenre ON bookgenre.isbn = book.isbn
JOIN genre ON genre.genreid = bookgenre.genreid
WHERE loanstart BETWEEN '2020-03-15' AND '2020-06-30';









