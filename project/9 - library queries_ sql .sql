-- 1 check total copies of the book title contain word "Dracula"
select BookID from books where Title like '%Dracula%' ;

-- 2 current total loans of the book
select * from loans where BookID in 
(select BookID from books where Title like '%Dracula%' and ReturnedDate is null) ;
-- or
select loans.*  from loans join books on loans.BookID = books.BookID 
where books.Title like '%Dracula%' and loans.ReturnedDate is null ;

-- 3 total available book 
select count(LoanID)from loans where ReturnedDate is not null and BookID;

-- 4 insert 2 rows ('Dracula', 'Bram Stoker', 1897, 4819277482),('Gulliver''s Travel', 'Johnathan Swift',1729,4899254401)
insert into books (Title,Author,Published,Barcode ) 
values('Dracula', 'Bram Stoker', '1897', '4819277482'),
("Gulliver's Travel", 'Johnathan Swift','1729','4899254401');

-- 5 INSERT INTO Loans 
INSERT INTO Loans(BookID, PatronID, LoanDate, DueDate)
VALUES
(
	(SELECT BookID FROM Books WHERE Barcode = 4043822646),
	(SELECT PatronID FROM Patrons WHERE Email LIKE 'jvaan@wisdompets.com'),
	'2020-08-25',
	'2020-09-08'
),
(
	(SELECT BookID FROM Books WHERE Barcode = 2855934983),
	(SELECT PatronID FROM Patrons WHERE Email LIKE 'jvaan@wisdompets.com'),
	'2020-08-25',
	'2020-09-08'
);

--  6 Return books to the library with Barcode = 6435968624
update loans
set ReturnedDate = '2022-11-01'
where BookID in (select BookID from books where Barcode = 6435968624)  and ReturnedDate is null ;
 
/*******************************************************/
/* Encourage Patrons to check out books                */
/* generate a report of showing 10 patrons who have
checked out the fewest books.                          */
/*******************************************************/
SELECT p.FirstName, p.LastName, p.Email, COUNT(p.PatronID) AS Total_Loans
FROM Patrons p
LEFT JOIN Loans l
ON p.PatronID = l.PatronID
GROUP BY p.PatronID
ORDER BY 4 ASC
LIMIT 10;


/*******************************************************/
/* Find books to feature for an event                  
 create a list of books from 1890s that are
 currently available                                    */
/*******************************************************/
SELECT b.BookID, b.Title, b.Author, b.Published, COUNT(b.BookID) AS TotalAvailableBooks
FROM Books b
LEFT JOIN Loans l
ON b.BookID = l.BookID
WHERE ReturnedDate IS NOT NULL
AND b.Published BETWEEN 1890 AND 1899
GROUP BY b.BookID
ORDER BY b.BookID;


/*******************************************************/
/* Book Statistics 
/* create a report to show how many books were 
published each year.                                    */
/*******************************************************/
SELECT Published, COUNT(DISTINCT(Title)) AS TotalNumberOfPublishedBooks
FROM Books
GROUP BY Published
ORDER BY TotalNumberOfPublishedBooks DESC;


/*************************************************************/
/* Book Statistics                                           */
/* create a report to show 5 most popular Books to check out */
/*************************************************************/
SELECT b.Title, b.Author, b.Published, COUNT(b.Title) AS TotalTimesOfLoans
FROM Books b
JOIN Loans l
ON b.BookID = l.BookID
GROUP BY b.Title
ORDER BY 4 DESC
LIMIT 5;
