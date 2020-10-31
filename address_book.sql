#UC1
CREATE DATABASE address_book_service; 		#Create database
USE address_book_service; 			#To use address_book_service database	
SELECT DATABASE(); 				#To see current database

#UC2
CREATE TABLE address_book   			#Create table address book
(
 first_name VARCHAR(50) NOT NULL,
 last_name 	VARCHAR(50) NOT NULL,
 address 	VARCHAR(100) NOT NULL,
 city 		VARCHAR(50) NOT NULL,
 state 		VARCHAR(50) NOT NULL,
 zip 		VARCHAR(10) NOT NULL,
 phone 		VARCHAR(15) NOT NULL,
 email 		VARCHAR(100) NOT NULL
);
DESCRIBE address_book;

#UC3
INSERT INTO address_book VALUES  		#Data to insert
	( 'Bill', 'Smith', 'Street 1', 'City 1', 'California', '123456', '9876543210', 'Bill@email.com' ),
	( 'Terisa', 'Brown', 'Street 2', 'City 2','California', '123457', '9876543222', 'Terisa@email.com'),
	( 'Charlie', 'Williams', 'Street 3', 'City 3', 'Florida', '223457', '8876543210', 'Charlie@email.com' );

#UC4
UPDATE address_book 				#Edit Contact using name
SET zip = '023456' 
WHERE first_name = 'Bill' && last_name = 'Smith';

#UC5
DELETE FROM address_book 			#Delete a contact using first name
WHERE first_name = 'Terisa';

#UC6
SELECT * FROM address_book 			#Retrieve contact from a city
WHERE city = 'City 1';
SELECT * FROM address_book 			#Retrieve contact from a state
WHERE state = 'Florida';

#UC7 
SELECT city,COUNT(city) FROM address_book GROUP BY city; 	#Retrieve count by city	
SELECT state,COUNT(state) FROM address_book GROUP BY state; 	#Retrieve count by state

#UC8	
INSERT INTO address_book VALUES  		#Adding data to insert 
	( 'Terisa', 'Brown', 'Street 2', 'City 2','California', '123457', '9876543222', 'Terisa@email.com'),
	( 'Adams', 'Baker', 'Street 2', 'City 2','California', '123457', '9876543220', 'Adams@email.com'),
	( 'Quinn', 'Smith', 'Street 5', 'City 2','California', '123459', '9876543229', 'Quinn@email.com');
SELECT * FROM address_book WHERE city = 'City 2'
ORDER BY first_name;

#UC9  	
#Ability to add name and type in address_book
ALTER TABLE address_book ADD name VARCHAR(20);
ALTER TABLE address_book ADD type VARCHAR(20) DEFAULT 'Friend';

#UC10
#Get count of contact persons
SELECT type, COUNT(first_name) FROM address_book GROUP BY type;

#UC11
#Adding data to insert to friend and family
INSERT INTO address_book VALUES   		
	( 'Terisa', 'Brown', 'Street 2', 'City 2','California', '123457', '9876543222', 'Terisa@email.com',NULL,'Family'),
    ('Sam', 'Hell', 'Street 4', 'City 2','Florida', '158457', '9876545482', 'samhell@email.com',NULL,'Friend');
    
#UC12
CREATE TABLE user_details
( 
 user_id 	int PRIMARY KEY,
 first_name 	VARCHAR(100) NOT NULL,
 last_name 	VARCHAR(100) NOT NULL
);

CREATE TABLE location 
(
 user_id 	int PRIMARY KEY,
 address 	VARCHAR(100) NOT NULL,
 city 		VARCHAR(50) NOT NULL,
 state 		VARCHAR(50) NOT NULL,
 zip 		VARCHAR(10) NOT NULL
); 

ALTER TABLE location 
ADD FOREIGN KEY(user_id) REFERENCES user_details(user_id);

CREATE TABLE Contact
(
 user_id 	INT,
 phone 		VARCHAR(15),
 email 		VARCHAR(40),
 FOREIGN KEY(user_id) REFERENCES user_details(user_id)
);

CREATE TABLE contact_type
(
 type_id 		INT,
 type_of_contact  	VARCHAR(20)
);

ALTER TABLE contact_type
ADD PRIMARY KEY(type_id);
CREATE TABLE user_contact_type_link
(
 user_id 	INT,
 type_id 	INT,
 FOREIGN KEY(user_id) REFERENCES user_details(user_id),
 FOREIGN KEY(type_id) REFERENCES contact_type(type_id)
);

INSERT INTO user_details VALUES  		#Data to insert
	(1, 'Bill', 'Smith'),
	(2, 'Terisa', 'Brown'),
	(3, 'Charlie', 'Williams');
    
INSERT INTO location VALUES
 	(1,'Street 1', 'City 1', 'California', '123456'),
	(2,'Street 2', 'City 2','California', '123457'),
	(3,'Street 3', 'City 3', 'Florida', '223457');
    
INSERT INTO contact VALUES  		#Data to insert
	(1,'9876543210', 'Bill@email.com'),
	(2,'9876543222', 'Terisa@email.com'),
	(3,'8876543210', 'Charlie@email.com');
    
INSERT INTO contact_type VALUES
 	(101,'Friend'),
 	(102,'Family');
    
INSERT INTO user_contact_type_link VALUES
 	(1,101),
 	(1,102),
 	(2,101),
 	(3,102);
    
#UC13
#Retrieving data from individual tables
select * from user_details;
select * from location;
select * from Contact;
 select * from Contact_type;
 select * from user_contact_type_link;