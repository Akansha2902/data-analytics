-- 1 Create a database named training_institute_db and use that database.
create database training_institute_db;
use training_institute_db;
-- 2 Create a table named trainers with columns trainer_id, trainer_name, trainer_email, trainer_city,experience_years.
create table trainers(
trainer_id int,
trainer_name varchar(100),
trainer_email varchar(100),
trainer_city varchar(100),
experience_years int
);
-- 3 Create a table named courses with columns course_id, course_name,course_duration_months, course_fee, trainer_id.
create table courses(
course_id int,
course_name varchar(100),
course_duration_months int,
course_fee varchar(10),
trainer_id int
);
alter table courses modify course_fee int;
-- 4 Create a table named students with columns student_id, student_name, student_email,student_phone, student_city, student_age, course_id.
create table students(
student_id int,
student_name varchar(100),
student_email varchar(150),
student_phone varchar(10),
student_city varchar(100),
student_age int,
course_id int
);
-- 5 Create a table named enrollments with columns enrollment_id, student_id, course_id,enrollment_date, payment_status, amount_paid.
create table enrollments(
enrollment_id int,
student_id int,
course_id int,
enrollment_date date,
payment_status varchar(100),
amount_paid varchar(10)
);
-- 6 Apply appropriate constraints such as PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE,CHECK, and DEFAULT while creating the tables.
alter table trainers modify trainer_id int primary key;
alter table trainers modify trainer_name varchar(100) not null;
alter table trainers modify trainer_email varchar(100) not null;
alter table trainers modify trainer_city varchar(100) not null;

-- 7 Ensure trainer_id, course_id, student_id, and enrollment_id are primary keys.
alter table trainers modify trainer_id int primary key;
alter table students modify student_id int primary key;
alter table enrollments modify enrollment_id int primary key;
alter table courses modify course_id int primary key;

-- 8 Ensure trainer_email and student_email are unique.
alter table trainers modify trainer_email varchar(100) unique;
alter table students modify student_email varchar(100) unique;

-- 9 Ensure student_age is greater than or equal to 18.
alter table students
add constraint chk_student_age
check (student_age >= 18);

-- 10 Ensure course_fee is greater than 0.
alter table courses 
add constraint course_fee
check (course_fee > 0);

-- 11 Ensure amount_paid is not negative.
alter table enrollments
add constraint amount_paid
check (amount_paid >0);

-- 12 Ensure payment_status allows only values Paid, Pending, and Partial.
alter table enrollments
add constraint payment_status
check (payment_status ="Paid" or payment_status ="Pending" or payment_status="Partial");

-- 13 Ensure enrollment_date takes the current date by default if not provided.
alter table enrollments
alter column enrollment_date set default '2026-03-16';

-- 14 Ensure trainer_id in courses references the trainers table.
 alter table courses 
 add constraint fk_course
 foreign key (trainer_id)
 references trainers (trainer_id);
 
-- 15 Ensure course_id in students references the courses table.
alter table students
add constraint fk_student
foreign key (course_id)
references courses (course_id);

-- 16 Ensure student_id and course_id in enrollments reference the respective tables.
alter table enrollments
add constraint fk_enroll
foreign key (student_id)
references students (student_id);

alter table enrollments
add constraint fk_enrollment
foreign key (course_id)
references courses (course_id);

-- 17 Insert at least 5 records into the trainers table.
insert into trainers values (1, 'Rahul Sharma', 'rahul@gmail.com', 'Mumbai', 5),
(2, 'Amit Verma', 'amit@gmail.com', 'Delhi', 7),
(3, 'Neha Singh', 'neha@gmail.com', 'Pune', 4),
(4, 'Priya Mehta', 'priya@gmail.com', 'Bangalore', 6),
(5, 'Karan Patel', 'karan@gmail.com', 'Ahmedabad', 3);

