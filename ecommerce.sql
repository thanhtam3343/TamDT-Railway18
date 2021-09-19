DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

DROP DATABASE IF EXISTS customers;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
	customer_id 			INT PRIMARY KEY AUTO_INCREMENT,
	first_name 				VARCHAR(50) NOT NULL,
	last_name 				VARCHAR(50) NOT NULL,
	email_address 			VARCHAR(50) NOT NULL UNIQUE,
	number_of_complaints 	VARCHAR(250)
);


INSERT INTO customers (first_name, last_name, email_address, number_of_complaints)
	VALUE 	('Join', 'MCkinley', 'joinmckinley@365careers.com', 0),  
			('Elizabeth', 'Mcfarlane', 'e.mcfarlane@365careers.com', 5),
			('Kevin', 'Lawrence', 'kevin.lawrence@365careers.com', 3),
			('Catherin', 'Winnfield', 'c.winnfield@365careers.com', 1),
			('Tom', 'Cruise', 't.cruise@365careers.com', 2)
			;
INSERT INTO customers (first_name, last_name, email_address, number_of_complaints)
	VALUE 	('George', 'Clooney', 'george.clooney@365careers.com', 0)
			;

