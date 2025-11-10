CREATE DATABASE employee;
USE employee;
-- taple creation
CREATE TABLE Departments (
Dept_ID INT PRIMARY KEY,
Dept_Name VARCHAR(100) NOT NULL);

CREATE TABLE Location (
Location_ID INT PRIMARY KEY,
location varchar(50));

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    GENDER enum("M,F"),
    AGE int,
    Hire_date date,
     DESIGNATION varchar(100),
    department_ID INt,
    Location_id int,
    salary decimal(10.2),
    foreign key (Department_ID) REFERENCES Departments(Dept_ID),
    foreign key(location_id) references location(location_id));

   
   
-- alters taple  
ALTER TABLE Employees
ADD email VARCHAR(100);

ALTER TABLE Employees
MODIFY designation VARCHAR(100);

ALTER TABLE Employees
DROP COLUMN age;

-- Taple renames:
RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;

TRUNCATE TABLE Employees;

DROP TABLE Employees;
DROP DATABASE employee;

-- Drop the database if it already exists
DROP DATABASE IF EXISTS employee;

-- Create a new database
CREATE DATABASE employee;

-- Use the newly created database
USE employee;
-- Create Tables with Appropriate Constraints
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    designation VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    date_of_joining DATE,
    dept_id INT);
    
    create table Departments (
    Dept_id int auto_increment primary key,
    department_name varchar(100) Not null);
    

    Insert into Departments (department_name)
    values ('Human Resources'), ('Finance'), ('IT'), ('Marketing');





    
    CREATE TABLE Locations (
    location_id INT auto_increment primary key,
    location int,
    location_name VARCHAR(100) NOT NULL);
INSERT INTO Locations (location_name)
VALUES ('New York'), ('London'), ('Mumbai'), ('Tokyo');


  CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    age INT CHECK (age >= 18),
    department_id INT,
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    hire_date DATE DEFAULT (CURRENT_DATE),
    email VARCHAR(100)
  
);
INSERT INTO Employees (emp_name, gender, age, department_id, designation, salary, hire_date, email)
VALUES
('Amit Sharma', 'M', 28, 3, 'Software Engineer', 65000, '2018-06-15', 'amit.sharma@example.com'),
('Neha Verma', 'F', 32, 2, 'Accountant', 52000, '2015-03-20', 'neha.verma@example.com'),
('Ravi Kumar', 'M', 26, 4, 'Marketing Executive', 48000, '2020-09-10', 'ravi.kumar@example.com'),
('Priya Singh', 'F', 29, 1, NULL, 58000, '2017-11-30', 'priya.singh@example.com'),
('Karan Patel', 'M', 35, 5, 'Operations Manager', 72000, '2013-01-05', 'karan.patel@example.com'),
('Meena Das', 'F', 24, 3, 'Data Analyst', 55000, '2021-08-22', 'meena.das@example.com'),
('Rohit Mehta', 'M', 30, 3, 'System Administrator', 60000, '2016-05-14', 'rohit.mehta@example.com'),
('Sneha Reddy', 'F', 27, 4, 'Sales Associate', 45000, '2019-10-09', 'sneha.reddy@example.com');


            -- assignment 2
            
SELECT DISTINCT salary
FROM Employees;
-- as
SELECT emp_name AS Employee_Name, age AS Employee_Age, salary AS Employee_Salary
FROM Employees;

-- Where Clause & Operators:

SELECT emp_name, salary, hire_date
FROM Employees
WHERE salary > 50000 AND hire_date < '2020-09-10';
UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;

-- Sorting and Grouping Data:
SELECT emp_id, emp_name, department_id, salary
FROM Employees
ORDER BY department_id ASC, salary DESC;

SELECT emp_id, emp_name, hire_date, designation, salary
FROM Employees
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date ASC
LIMIT 5;
-- aggregate function
SELECT SUM(salary) AS Total_Salary_Finance
FROM Employees
WHERE department_id = (
    SELECT dept_id FROM Departments WHERE dept_name = 'Finance'
);
SELECT MIN(age) AS Youngest_Employee_Age
FROM Employees;

-- groub by
SELECT location, MAX(salary) AS Max_Salary
FROM Employees
GROUP BY location;








    