-- 18 Insert at least 6 records into the courses table.
insert into courses values(101, 'SQL', 3, 5000, 1),
(102, 'Java', 6, 8000, 2),
(103, 'Python', 4, 7000, 3),
(104, 'Web Development', 5, 9000, 4),
(105, 'Data Science', 6, 12000, 2),
(106, 'C++', 3, 4000, 5);

-- 19 Insert at least 10 records into the students table.
insert into students values (1, 'Rohan Patil', 'rohan@gmail.com', '9876543210', 'Pune', 20, 101),
(2, 'Sneha Joshi', 'sneha@gmail.com', '9876543211', 'Mumbai', 22, 102),
(3, 'Aman Gupta', 'aman@gmail.com', '9876543212', 'Delhi', 19, 103),
(4, 'Pooja Sharma', 'pooja@gmail.com', '9876543213', 'Bangalore', 21, 104),
(5, 'Vikas Yadav', 'vikas@gmail.com', '9876543214', 'Hyderabad', 23, 105),
(6, 'Anjali Verma', 'anjali@gmail.com', '9876543215', 'Chennai', 24, 106),
(7, 'Rahul Singh', 'rahul.s@gmail.com', '9876543216', 'Pune', 20, 101),
(8, 'Kavita Nair', 'kavita@gmail.com', '9876543217', 'Kochi', 22, 103),
(9, 'Arjun Mehta', 'arjun@gmail.com', '9876543218', 'Ahmedabad', 25, 104),
(10, 'Meera Iyer', 'meera@gmail.com', '9876543219', 'Chennai', 21, 102);

-- 20 Insert at least 10 records into the enrollments table.
insert into enrollments values (1, 1, 101, '2024-01-10', 'Paid', 5000),
(2, 2, 102, '2024-01-12', 'Paid', 8000),
(3, 3, 103, '2024-01-15', 'Pending', 3000),
(4, 4, 104, '2024-01-18', 'Paid', 9000),
(5, 5, 105, '2024-01-20', 'Pending', 6000),
(6, 6, 106, '2024-01-22', 'Paid', 4000),
(7, 7, 101, '2024-01-25', 'Paid', 5000),
(8, 8, 103, '2024-01-28', 'Pending', 3500),
(9, 9, 104, '2024-02-01', 'Paid', 9000),
(10, 10, 102, '2024-02-05', 'Paid', 8000);

-- 21 Update the city of a trainer.
update trainers 
set trainer_city='Pune'
where trainer_id = 8;

-- 22 Update the fee of a particular course.
update courses
set course_fee = 10000
where course_name='Python';

-- 23 Increase the course fee by 10 percent for all courses.
update courses
set course_fee=course_fee+(course_fee*0.10);
select * from courses;

-- 24 Update payment status from Pending to Paid for a specific enrollment.
update enrollments
set payment_status='Paid'
where enrollment_id=3;

-- 25 Change the course assigned to a student.
update students
set course_id=103
where student_id=9;

-- 26 Delete a student with a specific student_id.
delete from enrollments
where student_id=5;
delete from students
where student_id=5;

-- 27 Delete all enrollments where payment status is Pending.
delete from enrollments
where payment_status='Pending';
select * from enrollments;

-- 28 Delete a course with a specific course_id.
delete from enrollments
where course_id=104;
delete from students
where course_id=104;
delete from courses
where course_id=104;

-- 29 Delete trainers who have less than 2 years of experience.
delete from trainers 
where experience_years<2;
select * from trainers;

-- 30 Display all students from Pune.
select * from students 
where student_city='Pune';

-- 31 Display all trainers from Mumbai.
select * from trainers
where trainer_city='Mumbai';

-- 32 Show courses with fee greater than 40000.
select * from courses
where course_fee<40000;

-- 33 Show students whose age is greater than 22.
select * from students
where student_age >22;

-- 34 Display enrollments where payment status is Paid.
select * from enrollments 
where payment_status='Paid';

-- 35 Display all students ordered by student_name in ascending order.
select * from students
order by student_name;

