CREATE DATABASE ITMD421;

SHOW DATABASES;

use ITMD421;


create table employee
(
empID INT(8) PRIMARY KEY,
empFname varchar(26) not null,
empLname varchar(25) not null,
empPND int(25),
empadd1 varchar(30) not null unique,
empadd2 varchar(30),
empcity varchar(20) not null,
empstate varchar(10) not null,
empzip int(5) not null,
empDOB date not null
);

show tables;

CREATE TABLE department
(
deptID INT(10) primary key,
deptName varchar(20) not null
);

create table emp_dept(
empID int(8),
deptID int(10),
salary int(7),
emp_title varchar(15),
primary key(empID, deptID),
	
    foreign key (empID)
		references employee (empID),
        
    foreign key (deptID)
		references department (deptID)
        
    
);




