CREATE DATABASE db_library


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