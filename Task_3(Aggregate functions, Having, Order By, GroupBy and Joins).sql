--Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.

select * from Payments
select * from Students

select s.student_id, s.first_name , s.last_name , sum(p.amount) as total_payments
from Students s
join Payments p on s.student_id=p.student_id
where s.student_id = 1
group by s.student_id, s.first_name , s.last_name;

--Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

select c.course_name, count(e.student_id) as student_count
from Courses c
left join Enrollments e on c.course_id=e.course_id
group by c.course_name
order by student_count desc;

--Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.select * from Enrollmentsselect * from Studentsselect s.student_id ,s.first_namefrom Students sleft join Enrollments e on s.student_id =e.student_idwhere e.student_id is null--Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.select s.first_name , s.last_name , c.course_namefrom Students sjoin Enrollments e on s.student_id = e. student_idjoin Courses c on e.course_id = c.course_id--Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.select t.first_name, t.last_name,c.course_namefrom Teachers tjoin Courses c on t.teacher_id = c.teacher_id--Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students table with the "Enrollments" and "Courses" tables.select s.student_id, s.first_name, e.enrollment_datefrom Students sjoin Enrollments e on s.student_id = e.student_idjoin Courses c on e.course_id = c.course_idwhere c.course_id=7--Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.select s.student_id,s.first_namefrom Students sleft join Payments p on s.student_id = p.student_idwhere p.payment_id is null--Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.select c.course_name as no_enrollmentfrom Courses cleft join Enrollments e on c.course_id=e.course_idwhere e.enrollment_id is null--Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.select s.first_name, s.last_name, count(e1.course_id) as course_countfrom Enrollments e1join Enrollments e2 on e1.student_id= e2.student_id and e1.course_id < > e2.course_idjoin Students s on e1.student_id = s.student_idgroup by s.student_id, s.first_name,s.last_namehaving count(e1.course_id)>1;--Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.select * from Teachersselect * from Coursesselect t.first_name ,c.course_idfrom Teachers tleft join Courses c on t.teacher_id=c.teacher_idwhere c.course_id is null;