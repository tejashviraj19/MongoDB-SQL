-- Create database with consistent naming
CREATE DATABASE StudentPractice;
USE StudentPractice;

-- Create table with proper constraints
CREATE TABLE MechanicalStudents (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(25) NOT NULL,
    enrollment_date DATE DEFAULT CURRENT_DATE
);

-- Start transaction with clear comments
START TRANSACTION;
    -- Initial insert
    INSERT INTO MechanicalStudents VALUES (101, 'Jayanth Kumar', DEFAULT);
    SELECT * FROM MechanicalStudents; -- Verify insert
    
    -- First savepoint
    SAVEPOINT initial_insert;
    
    -- Update operation
    UPDATE MechanicalStudents 
    SET student_id = 102 
    WHERE student_id = 101;
    SELECT * FROM MechanicalStudents; -- Verify update
    
    -- Second savepoint
    SAVEPOINT after_update;
    
    -- Additional insert
    INSERT INTO MechanicalStudents VALUES (103, 'Karthick Raj', DEFAULT);
    SELECT * FROM MechanicalStudents; -- Verify second insert
    
    -- Third savepoint
    SAVEPOINT second_insert;
    
    -- Rollback to after_update state
    ROLLBACK TO SAVEPOINT after_update;
    SELECT * FROM MechanicalStudents; -- Show state after rollback
    
-- Commit the transaction
COMMIT;

-- Final verification
SELECT * FROM MechanicalStudents;