-- 36 Display all trainers ordered by experience_years in descending order.
select * from trainers 
order by experience_years desc;

-- 37 Show courses ordered by course_fee from highest to lowest.
select * from courses
order by course_fee desc;

-- 38 Display enrollments ordered by amount_paid.
select * from enrollments
order by amount_paid;

-- 39 Display all distinct student cities.
select distinct student_city
 from students;

-- 40 Display all distinct trainer cities.
select distinct trainer_city
from trainers;

-- 41 Display distinct payment statuses from enrollments.
select distinct payment_status
from enrollments;

-- 42 Display students whose age is between 20 and 25.
select * from students
where student_age between 20 and 25;

-- 43 Show courses whose fee is between 30000 and 60000.
select * from courses
where course_fee between 30000 and 60000;

-- 44 Display trainers whose experience is between 3 and 8 years.
select * from trainers 
where experience_years between 3 and 8;

-- 45 Display students from cities Pune, Mumbai, and Bangalore.
select * from students
where student_city in ('Pune','Mumbai','Bangalore');

-- 46 Show enrollments where payment status is Paid or Partial.
select * from enrollments 
where payment_status in ('Paid','Partial');

-- 47 Display trainers whose city is Delhi or Hyderabad.
select * from trainers 
where trainer_city in ('Delhi','Hyderabad');

-- 48 Display records where student_phone is NULL.
select * from students
where student_phone is null;

-- 49 Display records where student_email is NOT NULL.
select * from students
where student_email is not null;

-- 50 Show the first 5 students.
select * from students
limit 5;

-- 51 Show the top 3 highest fee courses.
select * from courses
order by course_fee desc
limit 3;

-- 52 Show the first 2 trainers.
select * from trainers
limit 2;

-- 53 Find the total number of students.
select count(*) as total_student
from students;

-- 54 Find the average age of students.
select avg(student_age) as Average_age
from students;

-- 55 Find the maximum course fee.
select max(course_fee) as Max_fee
from courses;

-- 56 Find the minimum course fee.
select min(course_fee) as Min_fee
from courses;

-- 57 Find the total amount paid in enrollments.
select sum(amount_paid)
from enrollments;

-- 58 Count the number of students in each city.
select student_city,count(student_id)
from students
group by student_city;

-- 59 Count the number of courses handled by each trainer.
select trainer_id,count(course_id)
from courses
group by trainer_id;

-- 60 Find total amount paid for each payment status.
select payment_status,sum(amount_paid)
from enrollments
group by payment_status;

-- 61 Find the average age of students course-wise.
select course_id,avg(student_age)
from students
group by course_id;

-- 62 Display cities having more than 2 students.
select student_city,count(*)
from students
group by student_city
having count(*)>2;

-- 63 Show trainers handling more than 1 course.
select trainer_id,count(course_id)
from courses
group by trainer_id
having count(course_id)>1;

-- 64 Display payment statuses where total amount_paid is greater than 50000.
select payment_status,sum(amount_paid)
from enrollments
group by payment_status
having sum(amount_paid)>50000;

-- 65 Display student name and course name.
select student_name ,course_name
from students s1
inner join courses c1 on 
s1.course_id=c1.course_id;

-- 66 Display course name and trainer name.
select course_name,trainer_name
from courses c1
inner join trainers t1 on 
c1.trainer_id=t1.trainer_id;

-- 67 Display student name, course name, and enrollment date.
select student_name,course_name,enrollment_date
from enrollments e
inner join students s on e.student_id=s.student_id
inner join courses c on e.course_id=c.course_id;

-- 68 Display student name with payment status.
select student_name, payment_status
from enrollments e
inner join students s 
on e.student_id=s.student_id;

-- 69 Display all trainers and the courses they teach.
select trainer_name,course_name
from courses c
inner join trainers t
on c.trainer_id=t.trainer_id;

-- 70 Display all courses and the students enrolled in them.
select course_name,student_name
from courses c
left join students s on
c.course_id=s.course_id;

