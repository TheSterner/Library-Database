 
CREATE DATABASE db_sqlfinal;

GO

USE db_sqlfinal
go


CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1), 
	BranchName VARCHAR (50) NOT NULL, 
	Address NVARCHAR (70)
);

CREATE TABLE Publisher (
	PublisherName VARCHAR (50) PRIMARY KEY NOT NULL,  
	Address NVARCHAR (70), 
	Phone BIGINT
);

CREATE TABLE Borrower (
	CardNo BIGINT PRIMARY KEY IDENTITY (10000, 1),  
	Name VARCHAR (50), 
	Address NVARCHAR (70),
	Phone BIGINT 
);

CREATE TABLE Books (
	BookID BIGINT PRIMARY KEY IDENTITY (1,1),  
	Title NVARCHAR (99), 
	PublisherName VARCHAR (50) FOREIGN KEY REFERENCES Publisher(PublisherName)
);

CREATE TABLE Book_Loans (
	BookID BIGINT FOREIGN KEY REFERENCES Books(BookID),  
	BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID), 
	CardNo BIGINT FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE,
	DateDue DATE
);

CREATE TABLE Book_Copies (
	BookID BIGINT FOREIGN KEY REFERENCES Books(BookID),  
	BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID), 
	Number_Of_Copies INT
);

CREATE TABLE Book_Authors (
	BookID BIGINT FOREIGN KEY REFERENCES Books(BookID),  
	AuthorName VARCHAR (50)
);

INSERT INTO Publisher (PublisherName, Address, Phone) 
	VALUES ('CreateSpace Independent Publishing Platform', '555 Industrial Dr, Houston, TX 77015',8005556987),
			('Bloomsbury Publishing Inc.','1385 Broadway, 5th Floor, New York, NY 10018', 2124195300),
			('Little, Brown and Company','53 State St, Boston, MA 02109',6172270730),
			('Random House Publishing', '400 Hahn Rd, Westminster, MD 21157',4108481900),
			('DoubleDay Publishing','1745 Broadway, New York, NY 10019',7184138769),
			('Sun-Times Media Group','30 N. Racine Ave., 3rd Floor,Chicago, IL 60607',8888484637),
			('J. B. Lippincott & Co Publishing','Philadelphia, PA',8886529184),
			('HarperCollins Publishers','195 Broadway, New York, NY 10007',18002427737),
			('City Lights Books','261 Columbus Ave, San Francisco, CA 94133',4153621901),
			('Independent Publishers Group','56 Miner Way, Hartford, CT 46915',8665659823),
			('Lippincotts Monthly Magazine','845 Pine St, Allewood, MI 65841',8665214875),
			('Harvill Secker','111 Circle Dr, Pinewood, IL 56214', 5148547569),
			('‎Harper and Brothers‎','254 Kite Ln, Springfield, CO 45856',6523214589),
			('Harcourt, Brace and Company','345 Sterner Way, Lyons, TX 75846', 2548569585),
			('Collins Crime Club','5656 Weeping Pl, Washington, DC 02458',8885447596),
			('Dodd, Mead and Company','5858 Shutter Dr, Denver, CO 35689',8775669523);

INSERT INTO Library_Branch (BranchName, Address) 
VALUES ('Sharpstown', '7502 Fondren, Houston, TX 77074'),
		('Central', '500 W. Third St. Fort Worth, TX 76102'),
		('West','4000 Louis Stephens Dr, Cary, NC 27519'),
		('South','5801 Rea Road. Charlotte, NC 28277'),
		('Widener','2808 W Lehigh Ave, Philadelphia, PA 19132'),
		('Metropolitan','5454 Mark Twain Blvd, Houston, TX 77015');

