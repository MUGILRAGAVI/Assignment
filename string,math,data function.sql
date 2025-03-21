use Marchdb
--string function
select UPPER ('trainee') as TraineeInUpper
select lower ('TRAINER') AS TraineeInLower
select len('trainee') as Length
select concat('mugil','ragavi') as FullName
select reverse('mugilragavi') as reverseName
select replace ('mugilragavi','ragavi','mugil')

--math function
select power(10,2)
select abs(25)
select sqrt(64)
select pi()

--data function
select sysdatetime()
select getdate()
select SYSDATETIMEOFFSET() --for particular time zone
select isdate('1-15-2023')
select month('2020-3-20')
select day('2020-3-20')
select year('2020-3-20')