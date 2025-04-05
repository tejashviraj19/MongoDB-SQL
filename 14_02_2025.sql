CREATE DATABASE university_system;
USE university_system;
SHOW TABLES FROM university_system;

CREATE TABLE learners(
    student_id INT, 
    full_name VARCHAR(25), 
    city VARCHAR(25)
);
INSERT INTO learners VALUES 
    (201, 'Priya', 'Mumbai'),
    (202, 'Rahul', 'Delhi');

SELECT * FROM learners;
