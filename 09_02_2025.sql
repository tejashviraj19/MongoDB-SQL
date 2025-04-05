CREATE TABLE Employees (
  EmpID int NOT NULL,
  Surname varchar(255) NOT NULL,
  GivenName varchar(255),
  YearsOfExperience int,
  CHECK (salary>=250000 AND salary <= 500000)
);

ALTER TABLE Employees
ADD CHECK (YearsOfExperience >= 2);

CREATE TABLE Staff (
  StaffID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  YearsAtCompany int,
  Location varchar(255) DEFAULT 'Bangalore'
);

DESCRIBE Staff;

USE corporate_db;
SHOW TABLES FROM corporate_db;

SELECT * FROM employees;

SELECT * FROM employees WHERE first_name LIKE '_a_e%';

SELECT * FROM employees WHERE salary LIKE '9%';

CREATE VIEW hr_high_earners AS
SELECT * FROM employees 
WHERE department = 'HR' AND salary >= 120000 ORDER BY salary DESC;

SELECT * FROM hr_high_earners;