INSERT INTO Borrower(Name, Address, Phone) 
	VALUES ('Sandy Jones', '52 Maple St', 5624528569),
			('Bob Williams', '86 York Pl', 5626548596),
			('Greg Lagala', '43 Place Rd', 5627890569),
			('Donna Smith', '32 Oak Ln', 5624970231),
			('George Evans','67 Beach Blvd', 5626958475),
			('Jennifer Applegate', '40 Index Rd', 5569583252),
			('Pat Schneider', '504 Terance Dr', 5623658965),
			('Jane Adams', '399 Link Rd', 5624879586),
			('Steve Moran', '133 Long Ln', 5475236598),
			('John Miller', '505 Sandy Way', 5629854525),
			('Jesse Spilner', '85 Main St', 5245875621);

INSERT INTO Books (title, PublisherName) 
VALUES ('The Lost Tribe',(SELECT PublisherName FROM Publisher WHERE PublisherName='CreateSpace Independent Publishing Platform') ),
		('Harry Potter', (SELECT PublisherName FROM Publisher WHERE PublisherName='Bloomsbury Publishing Inc.')),
		('The Casual Vacancy', (SELECT PublisherName FROM Publisher WHERE PublisherName='Little, Brown and Company')),
		('Lethal White', (SELECT PublisherName FROM Publisher WHERE PublisherName='Little, Brown and Company')),
		('Green Eggs and Ham', (SELECT PublisherName FROM Publisher WHERE PublisherName='Random House Publishing')),
		('The Cat in the Hat', (SELECT PublisherName FROM Publisher WHERE PublisherName='Random House Publishing')),
		('The Sneetches and other stories', (SELECT PublisherName FROM Publisher WHERE PublisherName='Random House Publishing')),
		('The Stand', (SELECT PublisherName FROM Publisher WHERE PublisherName='DoubleDay Publishing')),
		('Carrie', (SELECT PublisherName FROM Publisher WHERE PublisherName='DoubleDay Publishing')),
		('The Shining', (SELECT PublisherName FROM Publisher WHERE PublisherName='DoubleDay Publishing')),
		('The Selfish Giant', (SELECT PublisherName FROM Publisher WHERE PublisherName='Independent Publishers Group')),
		('The Picture of Dorian Gray', (SELECT PublisherName FROM Publisher WHERE PublisherName='Lippincotts Monthly Magazine')),
		('Roughing It', (SELECT PublisherName FROM Publisher WHERE PublisherName='Sun-Times Media Group')),
		('The Adventures of Tom Sawyer', (SELECT PublisherName FROM Publisher WHERE PublisherName='Sun-Times Media Group')),
		('Kaddish', (SELECT PublisherName FROM Publisher WHERE PublisherName='City Lights Books')),
		('Planet News', (SELECT PublisherName FROM Publisher WHERE PublisherName='City Lights Books')),
		('Nine Stories', (SELECT PublisherName FROM Publisher WHERE PublisherName='Little, Brown and Company')),
		('The Catcher in the Rye', (SELECT PublisherName FROM Publisher WHERE PublisherName='Little, Brown and Company')),
		('Teddy', (SELECT PublisherName FROM Publisher WHERE PublisherName='Bloomsbury Publishing Inc.')),
		('To Kill a Mocking Bird', (SELECT PublisherName FROM Publisher WHERE PublisherName='J. B. Lippincott & Co Publishing')),
		('Go Set a Watchman', (SELECT PublisherName FROM Publisher WHERE PublisherName='HarperCollins Publishers')),
		('1984', (SELECT PublisherName FROM Publisher WHERE PublisherName='Harvill Secker')),
		('Animal Farm', (SELECT PublisherName FROM Publisher WHERE PublisherName='Harcourt, Brace and Company')),
		('Burmese Days', (SELECT PublisherName FROM Publisher WHERE PublisherName='?Harper and Brothers?')),
		('Murder on the Orient Express', (SELECT PublisherName FROM Publisher WHERE PublisherName='Collins Crime Club')),
		('Five Little Pigs', (SELECT PublisherName FROM Publisher WHERE PublisherName='Dodd, Mead and Company')),
		('Crooked House', (SELECT PublisherName FROM Publisher WHERE PublisherName='Dodd, Mead and Company'));

