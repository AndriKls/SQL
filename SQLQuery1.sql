--loome db
create database Targe23SQL

--db valimine
use Targe23SQL

--db kustutamine
drop database Targe23SQL

-- tabeli loomine
create table Gender
(
ID int not null primary key,
Gender nvarchar(10) not null
)

--andmete sisestamine
insert into Gender (Id, Gender)
values (1, 'Male'),
(2, 'Female'),
(3, 'Unkown')

--vaatame tabeli sisu
select * from Gender