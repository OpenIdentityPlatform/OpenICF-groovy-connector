CREATE DATABASE IF NOT EXISTS HRDB CHARACTER SET utf8 COLLATE utf8_bin;
USE HRDB;

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Organizations;

CREATE TABLE Users(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	uid char(32) NOT NULL,
	password char(128),
	firstname varchar(32) NOT NULL default '',
	lastname varchar(32) NOT NULL default '',
	fullname varchar(32),
	email varchar(32),
	organization varchar(32),
	timestamp TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Groups(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gid char(32) NOT NULL,
	name varchar(32) NOT NULL default '',
	description varchar(32),
  timestamp TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Organizations(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(32) NOT NULL default '',
	description varchar(32),
  timestamp TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO Users 
( uid, password, firstname, lastname, fullname, email, organization, timestamp )
VALUES 
("bob",sha1("password1"),"Bob", "Fleming","Bob Fleming","Bob.Fleming@example.com","HR",CURRENT_TIMESTAMP),
("rowley",sha1("password2"),"Rowley","Birkin","Rowley Birkin","Rowley.Birkin@example.com","SALES",CURRENT_TIMESTAMP),
("louis",sha1("password3"),"Louis", "Balfour","Louis Balfour","Louis.Balfour@example.com","SALES",CURRENT_TIMESTAMP),
("john",sha1("password4"),"John", "Smith","John Smith","John.Smith@example.com","SUPPORT",CURRENT_TIMESTAMP),
("jdoe",sha1("password5"),"John", "Doe","John Doe","John.Does@example.com","ENG",CURRENT_TIMESTAMP);

INSERT INTO Groups VALUES ("0","100","admin","Admin group",CURRENT_TIMESTAMP);
INSERT INTO Groups VALUES ("0","101","users","Users group",CURRENT_TIMESTAMP);

INSERT INTO Organizations VALUES ("0","HR","HR organization",CURRENT_TIMESTAMP);
INSERT INTO Organizations VALUES ("0","SALES","Sales organization",CURRENT_TIMESTAMP);
INSERT INTO Organizations VALUES ("0","SUPPORT","Support organization",CURRENT_TIMESTAMP);
INSERT INTO Organizations VALUES ("0","ENG","Engineering organization",CURRENT_TIMESTAMP);

grant all on HRDB.* to root@'%' IDENTIFIED BY 'password';