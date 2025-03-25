--. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.

select c.course_name,(select count(e.student_id)
from Enrollments e
where e.course_id=c.course_id) as student_count
from Courses c;

--Identify the student(s) who made the highest payment.Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.

select s.first_name, s.last_name
from Students s
where s.student_id in (select student_id 
from Payments 
where amount=(select max(amount)from payments)
);

--Retrieve a list of courses with the highest number of enrollments.Use subqueries to find the course(s) with the maximum enrollment count.

select c.course_name 
from Courses c
where c.course_id in (select e.course_id  
from Enrollments e
group by e.course_id
having count(e.student_id) = (select max(enrollment_count)
from (select count (student_id) as enrollment_count
from Enrollments
group by course_id) as counts
)
);

--Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.

select t.first_name,t.last_name,
(select sum(p.amount)
from Payments p
join Enrollments e on p.student_id = e.student_id
where e.course_id in(
select c.course_id
from Courses c
where c.teacher_id = t.teacher_id
)) as total_payments
from Teachers t;

--Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.

select s.first_name, s.last_name
from Students s
where (select count(*) from Courses) =(
select count(*)
from Enrollments e
where e.student_id=s.student_id
);

--Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.

select t.first_name, t.last_name
from Teachers t
where t.teacher_id not in (
select distinct c.teacher_id
from Courses c
);

--Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.

select avg(datediff(year, date_of_birth, getdate())) as average_age
from Students;

--Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

select c.course_name 
from Courses c
where c.course_id not in (
select e.course_id
from Enrollments e
);

--Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.

select s.first_name,s.last_name, e.course_id,
(select sum(p.amount) 
from Payments p
where p.student_id=s.student_id) as total_payments
from Students s
join Enrollments e on s.student_id =e.student_id;

-- Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.

select s.first_name, s.last_name 
from Students s
where s.student_id in (
select p.student_id
from Payments p
group by 
p.student_id
having count(p.payment_id)>1
);

--Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.

select s.first_name,s.last_name , sum (p.amount) as total_payments
from Students s
join Payments p on s.student_id = p.student_id
group by s.student_id, s.first_name,s.last_name;

--Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.

select c.course_name , count(e.student_id) as student_count
from Courses c
left join Enrollments e on c.course_id = e.course_id
group by c.course_name;

--Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.

select s.first_name,s.last_name , avg(p.amount) as average_payment
from Students s
join Payments p on s.student_id = p.student_id
group by s.student_id, s.first_name, s.last_name;