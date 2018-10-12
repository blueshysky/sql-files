/*
	company.sql
	Aastha Gupta (with thanks to Eric J. Schwabe)
	Winter 2018

*/
DROP DATABASE IF EXISTS company;
CREATE DATABASE IF NOT EXISTS company;
use company;
-- drop tables

DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS PROJECT;
DROP TABLE IF EXISTS WORKS_ON;

-- create and populate tables

CREATE TABLE EMPLOYEE
(
	Fname		VARCHAR(20),
	Minit		VARCHAR(1),
	Lname		VARCHAR(20),
	Ssn		INT(9),
	Bdate		DATE,
	Address		VARCHAR(30),
	Sex		VARCHAR(1),
	Salary		INT(5),
	Super_Ssn	INT(9),
	Dno		INT(1),

	PRIMARY KEY (Ssn),
		
	FOREIGN KEY (Super_ssn)
		REFERENCES EMPLOYEE (Ssn)
);

INSERT INTO EMPLOYEE VALUES ('James', 'E', 'Borg', '888665555','1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);
INSERT INTO EMPLOYEE VALUES ('Jennifer', 'S', 'Wallace', '987654321','1941-06-20', '291 Berry, Bellaire, Tx', 'F', 37000, '888665555', 4);
INSERT INTO EMPLOYEE VALUES ('Franklin', 'T', 'Wong', '333445555','1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
INSERT INTO EMPLOYEE VALUES ('John', 'B', 'Smith', '123456789','1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Alicia', 'J', 'Zelaya', '999887777','1968-01-19', '3321 castle, Spring, TX', 'F', 25000, '987654321', 4);
INSERT INTO EMPLOYEE VALUES ('Ramesh', 'K', 'Narayan', '666884444','1920-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Joyce', 'A', 'English', '453453453','1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Ahmad', 'V', 'Jabbar', '987987987','1969-03-29', '980 Dallas, Houston, TX', 'M', 22000, '987654321', 4);
INSERT INTO EMPLOYEE VALUES ('Melissa', 'M', 'Jones', '808080808','1970-07-10', '1001 Western, Houston, TX', 'F', 27500, '333445555', 5);

CREATE TABLE DEPARTMENT
(
	Dname		VARCHAR(20),
	DINT		INT(1),
	Mgr_ssn		INT(9),
	Mgr_start_date	DATE,
	
	PRIMARY KEY (DINT),

	FOREIGN KEY (Mgr_ssn)
		REFERENCES EMPLOYEE (Ssn)
);

INSERT INTO DEPARTMENT VALUES ('Research', 5, '333445555','1988-05-22');
INSERT INTO DEPARTMENT VALUES ('Administration', 4, '987654321','1995-01-01');
INSERT INTO DEPARTMENT VALUES ('Headquarters', 1, '888665555','1981-06-19');

-- this alter is here because Employee table was created first

ALTER TABLE EMPLOYEE ADD FOREIGN KEY (Dno) REFERENCES DEPARTMENT (DINT);

CREATE TABLE PROJECT
(
	Pname		VARCHAR(20),
	PINT		INT(2),
	Plocation	VARCHAR(20),
	Dnum		INT(1),

	PRIMARY KEY (PINT)
);

INSERT INTO PROJECT VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO PROJECT VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJECT VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJECT VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO PROJECT VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO PROJECT VALUES ('Newbenefits', 30, 'Stafford', 4);

CREATE TABLE WORKS_ON
(
	Essn		INT(9),
	Pno		INT(2),
	Hours		INT(3),
	
	PRIMARY KEY (Essn, Pno),

	FOREIGN KEY (Essn)
		REFERENCES EMPLOYEE (Ssn),

	FOREIGN KEY (Pno)
		REFERENCES PROJECT(PINT)
);

INSERT INTO WORKS_ON VALUES ('123456789', 1, 32);
INSERT INTO WORKS_ON VALUES ('123456789', 2, 8);
INSERT INTO WORKS_ON VALUES ('453453453', 1, 20);
INSERT INTO WORKS_ON VALUES ('453453453', 2, 20);
INSERT INTO WORKS_ON VALUES ('333445555', 1, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 2, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 3, 5);
INSERT INTO WORKS_ON VALUES ('333445555', 10, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 20, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 30, 5);
INSERT INTO WORKS_ON VALUES ('999887777', 30, 30);
INSERT INTO WORKS_ON VALUES ('999887777', 10, 10);
INSERT INTO WORKS_ON VALUES ('987987987', 10, 35);
INSERT INTO WORKS_ON VALUES ('987987987', 30, 5);
INSERT INTO WORKS_ON VALUES ('987654321', 30, 20);
INSERT INTO WORKS_ON VALUES ('987654321', 20, 15);
INSERT INTO WORKS_ON VALUES ('888665555', 20, 10);


-- display contents of tables

SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM PROJECT;
SELECT * FROM WORKS_ON;

select * from EMPLOYEE
where Dno = 5;

select fname from EMPLOYEE
where fname like '%m%';

select * from WORKS_ON where hours in(5,0,30);

select * from EMPLOYEE where salary > 20000 or Dno = 5;

select * from EMPLOYEE ORDER BY salary and Bdate DESC;
