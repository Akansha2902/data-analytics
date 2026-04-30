use training_institute_db;

-- 1 Display students whose age is greater than the average age of all students.
select student_age
from students
where student_age >(select avg(student_age)
from students);

-- 2 Show courses whose fee is greater than the average course fee.
select course_name,course_fee
from courses
where course_fee >(select avg(course_fee)
from courses);

-- 3 Display trainers whose experience is greater than the minimum experience.
select trainer_name,experience_years
from trainers
where experience_years >(select min(experience_years)
from trainers);

-- 4 Show students who are enrolled in the course with the highest fee.
select student_name
from students
where course_id=(select course_id
from courses
where course_fee=(select max(course_fee) from courses));
    
-- 5 Display the course_name of the course having the lowest fee.
select course_name,course_fee
from courses
where course_fee=(select min(course_fee) from courses);

select course_fee,course_name from courses;

-- 6 Show students whose age is equal to the maximum age in the students table.
select student_name,student_age
from students
where student_age=(select max(student_age) from students);

-- 7 Display trainers whose experience is less than the average experience.
select trainer_name,experience_years
from trainers
where experience_years<(select avg(experience_years) from trainers);
select avg(experience_years) from trainers;

-- 8 Display students who are enrolled in courses handled by trainer_id = 1.
select student_name
from students
where course_id in (select course_id from courses where trainer_id=1);

-- 9 Show students whose course_id is in the list of courses with fee > 50000.
select student_name
from students 
where course_id in (select course_id from courses where course_fee>50000);

-- 10 Display trainers who are teaching courses that have enrollments.
select trainer_name
from trainers
where trainer_id in (select trainer_id from courses where course_id in (select course_id from enrollments));

-- 11 Show courses that are enrolled by students from Pune.
select course_name 
from courses
where course_id in (select e.course_id 
from enrollments e 
left join students s on 
e.student_id=s.student_id 
where s.student_city='Pune');

-- 12 Display students whose course_id is not in the list of courses with fee < 30000.
select student_name
from students
where course_id not in (select course_id 
from courses
where course_fee<30000);

-- 13 Show trainers who are teaching more than one course.
select trainer_name
from trainers
where trainer_id in(select trainer_id 
from courses
group by trainer_id
having count(*)>1);
select *from trainers;

-- 14 Display students who have made payments (Paid or Partial).
select distinct student_name
from students s
left join enrollments e on 
s.student_id=e.student_id
where payment_status in ('Paid','Partial');

-- 15 Show courses that have at least one student with Pending payment.
select course_name
from courses
where course_id=any (select course_id 
from enrollments
where payment_status='Pending');