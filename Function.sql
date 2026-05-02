use training_institute_db;

-- 1 Display course_name and rounded course_fee to nearest thousand.
select course_name, round(course_fee,-3)
from courses;

-- 2 Show course_name and ceiling value of course_fee.
select course_name, ceil(course_fee)
from courses;

-- 3 Display course_name and floor value of course_fee.
select course_name,floor(course_fee)
from courses;

-- 4 Show student_name and absolute difference between student_age and 25.
select student_name,abs(student_age - 25)
from students;

-- 5 Display course_name and course_fee raised to power 2.
select course_name, power(course_fee,2)
from courses;

-- 6 Show course_name and square root of course_fee.
select course_name, sqrt(course_fee)
from courses;

-- 7 Display student_id and mod of student_age by 2.
select student_id,mod(student_age,2)
from students;

-- 8 Show student_name and sign of (student_age - 22).
select student_name,sign(student_age-22)
from students;

-- 9 Display course_name and truncate course_fee to 2 decimal places.
select course_name,truncate(course_fee,2)
from courses;

-- 10 Show trainer_name in uppercase.
select upper(trainer_name)
from trainers;

-- 11 Display student_name in lowercase.
select lower(student_name)
from students;

-- 12 Show student_name and length of student_name.
select student_name,length(student_name)
from students;

-- 13 Display concatenated student_name and student_city.
select concat(student_name,student_city)
from students;

-- 14 Show first 3 characters of student_name using substring.
select substring(student_name,1,3)
from students;

-- 15 Display first 2 characters of course_name using left function.
select left(course_name,2)
from courses;

-- 16 Show last 3 characters of course_name using right function.
select right(course_name,3)
from courses;

-- 17 Display student_name after removing leading and trailing spaces using trim.
select trim(student_name)
from students;

-- 18 Replace city name Pune with PUNE_CITY in student_city.
select replace(student_city,'Pune','PUNE_CITY')
from students;

-- 19 Display student_name in reverse order.
select reverse(student_name)
from students;

-- 20 Show enrollment_id and add 10 days to enrollment_date.
select enrollment_id,date_add(enrollment_date,interval 10 day)
from enrollments;

-- 21 Display enrollment_id and subtract 5 days from enrollment_date.
select enrollment_id, date_sub(enrollment_date,interval 5 day)
from enrollments;

-- 22 Show difference in days between enrollment_date and current date.
select enrollment_id,datediff(current_date,enrollment_date)
from enrollments;

-- 23 Display difference in months between enrollment_date and current date using timestampdiff.
select enrollment_id,timestampdiff(hour,enrollment_date,current_date)
from enrollments;

-- 24 Show student_name and year of enrollment_date.
select student_name,year(e.enrollment_date)
from students s
left join enrollments e on
s.student_id=e.student_id;

-- 25 Display student_name and month of enrollment_date.
select student_name ,month(e.enrollment_date)
from students s
left join enrollments e on
s.student_id=e.student_id;

-- 26 Show student_name and day of enrollment_date.
select student_name,day(e.enrollment_date)
from students s
left join enrollments e
on s.student_id=e.student_id;

-- 27 Display student_name and week number of enrollment_date.
select student_name,week(e.enrollment_date)
from students s
left join enrollments e 
on s.student_id=e.student_id;

-- 28 Show student_name and quarter of enrollment_date.
select student_name,quarter(enrollment_date)
from students s
left join enrollments e
on s.student_id=e.student_id;

-- 29 Display course_name and course_fee where round(course_fee) > 40000.
select course_name,course_fee
from courses
where round(course_fee)>40000;

-- 30 Show students where mod(student_age,2) = 0.
select student_name
from students
where mod(student_age,2)=0;

-- 31 Display students where length(student_name) > 5.
select student_name
from students
where length(student_name)>5;

-- 32 Show enrollments where datediff(current_date, enrollment_date) > 30.
select enrollment_id
from enrollments
where datediff(current_date,enrollment_date)>30;

-- 33 Display courses where sqrt(course_fee) > 200.
select course_name
from courses
where sqrt(course_fee)>200;

-- 34 Show students where year(enrollment_date) = current year.
select student_name 
from students s
left join enrollments e
on s.student_id=e.student_id
where year(enrollment_date)=year(current_date);

-- 35 Display enrollments where month(enrollment_date) = current month.
select enrollment_id
from enrollments
where month(enrollment_date)=month(current_date);