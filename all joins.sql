use Marchdb

--fetch records from skill
select *from Skill
--fetch records from trainee
select *from Trainee

--inner join query to fetch records from skill and trainee
select *from Skill
inner join
Trainee
on Skill.id=Trainee.skill_id

--outer left join 
select *from Skill
left join 
Trainee 
on Skill.id=Trainee.skill_id

--right outer join
select s.skillname as Course, t.name as Trainee 
from Skill as s
right join 
Trainee as t
on s.id=t.skill_id
where s.id is not null

--outer full join 
select s.skillname as Course , t.name as Trainee
from Skill as s
full join
Trainee as t
on s.id=t.skill_id

--count number of candidate in each course 
select *from Skill
select *from Trainee
select t.trainee_skill as Course , count(*) as No_Of_Students
from Trainee as t
group by t.trainee_skill

create table Trainer
(
id int identity primary key not null,
Name varchar (50) null
)
insert into Trainer values ('Varsha'),('Reema'),('seema'),('Kavitha')
alter table Skill add Trainer_id int null constraint fk_tr foreign key references Trainer(id)
select * from Trainer 
select * from Skill

update Skill set Trainer_id=201 where id=2
select * from Trainer 
select * from Skill
select *from Trainee

--join 3 tables
select tr.Name as Trainer_Name,
sk.skillname as Course,
tn.name as Trainee

from Trainer as tr
inner join 
Skill as sk
on tr.id=sk.Trainer_id
inner join
Trainee as tn
on sk.id=tn.skill_id

--cross join 
create table shape 
(
id int identity primary key,
name varchar(50)
)

create table colors
(
id int identity primary key,
color varchar(50)
)
insert into shape values('circle'),('square'),('rectangle'),('triangle')
insert into colors values('red'),('green'),('blue')
select * from shape
select * from colors

select s.name, c.color from shape as s
cross join 
colors as c

--cross join with where 
select s.name, c.color from shape as s
cross join 
colors as c
where s.id=c.id

--self join 
select * from Trainee

select tr.name as Trainer, tn.name as Trainee
from Trainee as tr
join
Trainee as tn
on tr.trainee_id=tn.skill_id




