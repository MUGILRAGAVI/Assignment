use SISDB

create table Students
(
student_id int identity primary key not null,
first_name varchar(50) not null,
last_name varchar(50) not null,
date_of_birth date not null,
email varchar(50) unique not null,
phone_number varchar(15) unique not null
);

create table Courses
(
course_id int identity primary key not null,
course_name varchar(50) not null,
credits int not null,
teacher_id int,
foreign key (teacher_id) references Teachers(teacher_id)on delete set null
);

create table Enrollments
(
enrollment_id int identity primary key not null,
student_id int,
course_id int,
enrollment_date date not null,
foreign key (student_id) references Students(student_id) on delete cascade,
foreign key (course_id) references Courses(course_id) on delete cascade
);

create table Teachers
(
teacher_id int identity primary key not null,
first_name varchar(50) not null,
last_name varchar(50)not null,
email varchar(50) unique not null
);

create table Payments
(
payment_id int identity primary key not null,
student_id int,
foreign key (student_id) references Students(student_id) on delete cascade,
amount decimal(10,2) not null,
payment_date date not null
);

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('viart', 'kohli', '2000-05-15', 'viratkohli@email.com', '1234567799'),
('rohit', 'sharma', '2001-08-22', 'rohitsharma@email.com', '9876543210'),
('ms', 'dhoni', '1999-12-10', 'msdhoni@email.com', '1122334455'),
('kl', 'rahul', '2002-07-05', 'klrahul@email.com', '9988776655'),
('subman', 'gill', '2001-01-17', 'submangill@email.com', '7766554433'),
('hardik', 'pandya', '2000-09-28', 'hardikpandya@email.com', '2233445566'),
('shryas', 'iyer', '1999-04-11', 'shryasiyer@email.com', '6677889900'),
('abd', 'williares', '2002-11-23', 'abdwilliares@email.com', '5566778899'),
('sachin', 'Tendulkar', '2001-06-30', 'sachintendulkar@email.com', '4455667788'),
('jasprit', 'bumra', '2000-03-19', 'jaspritbumra@email.com', '3344556677');

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Mathematics', 3, 1),
('Physics', 4, 2),
('Computer Science', 3, 3),
('Biology', 4, 4),
('English Literature', 3, 5),
('History', 3, 6),
('Chemistry', 4, 7),
('Economics', 3, 8),
('Philosophy', 3, 9),
('Statistics', 4, 10);

INSERT INTO Teachers (first_name, last_name, email) VALUES
('David', 'Williams', 'david.williams@email.com'),
('Emma', 'Clark', 'emma.clark@email.com'),
('Michael', 'Hall', 'michael.hall@email.com'),
('Sophia', 'Lopez', 'sophia.lopez@email.com'),
('James', 'Lee', 'james.lee@email.com'),
('Lily', 'Gonzalez', 'lily.gonzalez@email.com'),
('Benjamin', 'Harris', 'benjamin.harris@email.com'),
('Mia', 'Young', 'mia.young@email.com'),
('Daniel', 'King', 'daniel.king@email.com'),
('Charlotte', 'Wright', 'charlotte.wright@email.com');


INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-02-15'),
(3, 3, '2024-03-20'),
(4, 4, '2024-04-25'),
(5, 5, '2024-05-30'),
(6, 6, '2024-06-05'),
(7, 7, '2024-07-10'),
(8, 8, '2024-08-15'),
(9, 9, '2024-09-20'),
(10, 10, '2024-10-25');

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 5000.00, '2024-01-15'),
(2, 7500.00, '2024-02-20'),
(3, 6000.00, '2024-03-25'),
(4, 7000.00, '2024-04-30'),
(5, 8000.00, '2024-05-05'),
(6, 9000.00, '2024-06-10'),
(7, 10000.00, '2024-07-15'),
(8, 11000.00, '2024-08-20'),
(9, 12000.00, '2024-09-25'),
(10, 13000.00, '2024-10-30');


select* from Students
select * from Courses
select * from Enrollments
select * from Teachers
select * from Payments