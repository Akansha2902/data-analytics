use training_institute_db;

-- 1 Display students whose (course_id, student_city) matches the list of (course_id, student_city) where students are from Pune.
select student_name
from students
where (course_id,student_city) in (select course_id,student_city
from students
where student_city='Pune');

-- 2 Show students whose (course_id, student_age) matches the (course_id, student_age) of students older than 22.
select student_name
from students
where (course_id,student_age) in (select course_id, student_age
from students
where student_age > 22);
-- 3 Display courses where (course_id, trainer_id) matches trainers having more than 3 years of experience.
select *
from courses
where (course_id,trainer_id) in (select c.course_id,t.trainer_id
from courses c
left join trainers t
on t.trainer_id=c.trainer_id
where t.experience_years>3);
select* from trainers;
-- 4 Show enrollments where (student_id, course_id) exists in the students table.
select *
from enrollments
where (student_id,course_id) in (select student_id,course_id
from students);
-- 5 Display students whose age is greater than the average age of students in their same course.
select student_name
from students s
where student_age >(select avg(student_age)
from students
where course_id=s.course_id);
-- 6 Show courses where the average amount_paid is greater than overall average amount_paid.
select course_id
from enrollments
group by course_id
having avg(amount_paid)>(select avg(amount_paid)
from enrollments);
-- 7 Display trainers who have more courses than the average number of courses per trainer.
select trainer_id
from courses
group by trainer_id
having count(*)>(select avg(course_count)
from (select count(*) as course_count
from courses
group by trainer_id) t
);

-- 8 Show students who have paid more than the average payment of their course.
select student_id
from enrollments e
where amount_paid>(select avg(amount_paid)
from enrollments
where course_id=e.course_id);
-- 9 Display courses where at least one student has paid more than 40000.
select course_id
from enrollments 
where amount_paid > 40000;

-- 10 Display students enrolled in courses taught by trainers from Mumbai.
select student_id
from enrollments 
where course_id in (select course_id
from courses
where trainer_id in (select trainer_id
from trainers
where trainer_city='Mumbai'));

-- 11 Show students who are enrolled in courses whose fee is greater than the average fee.
select student_id
from enrollments
where course_id in (select course_id
from courses
where course_fee >(select avg(course_fee)
from courses));

-- 12 Display trainers who are teaching courses in which students have made payments.
select trainer_id,trainer_name
from trainers
where trainer_id in (select trainer_id 
from courses
where course_id in (select course_id
from enrollments));

-- 13 Show courses where students exist whose age is greater than 25.
select course_id,course_name
from courses
where course_id in (select course_id 
from enrollments
where student_id in (select student_id
from students
where student_age>25));
select student_age from students;

-- 14 Display student_name and classify age as Young (<22), Adult (22–30), Senior (>30).
select student_name ,student_age,
case 
when student_age <22 then 'Young'
when student_age between 22 and 30 then 'Adult'
else 'Senior'
end as age_group
from students;

-- 15 Show course_name and classify fee as Low (<30000), Medium (30000–60000), High (>60000).
select course_name,course_fee,
case
when course_fee < 30000 then 'Low'
when course_fee between 30000 and 60000 then 'Medium'
else 'High'
end as fee_range
from courses;

-- 16 Display student_name and payment status label: Completed (Paid), In Progress (Partial), Not Paid (Pending).
select student_name,
case e.payment_status
when 'Paid' then 'Completed'
when 'Partial' then 'Progress'
else 'Not Paid'
end as payment_label
from students s
left join enrollments e
on s.student_id=e.student_id;
select payment_status from enrollments;

-- 17 Show trainer_name and classify experience as Beginner (<3), Intermediate (3–6), Expert (>6).
select trainer_name ,experience_years,
case
when experience_years<3 then 'Beginner'
when experience_years between 3 and 6 then 'Intermediate'
else 'Expert'
end as 'experience_level'
from trainers;