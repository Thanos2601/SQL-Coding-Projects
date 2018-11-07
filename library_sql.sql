CREATE DATABASE db_library

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
	BooksID INT PRIMARY KEY NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(30) FOREIGN KEY REFERENCES publisher(PublisherName)
)
SELECT * FROM books;


CREATE TABLE book_authors(
	BooksID INT FOREIGN KEY REFERENCES books(BooksID),
	AuthorName VARCHAR(30) NOT NULL
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
	('Sharpstown', '123 Main St., Hollywood, CA'),
	('Central', '246 Central St., Portland, CA'),
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


INSERT INTO books (BooksID, Title, PublisherName)
VALUES
	(100, 'Fifty Shades of Grey', 'HarperCollins'),
	(101, 'The Hunger Games', 'Penguin'),
	(102, 'Gone Girl', 'New Era'),
	(103, 'The Fault in Our Stars', 'Simon & Schuster'),
	(104, 'Divergent', 'HarperCollins'),
	(105, 'Harry Potter', 'Penguin'),
	(106, 'A Game of Thrones', 'New Era'),
	(107, 'Who Moved My Cheese?', 'Simon & Schuster'),
	(108, 'The Great Gatsby', 'HarperCollins'),
	(109, 'The Martian', 'Penguin'),
	(110, 'Inferno', 'New Era'),
	(111, 'Beneath A Scarlet Sky', 'Simon & Schuster'),
	(112, 'Green Eggs and Ham', 'HarperCollins'),
	(113, 'Good to Great', 'Penguin'),
	(114, 'The 7 Habits of Highly Effective People', 'New Era'),
	(115, 'Steve Jobs', 'Simon & Schuster'),
	(116, 'American Sniper', 'HarperCollins'),
	(117, '10X Rule', 'Penguin'),
	(118, 'Battlefield Earth', 'New Era'),
	(119, 'Jab, Jab, Jab, Right Hook', 'Simon & Schuster')
;
SELECT * FROM books;

