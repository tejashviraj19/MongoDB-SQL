-- Database operations
SHOW DATABASES;

CREATE DATABASE UniversityDB;
USE UniversityDB;

-- Create Students table with proper constraints
CREATE TABLE ComputerScienceStudents (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    exam_score INT CHECK (exam_score BETWEEN 0 AND 100),
    country VARCHAR(50) DEFAULT 'India'
);

-- Insert sample records
INSERT INTO ComputerScienceStudents VALUES 
    (1001, 'Ram Prasad', 99, DEFAULT),
    (1002, 'Priya Sharma', 100, DEFAULT),
    (1003, 'Anjali Patel', 95, DEFAULT),
    (1004, 'Rahul Verma', 98, DEFAULT),
    (1005, 'Neha Gupta', 94, DEFAULT);

-- View all students
SELECT * FROM ComputerScienceStudents;

-- Table modifications
ALTER TABLE ComputerScienceStudents ADD (
    contact_number VARCHAR(15)
);

-- View table structure
DESCRIBE ComputerScienceStudents;

-- Remove contact column
ALTER TABLE ComputerScienceStudents DROP COLUMN contact_number;

-- Add admission date column
ALTER TABLE ComputerScienceStudents ADD (
    admission_date DATE DEFAULT CURRENT_DATE
);

-- Insert student with different country
INSERT INTO ComputerScienceStudents VALUES 
    (1006, 'Aarav Singh', 92, 'USA', DEFAULT);

-- View final student list
SELECT student_id AS ID, 
       student_name AS Name, 
       exam_score AS Score,
       country AS Country
FROM ComputerScienceStudents
ORDER BY exam_score DESC;
