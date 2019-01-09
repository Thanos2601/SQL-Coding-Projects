USE db_zooTest1

-- All information from the habitat table.
SELECT * FROM tbl_habitat;

-- Retrieve all names from the species_name column that have a species_order value of 3.
SELECT * FROM tbl_species WHERE species_order = 3;

-- Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.
SELECT * FROM tbl_nutrition WHERE nutrition_cost <= 600;

-- Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.
SELECT * FROM tbl_species WHERE species_nutrition BETWEEN 2202 AND 2206;

-- Retrieve all names within the species_name column using the alias "Species Name:"
-- from the species table and their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table.
SELECT tbl_species.species_name AS 'Species Name', tbl_nutrition.nutrition_id AS 'Nutrition Type' FROM tbl_species
JOIN tbl_nutrition ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;

-- From the specialist table, retrieve the first and last name and contact number of
-- those that provide care for the penguins from the species table.
SELECT tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.specialist_contact 
FROM tbl_specialist
INNER JOIN tbl_care ON care_specialist = specialist_id
INNER JOIN tbl_species ON species_care = care_id
WHERE tbl_species.species_name ='penguin';

-- Create a database with two tables. Assign a foreign key constraint on one table that shares 
-- related data with the primary key on the second table. Finally, create a statement that queries data from both tables.
CREATE DATABASE student_test;

CREATE TABLE tbl_student (
	student_id int primary key NOT NULL identity (1,1),
	student_fname varchar(15) NOT NULL,
	student_lname varchar(20) NOT NULL
);

INSERT INTO tbl_student (student_fname, student_lname)
	VALUES
	('Joe', 'Schmoe'),
	('The', 'Rock'),
	('Billy', 'Bob'),
	('Jay', 'Leno'),
	('Grant', 'Cardone')
;

SELECT * FROM tbl_student;

CREATE TABLE tbl_car (
	car_id int primary key NOT NULL identity (1,1),
	car_make varchar(15) NOT NULL,
	car_model varchar(20) NOT NULL,
	car_student_id int NOT NULL constraint fk_student_id foreign key references tbl_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_car (car_make, car_model, car_student_id)
	VALUES
	('Ford', 'Mustang', 1),
	('Ford', 'Bronco', 2),
	('Jeep', 'Cherokee', 3),
	('Jaguar', 'XK120', 4),
	('Rolls Royce', 'Phantom', 5)
;

SELECT * FROM tbl_car;

SELECT tbl_student.student_fname, tbl_student.student_lname, tbl_car.car_make, tbl_car.car_model
FROM tbl_student
INNER JOIN tbl_car ON car_student_id = student_id;