use Marchdb

create table Product
(
pid int identity (200,1) primary key not null,
pname varchar(50),
pprice bigint
);

insert into Product values ('pen',10),
('notebook',20),
('laptop',60000),
('toys',500);

select * from Product

create table Orders
(
orid int identity (200,1) primary key not null,
orderDate date,
productId int,
constraint FK_productId foreign Key (productId) references Product(pid)
);

insert into Orders values (GETDATE(),(select pid from Product where pname='pen')), --sub queries
(GETDATE(),(select pid from Product where pname='notebook')),
(GETDATE(),(select pid from Product where pname='laptop')),
(GETDATE(),(select pid from Product where pname='toys'))

select * from Orders
select * from Product

insert into  Orders(orderDate) values(GETDATE())

select * from Product
select * from Orders

--subquery within update 

update Orders set productId=(select pid from product where pname='toys')
where orderDate='2025-03-20'

update Orders set productId=(select pid from product where pname='laptop')
where orid=205


--subquery within delete 
delete from Orders where productId=203
delete from Product where pid not in (select productId from Orders)
select * from product
select * from Orders