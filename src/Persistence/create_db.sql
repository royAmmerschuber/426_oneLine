drop TABLE IF EXISTS User;
drop TABLE IF EXISTS Address;
drop TABLE IF EXISTS Product;
drop TABLE IF EXISTS Image;
drop TABLE IF EXISTS Category;
drop TABLE IF EXISTS Kart;

create table User(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  userName VARCHAR(64) NOT NULL ,
  password VARCHAR(128) NOT NULL ,
  image VARCHAR(128)
);
CREATE TABLE Address(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  userFK INT NOT NULL ,
  firstName varchar(64) NOT NULL ,
  lastName varchar(64) NOT NULL ,
  country varchar(64) NOT NULL ,
  cuty varchar(64) NOT NULL ,
  plz VARCHAR(8) NOT NULL ,
  street varchar(64) NOT NULL
);
CREATE TABLE Product(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  sellerFK int NOT NULL ,
  categoryFK int NOT NULL ,
  name varchar(64) NOT NULL ,
  amount int NOT NULL ,
  description VARCHAR(2048) NOT NULL ,
  price DECIMAL(10,2) NOT NULL
);
CREATE TABLE Image(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  productFK int NOT NULL ,
  image VARCHAR(128) NOT NULL
);
CREATE TABLE Category(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL
);
CREATE TABLE Kart(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  userFK int NOT NULL ,
  productFK int NOT NULL ,
  amount int NOT NULL
);

insert INTO User (userName, password) VALUES
  ('numberOne','^fjdkahfahklghqhagjahgd');
INSERT INTO Address (userFK, firstName, lastName, country, cuty, plz, street) VALUEs
  ((select id from User WHERE userName='numberOne'),'max','muster','Switzerland','Bern','1234','holzweg 12c');
Insert INTO Category (name) VALUES ('Table'),('Fish'),('Book'),('Car');
INSERT INTO Product (sellerFK, categoryFK, name, amount, description, price) VALUEs
  ((select id from User WHERE userName='numberOne'),1,'Holztisch',3,'ein eleganter holztisch mit elegantem Design',5.49),
  ((select id from User WHERE userName='numberOne'),2,'Ammerhai',29,'ein Barscher hai',19.9),
  ((select id from User WHERE userName='numberOne'),3,'harald Töpfer',3,'...',2.39),
  ((select id from User WHERE userName='numberOne'),4,'neziri-mobil',1,'',582173.66),
  ((select id from User WHERE userName='numberOne'),4,'Why Man?',3,'Ein epischer roman mit epischen fragen',29.45);
