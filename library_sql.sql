CREATE DATABASE db_library

USE db_library

--CREATING TABLES
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

--INSERTING DATA
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
	(100, 1, 2);
;