INSERT INTO Book_Authors (BookID, AuthorName) 
VALUES ((SELECT BookID FROM Books WHERE Title='The Lost Tribe'),'Mark Lee'),
		((SELECT BookID FROM Books WHERE Title='The Stand'),'Stephen King'),
		((SELECT BookID FROM Books WHERE Title='Carrie'),'Stephen King'),
		((SELECT BookID FROM Books WHERE Title='The Shining'),'Stephen King'),
		((SELECT BookID FROM Books WHERE Title='The Adventures of Tom Sawyer'),'Mark Twain'),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),'Mark Twain'),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),'Allen Ginsberg'),
		((SELECT BookID FROM Books WHERE Title='Planet News'),'Allen Ginsberg'),
		((SELECT BookID FROM Books WHERE Title='The Selfish Giant'),'Oscar Wilde'),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),'Oscar Wilde'),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),'J.K. Rowling'),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),'J.K. Rowling'),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),'J.K. Rowling'),
		((SELECT BookID FROM Books WHERE Title='Teddy'),'J.D. Salinger'),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),'J.D. Salinger'),
		((SELECT BookID FROM Books WHERE Title='Nine Stories'),'J.D. Salinger'),
		((SELECT BookID FROM Books WHERE Title='To Kill a Mocking Bird'),'Harper Lee'),
		((SELECT BookID FROM Books WHERE Title='Go Set a Watchman'),'Harper Lee'),
		((SELECT BookID FROM Books WHERE Title='1984'),'George Orwell'),
		((SELECT BookID FROM Books WHERE Title='Burmese Days'),'George Orwell'),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),'George Orwell'),
		((SELECT BookID FROM Books WHERE Title='Murder on the Orient Express'),'Agatha Christie'),
		((SELECT BookID FROM Books WHERE Title='Five Little Pigs'),'Agatha Christie'),
		((SELECT BookID FROM Books WHERE Title='Crooked House'),'Agatha Christie'),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),'Dr. Seuss'),
		((SELECT BookID FROM Books WHERE Title='The Cat in the Hat'),'Dr. Seuss'),
		((SELECT BookID FROM Books WHERE Title='The Sneetches and other stories'),'Dr. Seuss');  

