-- Database Name : lib20

-- Question 1
SELECT COUNT(loan.isbn)
FROM loan;

-- Question 2
SELECT COUNT(DISTINCT loan.isbn)
FROM loan;

-- Question 3
SELECT loanstart AS "Latest Loan Start Date" 
FROM loan
ORDER BY loanstart DESC
LIMIT 1;

-- Question 4
SELECT COUNT(isbn)
FROM loan
WHERE loanstart = '2020-12-30';

-- Question 5
SELECT title AS "Book Title", loanstart AS "Loan Start"
FROM Book
JOIN loan ON loan.isbn = book.isbn
WHERE loanstart BETWEEN '2020-10-04' AND '2020-10-10';

-- Question 6
SELECT COUNT(*) AS "Total Books"
FROM (SELECT title AS "Book Title", loanstart AS "Loan Start"
FROM book
JOIN loan ON loan.isbn = book.isbn
WHERE loanstart BETWEEN '2020-10-04' AND '2020-10-10') AS total;

-- Database Name : lib21

-- Question 8
SELECT CONCAT_WS(' ',authorfname,authorlname) AS "Author", title AS "Book Title"
FROM wrote w
JOIN book ON isbn = wroteisbn
JOIN author a ON a.authorid = w.authorid
WHERE LOWER(title) = 'de-engineered zero tolerance graphic interface';

-- Question 9
SELECT title AS "Book Title", COUNT(loanstart) AS "Total Loans"
FROM book
LEFT JOIN loan ON loan.isbn = book.isbn
WHERE title ILIKE 'De-engineered Zero Tolerance Graphic Interface%'
GROUP BY title;


-- Question 10
SELECT CONCAT_WS(' ',fname,mname,lname) AS "User Name", loan.isbn AS "Loan ISBN", loanstart AS "Loan Start"
FROM libuser
LEFT JOIN loan ON loanlibrarynumb = librarynumber
WHERE loanlibrarynumb IS NULL;

-- Question 11
UNIQUE Keyword

-- Question 12
CREATE TABLE test_table (test_id INT PRIMARY KEY, fname VARCHAR(30) NOT
NULL, name VARCHAR(30), lname VARCHAR(50) NOT NULL, email VARCHAR(70) UNIQUE
NOT NULL);

-- Question 13
CREATE TABLE test_table_2 (test_id2 INT PRIMARY KEY, linking_att INT, FOREIGN KEY(linking_att) REFERENCES test_table(test_id), notes VARCHAR(50));

