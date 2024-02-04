/* Task 1 Library Database System
Question 1

CREATE DATABASE Library_System

USE Library_System

CREATE TABLE Catalogue (
CatalogueID int NOT NULL Primary Key,
ItemTitle nvarchar(30) NOT NULL,
ItemType nvarchar(15) NOT NULL,
Author nvarchar(30) NOT NULL,
YearOfPublication int NOT NULL,
DateAdded Date NOT NULL,
CurrentStatus nvarchar(15) NOT NULL);

CREATE TABLE Loan (
LoanID int NOT NULL Primary Key,
CatalogueID int NOT NULL Foreign Key
(CatalogueID) References Catalogue (CatalogueID),
MemberID int NOT NULL Foreign Key
(MemberID) References Members (MemberID),
LoanDate Date NOT NULL,
DueDate Date NOT NULL,
ReturnDate Date NULL,
DaysOverdue int NULL);

CREATE TABLE Members (
MemberID int NOT NULL Primary Key,
FirstName nvarchar(20) NOT NULL,
LastName nvarchar(20) NOT NULL,
Address1 nvarchar(50) NOT NULL,
Address2 nvarchar(50) NULL,
City nvarchar(50) NULL,
Postcode nvarchar(10) NOT NULL,
DateOfBirth Date NOT NULL,
UserName nvarchar(30) NOT NULL,
Password nvarchar(20) NOT NULL,
Email nvarchar(100) UNIQUE NULL,
CHECK(Email LIKE '%_@_%_%'),
Telephone int NULL,
DateJoined Date NOT NULL,
EndDate Date NULL);

CREATE TABLE Fine (
FineID int NOT NULL Primary Key,
MemberID int NOT NULL Foreign Key
(MemberID) References Members (MemberID),
LoanID int NOT NULL Foreign Key
(LoanID) References Loan (LoanID),
OverdueFine money NULL);

CREATE TABLE Payment (
PaymentID int NOT NULL Primary Key,
MemberID int NOT NULL Foreign Key
(MemberID) References Members (MemberID),
RepaymentDateTime DateTime NOT NULL,
RepaymentAmount money NOT NULL,
RepaymentMehtod nvarchar(15) NOT NULL,
OutstandingBalance money NULL);

CREATE TABLE Lost_Removed (
Lost_RemovedID int NOT NULL Primary Key,
CatalogueID int NOT NULL Foreign Key
(CatalogueID) References Catalogue (CatalogueID),
DateIdentified Date NOT NULL,
ISBN int NULL);

INSERT INTO Catalogue (CatalogueID, ItemTitle, ItemType, Author, YearOfPublication, DateAdded, CurrentStatus)
Values ('101', 'CCN', 'Book', 'James Katre', '209', '2014-02-22', 'OnLoan'),
('102', 'MA', 'Book', 'John Borrow', '2012', '2014-01-28', 'Available'),
('103', 'EXTC', 'Book', 'Keiron Rodge', '2011', '2013-11-05', 'Available'),
('104', 'IPMV', 'DVD', 'James Katre', '1999', '2021-10-18', 'OnlLoan'),
('105', 'MA', 'Book', 'Brinn Mike', '2006', '2014-01-16', 'OnLoan'),
('106', 'ARWP', 'Journal', 'Nadi Hulburt', '2018', '2019-01-05', 'Available'),
('107', 'Mechanic', 'Other Media', 'Karan Simit', '2020', '2022-06-01', 'OnLoan'),
('108', 'Electra', 'Book', 'John Borrow', '2021', '2023-01-29', 'Available');

INSERT INTO Members (MemberID, FirstName, LastName,Address1, Address2, City, Postcode, DateOfBirth, UserName, Password, Email, Telephone, DateJoined, EndDate)
VALUES ('01', 'Rustie', 'Pandey', '24562 Katie Alley', NULL, NULL, 'LN6 7HQ', '2003-01-26', 'RUSTO', 'RUSTI001', 'rpandey0@topsy.com', '445-608-4639', '2023-01-29', NULL),
('1002', 'Ingeborg', 'Tytherton', '6455 Rockefeller Street', NULL, NULL, 'SY4 4TK', '1970-05-01', 'Ineg11', 'dhgywiuru', NULL, NULL, '1994-08-25', 'NULL'),
('1003', 'Garick', 'Rennock', '85208 Coolidge Plaza', NULL, NULL, 'CT16 08UI', '1984-12-04', 'GerickRen', 'xdxderhyf', 'grennock2@vimeo.com', '920-370-3890', '2008-06-21', NULL),
('1004', 'Brinn', 'Merrywether', '59 Derek Hill', NULL, NULL, 'LS6 6QH', '1987-05-24', 'BrinMer', 'fuhufd', 'bmerrywether3@google.ru', '110-127-3396', '2005-09-13', NULL),
('1005', 'Stanislaus', 'Elsie', '9169 Springs Parkway', NULL, NULL, 'M34 12J', '1965-02-19', 'StainEl', 'ivrdrbs', 'selsie4@hibu.com', '770-639-5396', '1990-10-29', '2020-02-11'),
('1006', 'Howard', 'Staning', '8022 Sundown Parkway', NULL, NULL, 'KW10 8LS', '1990-06-02', 'HowardSt', 'wdhyugyudc', NULL, NULL, '2017-03-27', NULL),
('1007', 'Nedi', 'Harrinson', '268 Clarendon Street', NULL, NULL, 'DL8 4TS', '1982-04-18', 'NediH', 'Hjfhuos', NULL, NULL, '2006-12-08', NULL),
('1009', 'John', 'Mike', '1234 Close Avenue', NULL, NULL, 'M40 7AD', '1975-12-29', 'JohnM', 'frevav', 'johnmike4@hibu.com', '777-659-5696', '1992-12-09', '2023-03-22'),
('1011', 'Perry', 'Tender', '22 Lupton Avenue', 'Leeds', 'West Yorkshire', 'LS9 6HQ', '1964-05-24', 'Jenkings', 'Arsenal001', 'Jenkings001@yahoo.com', NULL, '1989-02-18', NULL),
('1212', 'Gerry', 'Hulburt', '783 Lakewood Point', NULL, NULL, 'BT2 2HL', '1984-11-04', 'GerryH', 'Xhhvjhj', 'ghulburt8@comsenz.com', '368-822-6495', '2008-06-21', NULL);

INSERT INTO Loan (LoanID, CatalogueID, MemberID, LoanDate, DueDate, ReturnDate, DaysOverdue)
Values ('2001', '102', '1003', '2022-12-17', '2022-12-26', '2023-01-02', '7'),
('2002', '104', '1003', '2023-03-22', '2023-03-31', NULL, NULL),
('2003', '101', '1010', '2023-03-21', '2023-03-30', NULL, NULL),
('2004', '107', '1005', '2023-02-15', '2023-02-24', '2023-02-28', '4'),
('2005', '107', '1002', '2023-03-02', '2023-03-11', '2023-03-08', NULL),
('2006', '105', '1212', '2023-03-20', '2023-03-29', NULL, NULL),
('2007', '106', '1010', '2023-02-19', '2023-02-28', '2023-02-24', NULL),
('2008', '108', '1009', '2022-12-28', '2023-01-06', '2023-01-05', NULL);

INSERT INTO Fine (FineID, MemberID, LoanID, OverdueFine)
VALUES ('4001', '1003', '2001', '70'),
('4002', '1005', '2004', '40');

Question 2; The library also requires stored procedures or user-defined functions to do thefollowing things

(a)Search the catalogue for matching character strings by title. Results should besorted with most 
recent publication date first. This will allow them to query thecatalogue looking for a specific item.

CREATE PROCEDURE ItemTitle @ItemTitle nvarchar(30)

AS
BEGIN
SELECT * 
FROM Catalogue
WHERE ItemTitle = @ItemTitle
ORDER BY YearOfPublication DESC
END;

EXEC ItemTitle @ItemTitle = 'MA';

(b)Return a full list of all items currently on loan which have a due date 
of lessthan five days from the current date (i.e., the system date when the query is run)




(c) Insert a new member into the database

CREATE PROCEDURE INSERTMember (
@MemberID int, @FirstName nvarchar(20), @LastName nvarchar(20), @Address1 nvarchar(50), @Address2 nvarchar(50), @City nvarchar(50), @Postcode nvarchar(10),
@DateOfBirth Date, @UserName nvarchar(30), @Password nvarchar(20), @Email nvarchar(100), @Telephone int, @DateJoined Date, @EndDate Date)

AS
BEGIN

INSERT INTO Members
VALUES (@MemberID, @FirstName, @LastName, @Address1, @Address2, @City, @Postcode, @DateOfBirth, @UserName, @Password, @Email, @Telephone, 
@DateJoined , @EndDate)
END;

EXEC INSERTMember @MemberID = '1007', @FirstName = 'Nedi', @LastName = 'Harrinson', @Address1 = '268 Clarendon Street', 
@Address2 = NULL, @City = NULL, @Postcode = 'DL8 4TS', @DateOfBirth = '1982-04-18', @UserName = 'NediH', 
@Password = 'Hjfhuos', @Email = 'NEdiH@hibu.com', @Telephone = NULL, @DateJoined = '2006-12-08', @EndDate = NULL;


(d)Update the details for an existing member

CREATE PROCEDURE UpdateMember (@Telephone int)
AS
BEGIN
UPDATE Members
SET Telephone = '777-256-5518'
WHERE Telephone = @Telephone
END;



Question 3; The library wants be able to view the loan history, showing all previous and current loans, 
and including details of the item borrowed, borrowed date, due date and anyassociated fines for each loan. 
You should create a view containing all the requiredinformation.

CREATE VIEW CatalogueAndLoan (CatalogueID,
LoanID,
ItemTitle,
ItemType,
Author,
YearOfPublication,
DateAdded,
LoanDate,
DueDate,
OverdueFine)
AS
SELECT c. CatalogueID, l.LoanID, c. ItemTitle,c. ItemType,c. Author,c. YearOfPublication,c. DateAdded,l. LoanDate,l. DueDate,f. OverdueFine
FROM Catalogue c
INNER JOIN Loan l ON
c. CatalogueID = l. CatalogueID
INNER JOIN Fine f ON
f. LoanID = l. LoanID;
GO

Question 4; Create a trigger so that the current status of an item automatically updates toAvailable when the book is returned.




Question 5; You should provide a function, view, or SELECT query which allows the library to identify the total number 
of loans made on a specified date.

UPDATE Loan
SET LoanDate = '22-12-17'
WHERE LoanDate = '22-12-28';

SELECT COUNT(*) AS TotalLoans
FROM Loan
WHERE LoanDate = '2022-12-17';


Question 7; other database objects such as views, stored procedures, user-definedfunctions, or triggers 
which you think would be relevant to the library given the briefabove, you will obtain higher marks for 
providing these along with an explanation oftheir functionality.


Task 2; PrescriptionsDB

Question 1;  The necessary primary and foreign key constraints to the tables.

ALTER TABLE Medical_Practice
ALTER COLUMN PRACTICE_CODE varchar(15) NOT NULL

ALTER TABLE Medical_Practice
ADD PRIMARY KEY (PRACTICE_CODE)

ALTER TABLE Prescriptions
ALTER COLUMN PRESCRIPTION_CODE int NOT NULL

ALTER TABLE Prescriptions
ADD PRIMARY KEY (PRESCRIPTION_CODE)

ALTER TABLE Prescriptions
ADD FOREIGN KEY (PRACTICE_CODE) REFERENCES Medical_Practice (PRACTICE_CODE)

ALTER TABLE Prescriptions
ADD FOREIGN KEY (BNF_CODE) REFERENCES Drugs (BNF_CODE)

Question 2; Write a query that returns details of all drugs which are in the form of tablets orcapsules. 
You can assume that all drugs in this form will have one of these words in the BNF_DESCRIPTION column.

SELECT BNF_DESCRIPTION
FROM Drugs
WHERE BNF_DESCRIPTION LIKE '%tablets%' OR BNF_DESCRIPTION LIKE '%capsules%'

Question 3;  Write a query that returns the total quantity for each of prescriptions – this is given by
the number of items multiplied by the quantity. 

SELECT PRESCRIPTION_CODE, (CAST ( [QUANTITY] AS FLOAT) * CAST ( [ITEMS] AS int)) AS TOTAL_QUANTITY
FROM Prescriptions

Question 4; Write a query that returns a list of the distinct chemical substances which appear in the Drugs table

SELECT DISTINCT CHEMICAL_SUBSTANCE_BNF_DESCR
FROM Drugs

Question 5; Write a query that returns the number of prescriptions for eachBNF_CHAPTER_PLUS_CODE, along with the average cost for that chapter code, 
and theminimum and maximum prescription costs for that chapter code.

SELECT COUNT(pc. PRESCRIPTION_CODE) AS PRESCRIPTION_CODE_COUNT, d. BNF_CHAPTER_PLUS_CODE, (AVG (CAST(ACTUAL_COST AS MONEY))) AS AVG_COST,
(MIN (CAST(ACTUAL_COST AS MONEY))) AS MIN_COST, (MAX (CAST(ACTUAL_COST AS MONEY))) AS MAX_COST
FROM Prescriptions pc
INNER JOIN Drugs d ON
d. BNF_CODE = pc. BNF_CODE
GROUP BY BNF_CHAPTER_PLUS_CODE

Question 6; Write a query that returns the most expensive prescription prescribed by eachpractice, 
sorted in descending order by prescription cost (the ACTUAL_COST column inthe prescription table.) 
Return only those rows where the most expensive prescriptionis more than £4000.


Question 7; You should also write at least five queries of your own and provide a brief explanation
Assessment Information/Brief explanation of the results which each query returns. You should make use
of all of the following atleast once:

o Nested query including use of EXISTS or IN
o Joins
o System functions
o Use of GROUP BY, HAVING and ORDER BY clause


o Nested query including use of EXISTS or IN

SELECT PRESCRIPTION_CODE, BNF_CODE, QUANTITY, ITEMS, ACTUAL_COST
FROM Prescriptions
WHERE PRACTICE_CODE IN (
SELECT PRACTICE_CODE
FROM Medical_Practice
WHERE PRACTICE_NAME LIKE '%SURGERY%');

o Joins

SELECT m. PRACTICE_CODE, COUNT (pc. PRESCRIPTION_CODE) AS TOTAL_PRESCRIPTIONS, (SUM (CAST(ACTUAL_COST AS MONEY))) AS AMOUNT_SPENT
FROM Prescriptions pc
INNER JOIN Medical_Practice m ON
m. PRACTICE_CODE = pc. PRACTICE_CODE
GROUP BY m. PRACTICE_CODE

o Use of GROUP BY, HAVING and ORDER BY clause

SELECT m. PRACTICE_CODE, COUNT (pc. PRESCRIPTION_CODE) AS TOTAL_PRESCRIPTIONS, (SUM (CAST(ACTUAL_COST AS MONEY))) AS AMOUNT_SPENT
FROM Prescriptions pc
INNER JOIN Medical_Practice m ON
m. PRACTICE_CODE = pc. PRACTICE_CODE
GROUP BY m. PRACTICE_CODE
HAVING (SUM (CAST(ACTUAL_COST AS MONEY))) > 80000
ORDER BY TOTAL_PRESCRIPTIONS DESC

SELECT BNF_DESCRIPTION
FROM Drugs
WHERE CHEMICAL_SUBSTANCE_BNF_DESCR LIKE '%hydrochloride%'

