CREATE DATABASE company_hr;

SHOW DATABASES;

USE company_hr;

CREATE TABLE Employees(
    EmpID INT NOT NULL,
    Surname VARCHAR(255) NOT NULL,
    GivenName VARCHAR(255) NOT NULL,
    YearsOfService INT
);

DESCRIBE Employees;

ALTER TABLE Employees
MODIFY YearsOfService INT NOT NULL;

CREATE TABLE DepartmentManagers(
    ManagerID INT PRIMARY KEY,
    DeptName VARCHAR(255) NOT NULL UNIQUE,
    ManagerLastName VARCHAR(255) NOT NULL UNIQUE,
    YearsInRole INT
);

DESCRIBE DepartmentManagers;
