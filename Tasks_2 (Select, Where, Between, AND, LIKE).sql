use SISDB

--Write an SQL query to insert a new student into the "Students" table with the following details:

insert into Students(first_name,last_name,date_of_birth, email, phone_number)
values ('John','Doa','1995-08-15','john.doe@example.com','1234567890');

select* from Students


--Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date

insert into Enrollments (student_id, course_id, enrollment_date)  
values (1, 3, getdate());  
select * from Enrollments

--Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.

update Teachers
set email='ssooppiiaa123@gmail.com'
where teacher_id=4 ;

select * from Teachers

--Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.

select * from Enrollments
delete from Enrollments
where student_id = 5 and course_id =5 ;

--Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

select * from Courses
update Courses
set teacher_id = 1 
where course_id = 8

--Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity

delete from Enrollments  
where student_id = 3;

delete from Students  
where student_id = 3;

alter table Enrollments  
drop constraint FK_en_stu;

alter table Enrollments  
add constraint FK_en_stu  
foreign key (student_id) references Students(student_id)  
on delete cascade;

select * from Students
select * from Enrollments

--Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.
select * from Payments
 update Payments
 set amount = 3000
 where payment_id=6;







