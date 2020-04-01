--Create table departments
CREATE TABLE departments(
dept_no varchar PRIMARY KEY NOT NULL,
dept_name varchar NOT NULL);

SELECT * 
FROM departments;


Drop table employee;

--Create table storing employee information
CREATE TABLE employee(
emp_no int PRIMARY KEY NOT NULL,
birth_date date NOT NULL,
first_name varchar NOT NULL,
last_name varchar NOT NULL,
gender varchar,
hire_date date NOT NULL);

SELECT *
FROM employee;

DROP TABLE dept_emp;

--Create table storing department of employees
CREATE TABLE dept_emp(
emp_no int NOT NULL,
dept_no varchar NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL,
PRIMARY KEY(emp_no,dept_no),	
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employee(emp_no));

SELECT *
FROM dept_emp;



DROP TABLE dept_manager;

--Create table storing department manager information
CREATE TABLE dept_manager(
dept_no varchar NOT NULL,
emp_no int NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL,
PRIMARY KEY (dept_no,emp_no),	
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employee(emp_no));

SELECT *
FROM dept_manager;


DROP TABLE salaries;
--Create table storing salaries of employees
CREATE TABLE salaries(
emp_no int PRIMARY KEY NOT NULL,
salary money NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employee(emp_no));

SELECT *
FROM salaries;

DROP TABLE titles;

--Create table storing titles of the employees
CREATE TABLE titles(
emp_no int  NOT NULL,
title varchar NOT NULL,	
from_date date NOT NULL,
to_date date NOT NULL,
PRIMARY KEY(emp_no,title,from_date),	
FOREIGN KEY (emp_no) REFERENCES employee(emp_no));

SELECT *
FROM titles;