CREATE DATABASE db_library

USE db_library

/*
================
CREATING TABLES
================
*/
CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	BranchName VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL
)
SELECT * FROM library_branch;


CREATE TABLE publisher (
	PublisherName VARCHAR(30) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(15) NOT NULL
)
SELECT * FROM publisher;


CREATE TABLE books (
	BooksID INT PRIMARY KEY IDENTITY(100,1) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(30) FOREIGN KEY REFERENCES publisher(PublisherName)
)
SELECT * FROM books;


CREATE TABLE book_authors(
	BooksID INT FOREIGN KEY REFERENCES books(BooksID),
	AuthorName VARCHAR(70) NOT NULL
)
SELECT * FROM book_authors;


CREATE TABLE book_copies(
	BooksID INT FOREIGN KEY REFERENCES books(BooksID),
	BranchID INT FOREIGN KEY REFERENCES library_branch(BranchID),
	Number_Of_Copies INT NOT NULL
)
SELECT * FROM book_copies;


CREATE TABLE borrower(
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(15) NOT NULL
)
SELECT * FROM borrower;


CREATE TABLE book_loans (
	BooksID INT FOREIGN KEY REFERENCES books(BooksID),
	BranchID INT FOREIGN KEY REFERENCES library_branch(BranchID),
	CardNo INT FOREIGN KEY REFERENCES borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
)
SELECT * FROM book_loans;

/*
================
INSERTING DATA
================
*/

INSERT INTO library_branch (BranchName, Address)
VALUES
	--Required 4 branches
	('Sharpstown', '123 Main St., Hollywood, CA'), --Required Sharpstown branch
	('Central', '246 Central St., Portland, CA'), --Required Central branch
	('Baker', '135 Odd St., NYC, NY'),
	('Dulles', '124 Park Ave., London, England')
;
SELECT * FROM library_branch;


INSERT INTO publisher (PublisherName, Address, Phone)
VALUES
	('HarperCollins', '987 Main St., San Francisco, CA', '415-555-0987'),
	('New Era', '975 Central St., Austin, TX', '512-555-4567'),
	('Penguin', '864 Odd St., Chicago, IL', '312-555-1234'),
	('Simon & Schuster', '1928 Baker St., San Jose, CA', '408-555-0764')
;
SELECT * FROM publisher;


INSERT INTO books (Title, PublisherName)
VALUES
	--Required 20 books
	('Fifty Shades of Grey', 'HarperCollins'),
	('The Hunger Games', 'Penguin'),
	('Gone Girl', 'New Era'),
	('The Fault in Our Stars', 'Simon & Schuster'),
	('Divergent', 'HarperCollins'),
	('Harry Potter', 'Penguin'),
	('A Game of Thrones', 'New Era'),
	('Who Moved My Cheese?', 'Simon & Schuster'),
	('The Great Gatsby', 'HarperCollins'),
	('The Martian', 'Penguin'),
	('The Lost Tribe', 'New Era'),
	('Beneath A Scarlet Sky', 'Simon & Schuster'),
	('Green Eggs and Ham', 'HarperCollins'),
	('The Shining', 'Penguin'), --Required Stephen King
	('The Green Mile', 'New Era'), --Required Stephen King
	('Steve Jobs', 'Simon & Schuster'),
	('American Sniper', 'HarperCollins'),
	('10X Rule', 'Penguin'),
	('Battlefield Earth', 'New Era'),
	('Jab, Jab, Jab, Right Hook', 'Simon & Schuster')
;
SELECT * FROM books;


INSERT INTO book_authors (BooksID, AuthorName)
VALUES
	--Required 10 authors
	(100, 'E.L. James'),
	(101, 'Suzanne Collins'),
	(102, 'Gillian Flynn'),
	(103, 'John Green'),
	(104, 'Veronica Roth'),
	(105, 'J.K. Rowling'),
	(106, 'George R. R. Martin'),
	(107, 'Spencer Johnson'),
	(108, 'F. Scott Fitzgerald'),
	(109, 'Andy Weir'),
	(110, 'Matthew Caldwell'),
	(111, 'Mark T. Sullivan'),
	(112, 'Dr. Seuss'),
	(113, 'Stephen King'),
	(114, 'Stephen King'),
	(115, 'Walter Isaacson'),
	(116, 'Chris Kyle, Scott McEwen, Jim DeFelice'),
	(117, 'Grant Cardone'),
	(118, 'L. Ron Hubbard'),
	(119, 'Gary Vaynerchuk')
;
SELECT * FROM book_authors;


