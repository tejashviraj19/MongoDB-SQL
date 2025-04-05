USE university_db;

CREATE TABLE undergraduate(
  student_id INT PRIMARY KEY,
  student_name VARCHAR(30) NOT NULL,
  major VARCHAR(30) NOT NULL
);

INSERT INTO undergraduate VALUES 
(2001, "Priya", "Computer Science"),
(2002, "Rahul", "Computer Science"),
(2003, "Neha", "Computer Science");

SELECT * FROM undergraduate;

CREATE TABLE academic_performance(
  student_id INT PRIMARY KEY,
  gpa VARCHAR(5) NOT NULL
);

INSERT INTO academic_performance VALUES 
(2001, '3.7'), 
(2003, '3.9'), 
(2007, '4.0');

SELECT * FROM academic_performance;

-- Join operations
SELECT * FROM undergraduate CROSS JOIN academic_performance;

SELECT * FROM undergraduate INNER JOIN academic_performance 
WHERE undergraduate.student_id = academic_performance.student_id;

SELECT * FROM undergraduate NATURAL JOIN academic_performance 
WHERE undergraduate.student_id = academic_performance.student_id;

SELECT * FROM undergraduate LEFT JOIN academic_performance 
ON (undergraduate.student_id = academic_performance.student_id);

SELECT * FROM undergraduate RIGHT JOIN academic_performance 
ON (undergraduate.student_id = academic_performance.student_id);

SELECT * FROM undergraduate FULL JOIN academic_performance;

SELECT * FROM undergraduate FULL OUTER JOIN academic_performance 
ON (undergraduate.student_id = academic_performance.student_id);
