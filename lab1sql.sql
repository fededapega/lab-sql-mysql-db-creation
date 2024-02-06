#CREATE DATABASE cardealer;
use cardealer; 

drop table if exists cardealer.cars;
CREATE TABLE cardealer.cars (
							 VIN INT PRIMARY KEY,
							 manufacturer VARCHAR(60),
							 model VARCHAR (30),
							 year INT,
							 color VARCHAR (15));

drop table if exists cardealer.customers;
CREATE TABLE cardealer.customers (
								  CID INT PRIMARY KEY,
								  name VARCHAR(60),
                                  phone VARCHAR(60),
                                  email VARCHAR(60),
                                  address VARCHAR(120),
                                  city VARCHAR(20),
                                  state VARCHAR (20),
                                  country VARCHAR(20),
                                  zip VARCHAR(15));
                     
drop table if exists cardealer.salespersons;
CREATE TABLE cardealer.salespersons (
									 SID INT PRIMARY KEY,
									 name VARCHAR (60),
                                     store VARCHAR(60));


drop table if exists cardealer.invoices;
CREATE TABLE cardealer.invoices (ID INT PRIMARY KEY AUTO_INCREMENT,
								 Date Date,
                                 VIN int,
                                 CID int,
                                 SID int,
								 FOREIGN KEY (VIN) REFERENCES cars(VIN),
                                 FOREIGN KEY (CID) REFERENCES customers(CID),
                                 FOREIGN KEY (SID) REFERENCES salespersons(SID));

select * from salespersons;
INSERT INTO cardealer.cars (VIN, manufacturer, model, year, color)
					VALUES ('123', 'Honda', 'civic', 2020, 'red'),
						  ('124', 'Toyota', 'autana', 2021, 'blue');
                           
INSERT INTO cardealer.customers (name, CID, phone, email, address, city, state, country, zip)
					VALUES ('John', '10001', 404404404, 'john@johnnie.com', '2 way st', 'London', 'London', 'England', 101010),
						   ('Galileo', '10002', 505050550, 'gali@leo.com', 'earth st', 'Milano','Lombardy','Italy', 3030);
                    
INSERT INTO cardealer.salespersons (name, SID, store)
					VALUES ('Joao', '0001', 'Lisboa'),
						   ('Tiago','0002', 'Porto');
                    
INSERT INTO cardealer.invoices (Date, VIN, CID, SID)
					VALUES ('2023-03-03', '123', '10001', '0001'),
                          ('2023-04-04', '124', '10002', '0002');