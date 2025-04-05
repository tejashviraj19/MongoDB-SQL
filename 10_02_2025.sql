USE university_db;
SELECT * FROM faculty;

-- Count faculty by department for specific departments
SELECT department, COUNT(department) FROM faculty 
WHERE department IN ('Computer Science', 'Mathematics') GROUP BY department;

-- General query structure example
SELECT column_names
FROM table_name
WHERE conditions
GROUP BY column_names
HAVING conditions
ORDER BY column_names;

SELECT department, COUNT(department) AS largest_departments
FROM faculty
GROUP BY department
HAVING COUNT(department) >= 4;

CREATE TABLE campus_delhi (
    faculty_id INT PRIMARY KEY, 
    faculty_name VARCHAR(25) NOT NULL,
    department VARCHAR(30) NOT NULL
);
INSERT INTO campus_delhi VALUES(201, 'Rahul', 'Physics'), (202, 'Priya', 'Chemistry');

CREATE TABLE campus_mumbai (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(25) NOT NULL,
    department VARCHAR(30) NOT NULL
);
INSERT INTO campus_mumbai VALUES(201, 'Rahul', 'Mumbai'), (202, 'Priya', 'Main Campus');

SELECT * FROM campus_mumbai;
SELECT * FROM campus_delhi;

SELECT faculty_name AS FacultyOfTheYear FROM campus_delhi
WHERE faculty_id = (SELECT faculty_id FROM campus_mumbai WHERE location = 'delhi');
