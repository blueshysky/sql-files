DROP DATABASE IF EXISTS lecture8;
CREATE DATABASE IF NOT EXISTS lecture8;
use lecture8;

DROP TABLE IF EXISTS EMPLOYEES;
DROP TABLE IF EXISTS job_history;
DROP TABLE IF EXISTS regions;
DROP TABLE IF EXISTS LOCATIONS;
DROP TABLE IF EXISTS DEPARTMENTS;
DROP TABLE IF EXISTS JOBS;
DROP TABLE IF EXISTS JOB_GRADES;
DROP TABLE IF EXISTS COUNTRIES;




CREATE TABLE EMPLOYEES
(
EMPLOYEE_ID INT(6) NOT NULL,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(25) NOT NULL,
EMAIL VARCHAR(25) NOT NULL,
PHONE_INT VARCHAR(20),
HIRE_DATE DATE NOT NULL,
JOB_ID VARCHAR(10) NOT NULL,
SALARY INT(8),
COMMISSION_PCT INT(2),
MANAGER_ID INT(6),
DEPARTMENT_ID INT(4),
PRIMARY KEY(EMPLOYEE_ID)
);

INSERT INTO EMPLOYEES
VALUES(100,'Steven','King','SKING','515.123.4567','1987-07-17','AD_PRES',24000,NULL,NULL,90);

