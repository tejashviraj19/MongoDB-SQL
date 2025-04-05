CREATE TABLE Staff (
    Staff_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    Salary INT,
    Date_Joined DATETIME,
    Department VARCHAR(30)
);

INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Salary, Date_Joined, Department) VALUES
(1, 'Amit', 'Sharma', 105000, '2019-02-14 00:00:00', 'HR'),
(2, 'Niharika', 'Verma', 85000, '2011-05-14 09:00:00', 'Admin'),
(3, 'Vikas', 'Singhal', 195000, '2014-02-26 00:00:00', 'IT'),
(4, 'Rajat', 'Singh', 480000, '2014-02-28 08:00:00', 'Admin'),
(5, 'Vivek', 'Tandon', 490000, '2014-06-11 09:00:00', 'Finance'),
(6, 'Vishal', 'Dewan', 195500, '2014-06-11 09:00:00', 'Accounts'),
(7, 'Sandeep', 'Kumar', 77000, '2014-01-20 05:00:00', 'Accounts'),
(8, 'Gayatri', 'Chauhan', 32000, '2014-04-11 03:00:00', 'Admin');

SELECT * FROM Staff WHERE Salary NOT BETWEEN 95000 AND 205000;
SELECT First_Name FROM Staff;
SELECT * FROM Staff WHERE Salary = 105000 AND Department = 'HR';
SELECT * FROM Staff WHERE Salary > 190000;
SELECT * FROM Staff WHERE Salary BETWEEN 95000 AND 205000;
SELECT * FROM Staff WHERE Salary BETWEEN 195000 AND 400000 AND Staff_ID IN (1,2,3,4,5);
DESC Staff;
USE companyDB;
SELECT * FROM Staff;
SELECT DISTINCT Department FROM Staff;
SELECT Staff_ID, First_Name, Department, 
    CASE 
        WHEN Salary > 295000 THEN 'High Income'
        WHEN Salary BETWEEN 95000 AND 295000 THEN 'Middle Income'
        ELSE 'Low Income'
    END AS Salary_Category
FROM Staff;
SELECT * FROM Staff WHERE Department = 'Admin' ORDER BY Department DESC;
SELECT Department, COUNT(*) AS Total_Employees 
FROM Staff 
WHERE Department IN ('HR', 'Accounts') 
GROUP BY Department;
SELECT Department, COUNT(*) AS Total_Employees 
FROM Staff 
GROUP BY Department 
ORDER BY Total_Employees DESC;
SELECT Department, COUNT(*) AS Total_Employees 
FROM Staff 
GROUP BY Department 
ORDER BY Total_Employees DESC 
LIMIT 1;