INSERT INTO book_copies (BooksID, BranchID, Number_Of_Copies)
VALUES
	--Each branch has at least 10 books
	--Each branch has at least 2 copies of those 10 books
	--Branches are numbered 1-4 for Sharpstown, Central, Baker, and Dulles respectively.
	(100, 1, 5),
	(100, 2, 5),
	(100, 3, 5),
	(100, 4, 5), --1st book
	(101, 1, 5),
	(101, 2, 5),
	(101, 3, 5),
	(101, 4, 5), --2nd book
	(102, 1, 5),
	(102, 2, 5),
	(102, 3, 5),
	(102, 4, 5), --3rd book
	(103, 1, 5),
	(103, 2, 5),
	(103, 3, 5),
	(103, 4, 5), --4th book
	(104, 1, 5),
	(104, 2, 5),
	(104, 3, 5),
	(104, 4, 5), --5th book
	(105, 1, 5),
	(105, 2, 5),
	(105, 3, 5),
	(105, 4, 5), --6th book
	(106, 1, 5),
	(106, 2, 5),
	(106, 3, 5),
	(106, 4, 5), --7th book
	(111, 1, 5),
	(111, 2, 5),
	(111, 3, 5),
	(111, 4, 5), --8th book
	(114, 1, 5),
	(114, 2, 5),
	(114, 3, 5),
	(114, 4, 5), --9th book
	(115, 1, 5),
	(115, 2, 5),
	(115, 3, 5),
	(115, 4, 5) --10th book
;
SELECT * FROM book_copies;


INSERT INTO borrower (CardNo, Name, Address, Phone)
VALUES
	--There are at least 8 borrowers in the BORROWER table
	(1000, 'Joe Blow', '123 Main St., Portland, OR', '503-555-1234'),
	(1001, 'Johnny Anybody', '234 Park Ave., San Francisco, CA', '415-555-2345'),
	(1002, 'Dave Arbuckle', '345 Broadway Blvd., Hollywood, CA', '818-555-3456'),
	(1003, 'Johnny Come-Lately', '456 Hill St., London, England', '020-555-4567'),
	(1004, 'Shani Nir', '567 Mtn St., NYC, NY', '212-555-5678'),
	(1005, 'Ana Sofia Garza', '678 Odd St., Austin, TX', '512-555-6789'),
	(1006, 'Melissa Trevens', '789 Central St., Chicago, IL', '312-555-7890'),
	(1007, 'Becka Wiley', '246 Baker St., San Jose, CA', '408-555-8901')
;
SELECT * FROM borrower;


INSERT INTO book_loans (BooksID, BranchID, CardNo, DateOut, DateDue)
VALUES
	--There are at least 50 loans in the BOOK_LOANS table.
	--At least 2 of the borrowers have more than 5 books loaned to them.
	(100, 1, 1007, '2018-06-02', '2018-07-02'),
	(101, 1, 1007, '2018-06-02', '2018-07-02'),
	(102, 1, 1007, '2018-06-02', '2018-07-02'),
	(103, 1, 1007, '2018-06-02', '2018-07-02'),
	(104, 1, 1007, '2018-06-02', '2018-07-02'),
	(105, 1, 1007, '2018-06-02', '2018-07-02'), 
	(106, 1, 1007, '2018-06-02', '2018-07-02'),
	(107, 1, 1007, '2018-06-02', '2018-07-02'), --8 books to Becka

	(101, 2, 1000, '2018-06-10', '2018-07-10'),
	(102, 2, 1000, '2018-06-10', '2018-07-10'),
	(103, 2, 1000, '2018-06-10', '2018-07-10'),
	(108, 2, 1000, '2018-06-10', '2018-07-10'),
	(109, 2, 1000, '2018-06-10', '2018-07-10'),
	(110, 2, 1000, '2018-06-10', '2018-07-10'),
	(111, 2, 1000, '2018-06-10', '2018-07-10'), 
	(112, 2, 1000, '2018-06-10', '2018-07-10'), --8 books to Joe

	(101, 3, 1004, '2018-06-16', '2018-07-16'),
	(104, 3, 1004, '2018-06-16', '2018-07-16'),
	(105, 3, 1004, '2018-06-16', '2018-07-16'),
	(106, 3, 1004, '2018-06-16', '2018-07-16'),
	(107, 3, 1004, '2018-06-16', '2018-07-16'),
	(109, 3, 1004, '2018-06-16', '2018-06-16'), 
	(113, 3, 1004, '2018-06-16', '2018-07-16'),
	(116, 3, 1004, '2018-06-16', '2018-07-16'),--8 books to Shani

	(101, 4, 1001, '2018-06-20', '2018-07-20'),
	(105, 4, 1001, '2018-06-20', '2018-07-20'),
	(106, 4, 1001, '2018-06-20', '2018-07-20'),
	(109, 4, 1001, '2018-06-20', '2018-07-20'),
	(115, 4, 1001, '2018-06-20', '2018-07-20'),
	(116, 4, 1001, '2018-06-20', '2018-07-20'),
	(117, 4, 1001, '2018-06-20', '2018-07-20'),
	(118, 4, 1001, '2018-06-20', '2018-07-20'), --8 books to Johnny

	(111, 1, 1005, '2018-06-21', '2018-07-21'),
	(113, 1, 1005, '2018-06-21', '2018-07-21'),
	(114, 1, 1005, '2018-06-21', '2018-07-21'),
	(115, 1, 1005, '2018-06-21', '2018-07-21'),
	(116, 1, 1005, '2018-06-21', '2018-07-21'),
	(117, 1, 1005, '2018-06-21', '2018-07-21'),
	(118, 1, 1005, '2018-06-21', '2018-07-21'),
	(119, 1, 1005, '2018-06-21', '2018-07-21') --8 books to Ana Sofia
;
SELECT * FROM book_loans;


/*
================
Creating Procedures
================
*/