INSERT INTO EMPLOYEES
VALUES(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1989-10-21','AD_VP',17000,NULL,100,90);

INSERT INTO EMPLOYEES
VALUES(102,'Lex','De Haan','LDEHAAN','515.123.4569','1993-01-13','AD_VP',17000,NULL,100,90);

INSERT INTO EMPLOYEES
VALUES(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03','IT_PROG',9000,NULL,102,60);

INSERT INTO EMPLOYEES
VALUES(104,'Bruce','Ernst','BERNST','590.423.4568','1991-05-21','IT_PROG',6000,NULL,103,60);

INSERT INTO EMPLOYEES
VALUES(107,'Diana','Lorentz','DLORENTZ','590.423.5567','1999-02-07','IT_PROG',4200,NULL,103,60);

INSERT INTO EMPLOYEES
VALUES(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','1999-11-11','ST_MAN',5800,NULL,100,50);

INSERT INTO EMPLOYEES
VALUES(141,'Trenna','Rajs','TRAJS','650.121.8009','1995-10-17','ST_CLERK',3500,NULL,124,50);

INSERT INTO EMPLOYEES
VALUES(142,'Curtis','Davies','CDAVIES','650.121.2994','1997-01-29','ST_CLERK',3100,NULL,124,50);

INSERT INTO EMPLOYEES
VALUES(143,'Randall','Matos','RMATOS','650.121.2874','1998-03-15','ST_CLERK',2600,NULL,124,50);

INSERT INTO EMPLOYEES
VALUES(144,'Peter','Vargas','PVARGAS','650.121.2004','1987-07-09','ST_CLERK',2500,NULL,124,50);

INSERT INTO EMPLOYEES
VALUES(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2000-01-10','SA_MAN',10500,0.2,100,80);

INSERT INTO EMPLOYEES
VALUES(174,'Ellen','Abel','EABEL','011.44.1644.429267','1996-05-11','SA_REP',11000,0.3,149,80);

INSERT INTO EMPLOYEES
VALUES(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','1998-03-18','SA_REP',8600,0.2,149,80);

INSERT INTO EMPLOYEES
VALUES(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','1999-05-09','SA_REP',7000,0.15,149,NULL);

INSERT INTO EMPLOYEES
VALUES(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-10-17','AD_ASST',4400,NULL,101,10);

INSERT INTO EMPLOYEES
VALUES(201,'Michael','Hartstein','MHARTSTE','515.123.5555','1996-02-26','MK_MAN',13000,NULL,201,20);

INSERT INTO EMPLOYEES
VALUES(202,'Pat','Fay','PFAY','603.123.6666','1997-08-27','MK_REP',6000,NULL,201,20);

INSERT INTO EMPLOYEES
VALUES(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1997-06-14','AC_MGR',12000,NULL,101,110);

INSERT INTO EMPLOYEES
VALUES(206,'Wiliam','Gietz','WGIETZ','515.123.8181','1997-06-23','AC_ACCOUNT',8300,NULL,205,110);
COMMIT;

CREATE TABLE job_history
(
EMPLOYEE_ID INT(6) NOT NULL,
START_DATE Date NOT NULL,
END_DATE DATE NOT NULL,
JOB_ID VARCHAR(10) NOT NULL,
DEPARTMENT_ID INT(4) NOT NULL

);


INSERT INTO job_history VALUES(102,'1993-01-13','1998-07-18','IT_PROG',60);
INSERT INTO job_history VALUES(101,'1999-10-29','2000-10-23','AC_ACCOUNT',110);
INSERT INTO job_history VALUES(101,'1993-10-13','1997-03-17','AC_MGR',110);
INSERT INTO job_history VALUES(201,'1996-02-16','1999-12-19','MK_KEP',20);
INSERT INTO job_history VALUES(114,'1998-03-28','1999-12-12','ST_CLERK',50);
INSERT INTO job_history VALUES(122,'1992-01-13','1991-12-31','ST_CLERK',50);
INSERT INTO job_history VALUES(200,'1992-10-27','1997-06-15','AD_ASST',90);
INSERT INTO job_history VALUES(176,'1998-03-18','1998-12-31','SA_REP',80);
INSERT INTO job_history VALUES(178,'1999-01-01','1998-12-31','SA_MAN',80);
INSERT INTO job_history VALUES(200,'1994-07-14','1998-12-01','AC_ACCOUNT',90);





CREATE TABLE regions
(
REGION_ID INT NOT NULL,
REGION_NAME VARCHAR(25)
);


INSERT INTO regions VALUES (1,'EUROPE');
INSERT INTO regions VALUES (2,'Americas');
INSERT INTO regions VALUES (3,'Asia');
INSERT INTO regions VALUES (4,'Middle EAST and Africa');





CREATE TABLE LOCATIONS
(
LOCATION_ID INT(4) NOT NULL,
STREET_ADDRESS VARCHAR(40),
POSTAL_CODE VARCHAR(12),
CITY VARCHAR(30) NOT NULL,
STATE_PROVINCE VARCHAR(25),
COUNTRY_ID CHAR(2),
PRIMARY KEY(LOCATION_ID)
);

INSERT INTO LOCATIONS
VALUES (1400,'2014 Jabberwocky RD','26192','Southlake','Texas','US');

INSERT INTO LOCATIONS
VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');

INSERT INTO LOCATIONS
VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');

INSERT INTO LOCATIONS
VALUES (1800,'460 Bloor St. W.','ON M5S 1X8','Toronto','Ontario','CA');

INSERT INTO LOCATIONS
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');

COMMIT;



CREATE TABLE DEPARTMENTS
(
DEPARTMENT_ID INT(4) NOT NULL,
DEPARTMENT_NAME VARCHAR(30) NOT NULL,
MANAGER_ID INT(6),
LOCATION_ID INT(4),
PRIMARY KEY (DEPARTMENT_ID)
);
INSERT INTO DEPARTMENTS VALUES(10,'Administration',200,1700);

INSERT INTO DEPARTMENTS VALUES(20,'Marketing',201,1800);

INSERT INTO DEPARTMENTS VALUES (50,'Shipping',124,1500);

INSERT INTO DEPARTMENTS VALUES (60,'IT',103,1400);

INSERT INTO DEPARTMENTS VALUES (80,'Sales',149,2500);

INSERT INTO DEPARTMENTS VALUES (90,'Executive',100,1700);

INSERT INTO DEPARTMENTS VALUES (110,'Accounting',205,1700);

INSERT INTO DEPARTMENTS VALUES (190,'Contracting',NULL,1700);

CREATE TABLE JOBS
(
JOB_ID VARCHAR(10) NOT NULL,
JOB_TITLE VARCHAR(35) NOT NULL,
MIN_SALARY INT(6),
MAX_SALARY INT(6),
PRIMARY KEY(JOB_ID)
);
INSERT INTO JOBS VALUES('AD_PRES', 'President', 20000, 40000);
INSERT INTO JOBS VALUES('AD_VP', 'Administration Vice President', 15000, 30000);
INSERT INTO JOBS VALUES('AD_ASST', 'Administration Assistant', 3000, 6000);
INSERT INTO JOBS VALUES('AC_MGR', 'Accounting Manager', 8200, 16000);
INSERT INTO JOBS VALUES('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
INSERT INTO JOBS VALUES('SA_MAN', 'Sales Manager', 10000, 20000);
INSERT INTO JOBS VALUES('SA_REP', 'SAles Representative', 6000, 1200);
INSERT INTO JOBS VALUES('ST_MAN', 'Stock Manager', 5500, 8500);
INSERT INTO JOBS VALUES('ST_CLERK', 'Stock Clerk', 2000, 5000);
INSERT INTO JOBS VALUES('IT_PROG', 'Programmer', 4000, 10000);
INSERT INTO JOBS VALUES('MK_MAN', 'Marketing Manager', 9000, 15000);
INSERT INTO JOBS VALUES('MK_REP', 'Marketing Representative', 4000, 9000);


CREATE TABLE JOB_GRADES
(
GRADE_LEVEL VARCHAR(3),
LOWEST_SAL INT,
HIGHEST_SAL INT,
PRIMARY KEY(GRADE_LEVEL)
);
INSERT INTO JOB_GRADES VALUES('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES('F', 25000, 40000);

CREATE TABLE COUNTRIES
(
COUNTRY_ID CHAR(2) NOT NULL,
COUNTRY_NAME VARCHAR(40),
REGION_ID INT,
PRIMARY KEY(COUNTRY_ID)
);
INSERT INTO COUNTRIES VALUES('CA','Canada',2);
INSERT INTO COUNTRIES VALUES('DE','Germany',1);
INSERT INTO COUNTRIES VALUES('UK','United Kingdom',1);
INSERT INTO COUNTRIES VALUES('US','United States of America',2);

update employees set hire_date = '1983-07-09' where employee_id = 144;
update employees set manager_id = 5 where employee_id = 201;


select * from EMPLOYEES;
select * from job_history;
select * from regions;
select * from LOCATIONS;
select * from DEPARTMENTS;
select * from JOBS;
select * from JOB_GRADES;
select * from COUNTRIES;

select avg(SALARY), sum(salary), max(salary), min(salary), count(salary) from EMPLOYEES;

select max(first_name), min(last_name) from EMPLOYEES;

select max(hire_date), min(hire_date) from EMPLOYEES;

select count(SALARY) from EMPLOYEES;

select * from EMPLOYEES;
/*distince select main different unique data among the data set*/
select count(distinct(employee_id)) from EMPLOYEES;

select distinct department_id from employees;

select avg(salary), department_id from employees group by (department_id);

select max(salary), min(salary), department_id from employees group by (department_id);

select  max(salary), min(salary), FIRST_NAME, LAST_NAME, department_id from employees group by (department_id);

select department_id, first_name, max(salary) from employees where department_id > 20 group by department_id, first_name;

/*75000 for salary and department greater than 20*/
/* having caluse used to restrick rows after group by function*/
select department_id, max(salary), first_name, last_name 
from employees
where department_id > 20 
group by department_id
having max(salary) > 1000 
order by department_id;

select employees.first_name,employees.last_name, employees.hire_date from employees 
where hire_date < (select hire_date 
					from employees 
                    where last_name = 'Davies')
                    and 
                    (select salary from employees
                    where last_name = 'Davies');
                    
select job_id, salary, last_name from employees
where job_id = (select job_id 
				from employees 
				where last_name = 'Taylor') 
				and salary >
                (select salary 
                from employees
                where last_name = 'Taylor');
                
                                    
select job_id, salary, last_name, job_id from employees
where salary < any (select min(salary)
					from employees
                    where job_id = 'IT_PROG')
                    and 
                     job_id <> 'IT_PROG';