INSERT INTO Book_Copies (BookID, BranchID, Number_Of_Copies) 
VALUES ((SELECT BookID FROM Books WHERE Title='The Lost Tribe'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='The Lost Tribe'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='The Lost Tribe'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='The Lost Tribe'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='The Lost Tribe'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 2),
		((SELECT BookID FROM Books WHERE Title='The Lost Tribe'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='The Stand'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 4),
		((SELECT BookID FROM Books WHERE Title='The Stand'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='The Stand'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='The Stand'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='The Stand'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 2),
		((SELECT BookID FROM Books WHERE Title='The Stand'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 3),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 2),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 2),
		((SELECT BookID FROM Books WHERE Title='The Shining'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='The Shining'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 2),
		((SELECT BookID FROM Books WHERE Title='The Shining'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 4),
		((SELECT BookID FROM Books WHERE Title='The Shining'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='The Shining'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='The Shining'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 2),
		((SELECT BookID FROM Books WHERE Title='The Adventures of Tom Sawyer'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='The Adventures of Tom Sawyer'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='The Adventures of Tom Sawyer'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 4),
		((SELECT BookID FROM Books WHERE Title='The Adventures of Tom Sawyer'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='The Adventures of Tom Sawyer'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='The Adventures of Tom Sawyer'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 4),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 2),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 4),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Planet News'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Planet News'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Planet News'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='Planet News'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 5),
		((SELECT BookID FROM Books WHERE Title='Planet News'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Planet News'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='The Selfish Giant'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 4),
		((SELECT BookID FROM Books WHERE Title='The Selfish Giant'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='The Selfish Giant'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 3),
		((SELECT BookID FROM Books WHERE Title='The Selfish Giant'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='The Selfish Giant'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 4),
		((SELECT BookID FROM Books WHERE Title='The Selfish Giant'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 2),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 4),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 2),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 4),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 2),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 5),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='Teddy'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 4),
		((SELECT BookID FROM Books WHERE Title='Teddy'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Teddy'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 3),
		((SELECT BookID FROM Books WHERE Title='Teddy'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='Teddy'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 4),
		((SELECT BookID FROM Books WHERE Title='Teddy'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 4),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='Nine Stories'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Nine Stories'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Nine Stories'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 3),
		((SELECT BookID FROM Books WHERE Title='Nine Stories'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 2),
		((SELECT BookID FROM Books WHERE Title='Nine Stories'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Nine Stories'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='To Kill a Mocking Bird'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 5),
		((SELECT BookID FROM Books WHERE Title='To Kill a Mocking Bird'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='To Kill a Mocking Bird'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 4),
		((SELECT BookID FROM Books WHERE Title='To Kill a Mocking Bird'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='To Kill a Mocking Bird'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 5),
		((SELECT BookID FROM Books WHERE Title='To Kill a Mocking Bird'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='Go Set a Watchman'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 4),
		((SELECT BookID FROM Books WHERE Title='Go Set a Watchman'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='Go Set a Watchman'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 5),
		((SELECT BookID FROM Books WHERE Title='Go Set a Watchman'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='Go Set a Watchman'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Go Set a Watchman'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='1984'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 4),
		((SELECT BookID FROM Books WHERE Title='1984'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='1984'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 3),
		((SELECT BookID FROM Books WHERE Title='1984'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='1984'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='1984'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Burmese Days'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Burmese Days'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Burmese Days'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 3),
		((SELECT BookID FROM Books WHERE Title='Burmese Days'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='Burmese Days'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 4),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 2),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Murder on the Orient Express'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Murder on the Orient Express'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Murder on the Orient Express'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 3),
		((SELECT BookID FROM Books WHERE Title='Murder on the Orient Express'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='Murder on the Orient Express'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 4),
		((SELECT BookID FROM Books WHERE Title='Murder on the Orient Express'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='Five Little Pigs'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 4),
		((SELECT BookID FROM Books WHERE Title='Five Little Pigs'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 3),
		((SELECT BookID FROM Books WHERE Title='Five Little Pigs'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 4),
		((SELECT BookID FROM Books WHERE Title='Five Little Pigs'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 4),
		((SELECT BookID FROM Books WHERE Title='Five Little Pigs'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 3),
		((SELECT BookID FROM Books WHERE Title='Five Little Pigs'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Crooked House'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='Crooked House'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='Crooked House'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='Crooked House'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='Crooked House'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 4),
		((SELECT BookID FROM Books WHERE Title='Crooked House'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 4),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 2),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 2),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 2),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 2),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 5),
		((SELECT BookID FROM Books WHERE Title='The Cat in the Hat'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='The Cat in the Hat'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='The Cat in the Hat'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 3),
		((SELECT BookID FROM Books WHERE Title='The Cat in the Hat'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='The Cat in the Hat'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 4),
		((SELECT BookID FROM Books WHERE Title='The Cat in the Hat'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3),
		((SELECT BookID FROM Books WHERE Title='The Sneetches and other stories'),(SELECT BranchID from Library_Branch WHERE BranchName='Sharpstown'), 3),
		((SELECT BookID FROM Books WHERE Title='The Sneetches and other stories'),(SELECT BranchID from Library_Branch WHERE BranchName='Central'), 4),
		((SELECT BookID FROM Books WHERE Title='The Sneetches and other stories'),(SELECT BranchID from Library_Branch WHERE BranchName='West'), 2),
		((SELECT BookID FROM Books WHERE Title='The Sneetches and other stories'),(SELECT BranchID from Library_Branch WHERE BranchName='South'), 3),
		((SELECT BookID FROM Books WHERE Title='The Sneetches and other stories'),(SELECT BranchID from Library_Branch WHERE BranchName='Widener'), 4),
		((SELECT BookID FROM Books WHERE Title='The Sneetches and other stories'),(SELECT BranchID from Library_Branch WHERE BranchName='Metropolitan'), 3);

INSERT INTO Book_Loans (BookID, BranchID, CardNo, DateOut, DateDue)
VALUES ((SELECT BookID FROM Books WHERE Title='The Lost Tribe'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Sandy Jones'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Jennifer Applegate'), '20180815', '20180915'),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Jennifer Applegate'), '20180815', '20180915'),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Sandy Jones'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Jennifer Applegate'), '20180815', '20180915'),
		((SELECT BookID FROM Books WHERE Title='The Stand'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Jennifer Applegate'), '20180815', '20180915'),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Sandy Jones'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Sandy Jones'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Sandy Jones'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Planet News'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Sharpstown'),(SELECT CardNo FROM Borrower WHERE Name='Sandy Jones'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Central'),(SELECT CardNo FROM Borrower WHERE Name='George Evans'), '20180805', '20180905'),
		((SELECT BookID FROM Books WHERE Title='The Catcher in the Rye'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Central'),(SELECT CardNo FROM Borrower WHERE Name='George Evans'), '20180805', '20180905'),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Central'),(SELECT CardNo FROM Borrower WHERE Name='George Evans'), '20180805', '20180905'),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Central'),(SELECT CardNo FROM Borrower WHERE Name='George Evans'), '20180809', '20180909'),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Central'),(SELECT CardNo FROM Borrower WHERE Name='George Evans'), '20180809', '20180909'),
		((SELECT BookID FROM Books WHERE Title='1984'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Central'),(SELECT CardNo FROM Borrower WHERE Name='Donna Smith'), '20180823', '20180923'),
		((SELECT BookID FROM Books WHERE Title='Teddy'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Central'),(SELECT CardNo FROM Borrower WHERE Name='Donna Smith'), '20180823', '20180923'),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Central'),(SELECT CardNo FROM Borrower WHERE Name='Donna Smith'), '20180823', '20180923'),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID FROM Library_Branch WHERE BranchName='West'),(SELECT CardNo FROM Borrower WHERE Name='Bob Williams'), '20180814', '20180914'),
		((SELECT BookID FROM Books WHERE Title='The Shining'),(SELECT BranchID FROM Library_Branch WHERE BranchName='West'),(SELECT CardNo FROM Borrower WHERE Name='Bob Williams'), '20180814', '20180914'),
		((SELECT BookID FROM Books WHERE Title='The Adventures of Tom Sawyer'),(SELECT BranchID FROM Library_Branch WHERE BranchName='West'),(SELECT CardNo FROM Borrower WHERE Name='Bob Williams'), '20180814', '20180914'),
		((SELECT BookID FROM Books WHERE Title='Roughing It'),(SELECT BranchID FROM Library_Branch WHERE BranchName='West'),(SELECT CardNo FROM Borrower WHERE Name='Bob Williams'), '20180814', '20180914'),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),(SELECT BranchID FROM Library_Branch WHERE BranchName='West'),(SELECT CardNo FROM Borrower WHERE Name='Jane Adams'), '20180818', '20180918'),
		((SELECT BookID FROM Books WHERE Title='Planet News'),(SELECT BranchID FROM Library_Branch WHERE BranchName='West'),(SELECT CardNo FROM Borrower WHERE Name='Jane Adams'), '20180818', '20180918'),
		((SELECT BookID FROM Books WHERE Title='The Selfish Giant'),(SELECT BranchID FROM Library_Branch WHERE BranchName='West'),(SELECT CardNo FROM Borrower WHERE Name='Jane Adams'), '20180818', '20180918'),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),(SELECT BranchID FROM Library_Branch WHERE BranchName='South'),(SELECT CardNo FROM Borrower WHERE Name='Pat Schneider'), '20180802', '20180902'),
		((SELECT BookID FROM Books WHERE Title='Harry Potter'),(SELECT BranchID FROM Library_Branch WHERE BranchName='South'),(SELECT CardNo FROM Borrower WHERE Name='Pat Schneider'), '20180802', '20180902'),
		((SELECT BookID FROM Books WHERE Title='The Casual Vacancy'),(SELECT BranchID FROM Library_Branch WHERE BranchName='South'),(SELECT CardNo FROM Borrower WHERE Name='Pat Schneider'), '20180802', '20180902'),
		((SELECT BookID FROM Books WHERE Title='Lethal White'),(SELECT BranchID FROM Library_Branch WHERE BranchName='South'),(SELECT CardNo FROM Borrower WHERE Name='Pat Schneider'), '20180802', '20180902'),
		((SELECT BookID FROM Books WHERE Title='Teddy'),(SELECT BranchID FROM Library_Branch WHERE BranchName='South'),(SELECT CardNo FROM Borrower WHERE Name='Pat Schneider'), '20180802', '20180902'),
		((SELECT BookID FROM Books WHERE Title='To Kill a Mocking Bird'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Widener'),(SELECT CardNo FROM Borrower WHERE Name='Greg Lagala'), '20180804', '20180904'),
		((SELECT BookID FROM Books WHERE Title='Go Set a Watchman'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Widener'),(SELECT CardNo FROM Borrower WHERE Name='Greg Lagala'), '20180804', '20180904'),
		((SELECT BookID FROM Books WHERE Title='1984'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Widener'),(SELECT CardNo FROM Borrower WHERE Name='Greg Lagala'), '20180804', '20180904'),
		((SELECT BookID FROM Books WHERE Title='Burmese Days'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Widener'),(SELECT CardNo FROM Borrower WHERE Name='Greg Lagala'), '20180804', '20180904'),
		((SELECT BookID FROM Books WHERE Title='Animal Farm'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Widener'),(SELECT CardNo FROM Borrower WHERE Name='Jesse Spilner'), '20180812', '20180912'),
		((SELECT BookID FROM Books WHERE Title='Murder on the Orient Express'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Widener'),(SELECT CardNo FROM Borrower WHERE Name='Jesse Spilner'), '20180812', '20180912'),
		((SELECT BookID FROM Books WHERE Title='Five Little Pigs'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Widener'),(SELECT CardNo FROM Borrower WHERE Name='Steve Moran'), '20180826', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Crooked House'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Metropolitan'),(SELECT CardNo FROM Borrower WHERE Name='Steve Moran'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Green Eggs and Ham'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Metropolitan'),(SELECT CardNo FROM Borrower WHERE Name='Steve Moran'), '20180820', '20180926'),
		((SELECT BookID FROM Books WHERE Title='The Cat in the Hat'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Metropolitan'),(SELECT CardNo FROM Borrower WHERE Name='Steve Moran'), '20180826', '20180926'),
		((SELECT BookID FROM Books WHERE Title='The Sneetches and other stories'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Metropolitan'),(SELECT CardNo FROM Borrower WHERE Name='Steve Moran'), '20180826', '20180926'),
		((SELECT BookID FROM Books WHERE Title='The Picture of Dorian Gray'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Metropolitan'),(SELECT CardNo FROM Borrower WHERE Name='John Miller'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Carrie'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Metropolitan'),(SELECT CardNo FROM Borrower WHERE Name='John Miller'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='The Stand'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Metropolitan'),(SELECT CardNo FROM Borrower WHERE Name='John Miller'), '20180820', '20180920'),
		((SELECT BookID FROM Books WHERE Title='Kaddish'),(SELECT BranchID FROM Library_Branch WHERE BranchName='Metropolitan'),(SELECT CardNo FROM Borrower WHERE Name='John Miller'), '20180820', '20180920');  
	


Select * from Library_Branch;
Select * from Books;
Select * from Book_Copies;

Select * from Book_Loans;
Select * from Book_Authors;
Select * from Publisher;
Select * from Borrower;

CREATE PROCEDURE Tribe.Sharpstown @ nvarchar(30), @PostalCode nvarchar(20)
AS
SELECT Library_Branch.BranchName, Book_Copies.BranchID FROM Book_Copies WHERE Title = @ AND PostalCode = @PostalCode
GO;

CREATE PROCEDURE Copies @Name nvarchar(30), @Title nvarchar(30)
AS
SELECT BranchName, Number_Of_Copies, Title  FROM Library_Branch, Book_Copies, Books WHERE BranchName = @Name AND Title = @Title 
GO

DROP PROCEDURE Sharpstown

EXEC Copies Name = "Sharpstown", Title = "The Lost Tribe";

--1st question
CREATE PROCEDURE Sharpstown @BranchName nvarchar (15), @Title nvarchar (30),
AS
SELECT Library_Branch.BranchID, Library_Branch.BranchName, Book_Copies.Number_Of_Copies, Book_Copies.BookID, Books.Title
FROM ((Library_Branch 
INNER JOIN Book_Copies ON Library_Branch.BranchID = Book_Copies.BranchID)
INNER JOIN Books ON Book_Copies.BookID = Books.BookID)
WHERE Library_Branch.BranchName=@BranchName AND Books.Title=@Title;
go

EXEC Sharpstown BranchName='Sharpstown' and  Title = 'The Lost Tribe';

--SELECT Library_Branch.BranchID, Library_Branch.BranchName, Book_Copies.Number_Of_Copies, Book_Copies.BookID, Books.Title
--FROM 
--    Library_Branch AS C
--    INNER JOIN Book_Copies AS L
--    ON C.BranchID = L.BranchID
--    INNER JOIN  Books AS S
--    ON S.BookID =  


--2nd question
SELECT Library_Branch.BranchID, Library_Branch.BranchName, Book_Copies.Number_Of_Copies, Book_Copies.BookID, Books.Title
FROM ((Library_Branch 
INNER JOIN Book_Copies ON Library_Branch.BranchID = Book_Copies.BranchID)
INNER JOIN Books ON Book_Copies.BookID = Books.BookID)
WHERE Books.Title = 'The Lost Tribe';

--3rd question
SELECT Borrower.Name		
FROM Borrower
INNER JOIN Book_Loans ON Borrower.CardNo=Book_Loans.CardNo	
WHERE Book_Loans.CardNo <> Borrower.CardNo;


SELECT Borrower.Name, Borrower.Address, Books.Title,
FROM Book_Loans
INNER JOIN Borrower ON Borrower.CardNo=Book_Loans.CardNo 
WHERE Library_Branch.BranchName='Sharpstown' AND Book_Loans.DateDue=GETDATE();	


CREATE PROCEDURE BooksLoanedOut @BranchName nvarchar (20),
AS
SELECT Library_Branch.BranchName, Book_Loans.BranchID, Book_Loans.BookID 
FROM ((Library_Branch
INNER JOIN Book_Loans ON Book_Loans.BranchID=Library_Branch.BranchID)
INNER JOIN (SELECT COUNT(BookID) FROM Book_Loans WHERE Book_Loans.BranchID)
WHERE Library_Branch.BranchName=@BranchName 
GO

SELECT BranchName, Number_of_Copies, 
(SELECT COUNT(BookID) FROM Book_Loans AS TotalLoanedOut) 
FROM Library_Branch AS LB,Book_Copies AS BC,Book_Loans AS BL
INNER JOIN (Book_Loans ON LB.BranchID=BL.BranchID)
INNER JOIN (BL.BookID ON BL.BookID=BC.BookID)
WHERE LB.BranchName='Sharpstown';
GO


SELECT Borrower.Name, Borrower.Address, 
(SELECT COUNT(CardNo) FROM Book_Loans GROUP BY CardNo HAVING COUNT(CardNo) > 5 ORDER BY COUNT(CardNo)DESC)
AS BookCopies
FROM Borrower AS BW, Book_Loans AS BL
INNER JOIN (SELECT CardNo FROM Borrower ON BW.CardNo=BL.CardNo)
INNER JOIN  


SELECT Books.Title, Book_Copies.Number_Of_Copies
FROM Books, Library_Branch 
INNER JOIN Book_Authors ON Books.BookID=Book_Authors.BookID
INNER JOIN Book_Copies ON Books.BookID=Book_Copies.BookID
INNER JOIN Book_Copies ON Book_Copies.BranchID=Library_Branch.BranchID

WHERE Library_Branch.BranchName='Central' AND Book_Authors='Stephen King'
  
  

 



