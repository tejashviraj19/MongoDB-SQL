show databases;
use university_db;

create table Learners(
student_id int primary key,
full_name varchar(25),
years_old int
);

insert into Learners(student_id, full_name, years_old)
values (101, 'Priya', 19),
(102, 'Rahul', 20),
(103, 'Neha', 18);

create table Subjects(
subject_code int primary key,
subject_title varchar(25)
);

select * from Subjects;
insert into Subjects(subject_code, subject_title)
values(501, 'Python'),
(502, 'Java'),
(503, 'Data Science');

create table Registrations(
student_id int,
subject_code int,
enrollment_date date,
primary key (student_id, subject_code),
foreign key(subject_code)
    references Subjects(subject_code)
    on delete cascade
);

insert into Registrations(student_id, subject_code, enrollment_date)
values (102, 501, "2023-09-15");

select * from Registrations;
desc Registrations;
