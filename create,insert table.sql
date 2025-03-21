create table employees
(
id int identity primary key,
f_name varchar(20),
email varchar(30) unique,
salary int
);
go

insert into employees(f_name, email,salary)
values('sam','sam@gmail.com',20000);
go

select *from employees;