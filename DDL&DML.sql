-- Q1. Create a database named company_db and switch to it.
create database company_db;
use company_db;
/* Q2. Create a table named employees with the following columns:
employee_id INT
full_name VARCHAR(50)
email VARCHAR(100)
phone VARCHAR(20)
gender VARCHAR(10)
hire_date DATE
salary DECIMAL(10,2)
department VARCHAR(30)
*/
create table employee(
employee_id int,
full_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20),
gender VARCHAR(10),
hire_date DATE,
salary DECIMAL(10,2),
department VARCHAR(30)
);
/*Q3. Create a table named departments with the following columns:
department_id INT
department_name VARCHAR(50)
location VARCHAR(50)*/
create table departments(
department_id INT,
department_name VARCHAR(50),
location VARCHAR(50));
/*Q4. Create a table named projects with the following columns:
project_id INT
project_name VARCHAR(50)
start_date DATE
end_date DATE
budget DECIMAL(12,2)*/
create table projects(
project_id INT,
project_name VARCHAR(50),
start_date DATE,
end_date DATE,
budget DECIMAL(12,2));
/*Q5. ALTER Table Operations:
a) Add a column status VARCHAR(20) to employees
b) Modify department column size to 50 characters
c) Rename column budget to project_budget in projects*/
alter table employee add status VARCHAR(20);
alter table employee modify department varchar(50);
alter table projects rename column budget to project_budget;
desc employee;
/*Q6. DROP & TRUNCATE:
a) Create table temp_employees
b) Truncate the table
c) Drop the table*/
create table temp_employees(
emp_id int,
emp_name varchar(50),
emp_department varchar(50),
emp_address varchar(50));
truncate table temp_employees;
desc temp_employees;
drop table temp_employees;
-- Q7. Insert at least 6 records into employees.
INSERT INTO employee 
(employee_id, full_name, email, phone, gender, hire_date, salary, department)
VALUES
(101,'akansha','akku@gmail.com','2378658901','F','2026-01-23',20000,'IT'),
(102,'pooja','poo@gmail.com','7845231290','F','2025-05-12',90000,'sales'),
(103,'kunal','kunal@gmail.com','5673527890','M','2023-11-23',56000,'HR'),
(104,'komal','komal@gmail.com','9845236789','F','2023-12-01',89000,'IT'),
(105,'rohan','rohan@gmail.com','8723560909','M','2025-05-10',12000,'HR'),
(106,'atharva','atharva@gmail.com','0923567189','M','2026-02-28',10000,'sale');
-- Q8. Insert 4 department records using a single INSERT statement.
insert into departments values (1,"IT","Pune"),(2,"HR","Mumbai"),(3,"sale","Mumbai"),(4,"Marketing","Chennai");
-- Q9. Insert 5 project records into projects.
insert into projects values (201,"Online-shopping","2023-09-12","2024-01-19",34000);
insert into projects values
(202,"Management","2024-01-10","2024-06-22",45000),
(203,"Hospital-Management","2023-10-11","2024-10-25",678776),
(204,"Gameing","2025-08-30","2026-01-23",756786),
(205,"stock-market","2025-02-23","2025-12-22",567875);
/*Q10. Update Operations:
a) Set status to 'Active' for all employees
b) Increase salary of one employee by 10,000*/
alter table employee add 
emp_status varchar(50);
UPDATE employee
SET emp_status = "Active";
desc employee;
select * from employee;
update employee set salary=salary+10000 where employee_id=103;
/*Q11. Delete Operations:
a) Delete one employee using employee_id
b) Delete all records from projects*/
delete from employee where employee_id=105;
delete from projects;
select * from projects;
/*Q12. Basic SELECT:
a) Display all records from employees
b) Display all records from departments*/
select * from employee;
select *from departments;
/*Q13. SELECT Specific Columns:
a) Display full_name, email, salary from employees
b) Display department_name, location from departments*/
select full_name,email,salary from employee;
select department_name,location from departments;
/*Q14. WHERE Clause:
a) Employees with gender 'Female'
b) Employees with salary > 50,000
c) Employees hired after 2021-01-01*/
select * from employee where gender = "F";
select * from employee where salary >50000;
select * from employee where hire_date > "2021-01-01";
/*Q15. WHERE with Multiple Conditions:
a) Employees in IT department with status 'Active'
b) Projects with budget > 1,000,000 and end date after 2024-12-31*/
select * from employee where department ="IT" and emp_status="Active";
select * from projects 
where project_budget > 1000000 
and end_date > '2024-12-31';
desc projects;