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

--loome uue tabeli
create table Person
(
ID int not null primary key,
Name nvarchar(30),
Email nvarchar(30),
GenderID int
)

--andmete sisestamine
insert into Person (Id, Name, Email, GenderId) values
(1, 'Superman', 's@s.com', 1),
(2, 'Wonderwoman', 'w@w.com', 2),
(3, 'Batman', 'b@b.com', 1),
(4, 'Aquaman', 'a@a.com', 1),
(5, 'Catman', 'c@c.com', 2),
(6, 'Antman', 'ant"ant.com', 1),
(7, NULL, NULL, 3)


--vaadake PErson tabeli andmeid
select * from Person

--võõrvõtme ühenduse loomine kahe tabeli vahel
alter table Person add constraint tblPerson_GenderID_FK
foreign key (GenderId) references Gender(Id)

--kui sisestad uue rea andmeid ja ei ole sisestanud GenderId-d
--alla väärtust, siis see automaatselt sisestab selle reale
--väärtuse 3 e Unknown
alter table Person
add constraint DF_persons_GenderId
default 3 for GenderId

--sisestame andmed 
insert into Person (Id, Name, Email)
values(9, 'Ironman','i@i.com')

select * from Person

alter table Person
Add Age Int;
--lisame nr piirangu vanuse sisestamisel


alter table Person
add constraint CK_Person_Age check (age > 0 and Age < 155)

insert into Person (Id, Name, Email)
values (10, 'Kalevipoeg', 'k@k.com', 1, 30)

--muudame koodiga andmeid
update Person
set Age = 50
where Id = 5

select * from Person

alter table Person
add City nvarchar(50)

--sisestame City veergu andmeid
update Person
set City = 'Kaljuvald'
where ID = 10


--kõik kes Gothami linnas
select * from Person where City = 'Gotham'

-- kõik kes ei ela Gothamis
select * from Person where City != 'Gotham'

--näitab teatud vanusega inimesi
select * from Person where Age = 12 or Age = 50 or Age = 19
select * from Person where Age in (120, 50, 19)
select * from Person where Age between 22 and 31


--wildcard e näitab kõik g-tähega algavad
linnad
select * from Person where City like 'g%'


--kõik emailid, kus on @-märk sees
select * from Person where Email like '%@%'

--näitab emaile , kus ei ole @-märki
select * from Person where Email not like '%@%'

--näitab kellel on emailis ees ja peale @märki ainult üks täht



update Person
set Email = 'bat@bat.com'
where Id = 3


--kõik kellel nimes ei ole esimene täht W, A, C
select * from Person where name like '[^WAC]%'
select * from Person


--kes elavad Gothamis ja New Yorgis
select * from Person where (city = 'Gotham' or city = 'New York')


--kõik kes elavad linnades ja on vanemad kui 29
select * from Person where (city = 'Gotham' or city = 'New York')
and Age >= 30


--kuvab tähestikulises järjekorras inimesi ja võtab aluseks nime
select * from Person order by Name desc

--võtab 3 esimest rida
select top 3 * from Person

--võtab kolm esimest aga tabeli järjestus on Age ja siis Name
select * from Person
select top 3 Age, Name from Person

--näita esimesed 50% tabelist
select top 50 percent *  from Person

--Järjestab vanuse järgi isikud
select * from person order by cast(Age as int) desc