-- 71 Display all students and their enrollment details.
select student_name,enrollment_id,e.course_id,enrollment_date,payment_status,amount_paid
from students s
left join enrollments e
on s.student_id=e.student_id;

-- 72 Display all courses and their trainers.
select course_name,trainer_name,trainer_city,experience_years
from courses c
left join trainers t
on c.trainer_id=t.trainer_id;

-- 73 Display all enrollments and corresponding student details.
select enrollment_id,student_name,student_phone,student_city,e.course_id,enrollment_date,payment_status,amount_paid
from enrollments e
left join students s
on e.student_id=s.student_id;

-- 74 Display the names of students enrolled in the Data Science course.
select student_name,course_name
from students s
right join courses c on 
s.course_id=c.course_id
where course_name='Data Science';

-- 75 Show the names of trainers teaching courses with fee greater than 50000.
select trainer_name,course_name,course_fee
from courses c
inner join trainers t on
c.trainer_id=t.trainer_id
where course_fee>50000;

-- 76 Display all students who have fully paid their fees.
select student_name,payment_status
from students s
inner join enrollments e on
s.student_id=e.student_id
where payment_status='Paid';

-- 77 Find the number of students enrolled in each course.
select course_name,count(student_id)
from enrollments e
inner join courses c on 
e.course_id=c.course_id
group by course_name;

-- 78 Show the course with the highest fee.
select course_name,course_fee
from courses
order by course_fee desc 
limit 1;
 
-- 79 Display students and their course names only for students from Pune.
select student_name,course_name
from students s
inner join courses c on 
s.course_id=c.course_id
where student_city='Pune';

-- 80 Show trainer details for courses with duration more than 6 months.
select trainer_name,course_name,trainer_city,experience_years
from courses c
left join trainers t on 
c.trainer_id=t.trainer_id
where course_duration_months>6;

-- 81 Display the total amount collected course-wise.
select course_name,sum(amount_paid)
from enrollments e
inner join courses c on 
e.course_id=c.course_id
group by course_name;

-- 82 Show all students whose names contain the letter a and are older than 20.

-- 83 Display all courses that currently have no students enrolled.
select course_name
from enrollments e
right join courses c on
e.course_id=c.course_id
where e.course_id is null;

-- 84 Show all trainers who are not assigned to any course.
select trainer_name 
from trainers t
left join courses c on 
t.trainer_id=c.trainer_id
where c.trainer_id is null;

-- 85 Display students who paid more than 30000.
select student_name,amount_paid
from students s
inner join enrollments e on
s.student_id=e.student_id
where e.amount_paid>30000;

-- 86 Show the average amount paid by students for each course.
select course_name, avg(amount_paid)
from enrollments e
inner join courses c on 
e.course_id=c.course_id
group by course_name;

-- 87 Display the course name and total number of enrollments.
select course_name,count(enrollment_id)
from enrollments e
inner join courses c on
e.course_id=c.course_id
group by course_name;

-- 88 Show student name, course name, and payment status for all partial payments.
select student_name,course_name,payment_status
from enrollments e
inner join students s on e.student_id=s.student_id
inner join courses c on e.course_id=c.course_id
where payment_status='Partial';

-- 89 Try inserting a student with a duplicate email and observe the error.
insert into students values (110,'Amit karpe','amit@gmail.com',2678910872,'Pune',23,101);

-- 90 Try inserting a course with a negative fee and observe the error.
insert into courses values (110, 'AI', 6, -5000, 1);

-- 91 Try inserting a student with age less than 18 and observe the error.
insert into students values (20, 'Test Student', 'test@gmail.com', '9999999999', 'Mumbai', 16, 101);

-- 92 Try inserting an enrollment with invalid payment status and observe the error.
insert into enrollments values (20, 1, 101, '2024-03-01', 'Completed', 5000);

-- 93 Try inserting a course with a trainer_id that does not exist and observe the error.
insert into courses values (120, 'Machine Learning', 6, 15000, 999);