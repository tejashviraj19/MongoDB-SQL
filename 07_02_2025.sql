create database company_db;

use company_db;

create table department(
dept_id int primary key,
dept_name varchar(30) not null unique,
dept_desc varchar(300) not null
);

insert into department values (201, 'Electronics','Contains all electronic goods and components');

select * from department;
desc department;

CREATE TABLE inventory(
item_id int primary key,
item_name varchar(300) NOT NULL,
dept_id int,
constraint dept_id foreign key (dept_id)
references department(dept_id)
);

desc inventory;

drop table inventory;

insert into inventory values(1001,'Smart TV',null);

select * from inventory;

select* from department;

delete from department where dept_id = 201;

drop table department;
