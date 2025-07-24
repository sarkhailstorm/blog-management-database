-- Question
SELECT title, loan.isbn, loanstart FROM book
LEFT JOIN loan ON loan.isbn = book.isbn
WHERE loan.isbn is NULL;

-- Question 1
SELECT title AS "Title", loanstart AS "Loan Start"
FROM book
JOIN loan on loan.isbn = book.isbn
WHERE title = 'PROFIT-FOCUSED BANDWIDTH-MONITORED UTILISATION';

-- Question 2
SELECT title AS "Title", loanstart AS "Loan Start", CONCAT(authorfname,' ',authorlname) AS "Author"
FROM book
JOIN loan ON loan.isbn = book.isbn
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE authorfname = 'Aaren' AND authorlname = 'Larret';

-- Question 3
SELECT title AS "Books Not Loaned", CONCAT(authorfname,' ',authorlname) AS "Author"
FROM book
LEFT JOIN loan ON loan.isbn = book.isbn
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE authorfname = 'Aaren' AND authorlname = 'Larret' AND loan.isbn IS NULL;

-- Question 4
SELECT COUNT(title) 
FROM book;

-- Question 5
SELECT COUNT(title) 
FROM book
JOIN loan ON loan.isbn = book.isbn;


-- Question 6
SELECT COUNT(*) 
FROM book
LEFT JOIN loan ON loan.isbn = book.isbn
WHERE loan.isbn IS NULL;

-- Question 7
SELECT authorfname AS "First Name", authorlname AS "Last Name", title AS "Book Title", loanstart AS "Loan Start"
FROM book 
JOIN loan ON loan.isbn = book.isbn
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE loanstart BETWEEN '2020-05-01' AND '2020-05-31'
ORDER BY authorlname ASC;

-- Question 8
SELECT authorfname AS "F Name", authorlname AS "L Name", title AS "Title", loanstart AS "Loan Start",
datepublished AS "Published"
FROM book 
JOIN loan ON loan.isbn = book.isbn
JOIN wrote ON wroteisbn = book.isbn
JOIN author ON author.authorid = wrote.authorid
WHERE loanstart BETWEEN '2020-05-01' AND '2020-05-31'
ORDER BY datepublished;

-- Question 9
SELECT title AS "Title", genre AS "Genre"
FROM book
LEFT JOIN bookgenre ON bookgenre.isbn = book.isbn
LEFT JOIN genre ON genre.genreid = bookgenre.genreid
WHERE genre IS NULL;
-- OR
SELECT title AS "Title", genre AS "Genre"
FROM genre
JOIN bookgenre ON bookgenre.genreid = genre.genreid
RIGHT JOIN book ON book.isbn = bookgenre.isbn
WHERE genre IS NULL;

-- Question 10
SELECT COUNT(*) AS "Books Without Genre"
FROM book
LEFT JOIN bookgenre ON bookgenre.isbn = book.isbn
WHERE bookgenre.isbn IS NULL;