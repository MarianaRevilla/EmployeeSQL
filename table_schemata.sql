-- DATA ENGINEERING
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- create six tables and import their corresponding CSV files
-- 1. table describes departments by number and name
create table departments(
	dept_no varchar(10) primary key not null, 
	dept_name varchar(30) not null
);
select * from departments 

-- 2. table describes employees 
create table employees(
	emp_no int primary key not null, 
	emp_title_id varchar(10) not null,  
	birth_date date not null, 
	first_name varchar(30) not null, 
	last_name varchar(30) not null, 
	sex varchar(1) not null, 
	hire_date date not null
);
select * from employees

-- 3. table for departments and their corresponding employees
create table dept_emp(
	emp_no int not null,
	dept_no varchar(10) not null,
	foreign key (emp_no) references employees (emp_no), 
	foreign key (dept_no) references departments (dept_no)
);
select * from dept_emp

-- 4. table lists each department and its associated manager by employee number
create table managers(
	dept_no varchar(10) not null,
	emp_no int not null,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
);
select * from managers 

-- 5. table lists employees and their associated salary
create table salaries(
	emp_no int primary key not null,
	salary int not null,
	foreign key (emp_no) references employees (emp_no)
);
select * from salaries 

-- 6. table describes each title by id and name 
create table titles(
	emp_title_id varchar(10) primary key not null, 
	title varchar(50) not null
);
select * from titles

