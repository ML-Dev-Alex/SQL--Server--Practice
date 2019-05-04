--Creates a simple table
create table Philosophers
(
	FirstName varchar(50),
	LastName varchar(50),
	Age int
)


--Populates our table
insert into Philosophers(FirstName, LastName, Age) values ('Friedrich', 'Nietzsche', 56);
insert into Philosophers (FirstName, LastName, Age) values ('Fyodor', 'Dostoyevsky', 60);
insert into Philosophers (FirstName, LastName, Age) values ('Lucius Annaeus', 'Seneca', 65);
insert into Philosophers (FirstName, LastName, Age) values ('Marcus', 'Aurelius', 59);
insert into Philosophers (FirstName, LastName, Age) values ('Epictetus', 'of Hierapolis', 80);
insert into Philosophers (FirstName, LastName, Age) values ('Plato', 'of Athens', 80);
insert into Philosophers (FirstName, LastName, Age) values ('Socrates', 'of Athens', 71);

--Selects every Athenian, and updates Socrates' age 
select FirstName, LastName, Age
from Philosophers
where LastName='of Athens';

update Philosophers
Set Age=70
where LastName='of Athens'
and FirstName='Socrates';

--Delete- everyone without a properLast Name
DELETE Philosophers
where LastName Like 'of%';

--Adds a column for the User's cities
alter table Philosophers
add City varchar(50);

--Selects all users without specified cities
Select *
from Philosophers
where City IS NULL;

--Create a new table and populate it with books
Create table Books
(
	id int primary key identity(1, 1),
	BookName varchar(50)
)

alter table Books
add School varchar(50);


select * from Books

insert into Books (BookName, School) values('Beyond Good and Evil', 'Existentialism');
insert into Books (BookName, School) values('Meditations', 'Stoicism');
insert into Books (BookName, School) values('Enchiridion', 'Stoicism');
insert into Books (BookName, School) values('The Republic', 'Existentialism');
insert into Books (BookName, School) values('Beyond Good and Evil', 'Political Philosophy');
insert into Books (BookName, School) values('Notes from Underground', 'Philosophical Fiction');
insert into Books (BookName, School) values('De Brevitate Vitae', 'Stoicism');



--Create a relational table and populate it with relations
Create table Authorisms
(
	AthorismId int primary key identity(1, 1),
	AuthorId int,
	BookId int, 
	WritingYear int
)

select * from Philosophers;
select * from Books;
select * from Authorisms;

insert into Authorisms (AuthorId, BookId, WritingYear) values (1, 1, 1886);
insert into Authorisms (AuthorId, BookId, WritingYear) values (2, 6, 1864);
insert into Authorisms (AuthorId, BookId, WritingYear) values (3, 7, -49); -- negative numbers = AD
insert into Authorisms (AuthorId, BookId, WritingYear) values (4, 2, -161);

--Adds Ids to philosophers
alter table Philosophers
add Id int primary key identity(1, 1);

--Populates philosophers cities 
update Philosophers
Set City='Cordoba' 
where LastName='Seneca'

update Philosophers
Set City='Rocken' 
where LastName='Nietzsche'

update Philosophers
Set City='Moscow' 
where LastName='Dostoyevsky'

update Philosophers
Set City='Rome' 
where LastName='Aurelius'

--View result
select * from Philosophers;
select * from Books;
select * from Authorisms;

select * from Authorisms
inner join Books on Books.Id=BookId
inner join Philosophers on Philosophers.Id=AuthorId
