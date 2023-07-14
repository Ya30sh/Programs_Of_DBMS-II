--lab 1--
--1--
select Person.PersonName,Department.DepartmentName, Department.DepartmentCode
from Person
left outer join Department
on Person.DepartmentID = Department.DepartmentID

--2--
select Person.PersonName 
from Person
inner join Department
on Person.DepartmentID = Department.DepartmentID
where Department.Location  = 'C-Block'

--3--
select Person.PersonName, Person.Salary, Department.DepartmentName
from Person
inner join Department
on Person.DepartmentID = Department.DepartmentID
where Person.City = 'Jamnagar'

--4--
select Person.PersonName, Person.Salary, Department.DepartmentName
from Person
inner join Department
on Person.DepartmentID = Department.DepartmentID
where Person.City <> 'Rajkot'

--5--
select * 
from person
inner join Department
on Person.DepartmentID = Department.DepartmentID
where Department.DepartmentName = 'Computer'

--6--
select *
from person
left outer join Department
on Person.DepartmentID = Department.DepartmentID
where Department.DepartmentName is null

--7--
select Person.PersonName
from Person
left outer join Department
on Person.DepartmentID = Department.DepartmentID
where Person.JoingDate = '2001-08-01'

--8--
select person.PersonName, Department.DepartmentName 
from person
inner join Department 
on person.DepartmentID = Department.DepartmentID
where getdate() - Person.JoingDate > 365

--9--
select Department.DepartmentName, count(person.PersonID)
from Person 
inner join Department 
on Person.DepartmentID =  Department.DepartmentID
group by Department.DepartmentName

--10--
select Department.DepartmentName, MAX(person.Salary), MIN(person.Salary)
from Person 
inner join Department 
on person.DepartmentID = Department.DepartmentID
group by Department.DepartmentName

--11--
select Person.City, SUM(person.Salary), avg(person.Salary), max(person.Salary), min(person.Salary) 
from Person
inner join Department 
on person.DepartmentID = department.DepartmentID
group by person.city

--12--
select Department.DepartmentName, SUM(person.salary)
from Department 
inner join Person 
on person.DepartmentID = Department.DepartmentID
group by Department.DepartmentName
having sum(Person.Salary) > 100000

--13--
select Person.PersonName, avg(person.Salary)
from person
where person.City = 'Ahmedabad'
group by person.city, person.PersonName

--14--
select Department.DepartmentName, count(person.PersonID)
from Department
left outer join Person 
on Person.DepartmentID = Department.DepartmentID
group by Department.DepartmentName
having count(person.personId) = 0

--15--
select Department.DepartmentName, count(person.PersonID)
from Department
left outer join Person 
on Person.DepartmentID = Department.DepartmentID
group by Department.DepartmentName
having count(person.personId) >2

--16--
SELECT PERSON.PERSONNAME+' LIVES IN '+PERSON.CITY+' AND WORKS IN '+DEPARTMENT.DepartmentName 
FROM PERSON 
INNER JOIN DEPARTMENT
ON PERSON.DepartmentID=Department.DepartmentID

--17--
SELECT PERSON.PERSONNAME+' Earns '+convert(varchar,PERSON.Salary)+' From Department '+DEPARTMENT.DepartmentName+' Montly'
FROM PERSON 
INNER JOIN DEPARTMENT
ON PERSON.DepartmentID=Department.DepartmentID

--18--
select Person.City, Department.DepartmentName, SUM(person.Salary), avg(person.Salary), max(person.Salary) 
from Person
inner join Department 
on person.DepartmentID = department.DepartmentID
group by person.city, Department.DepartmentName

--19--
update Person
set person.salary = (Person.Salary + ((Person.Salary * 10)/100))
from person
full outer join Department
on Person.DepartmentID = Department.DepartmentID
where Department.DepartmentName = 'Computer'

--extra-1--
select * from Person 
full outer join Department
on Person.DepartmentID = Department.DepartmentID
order by person.City

--extra-2--
select Person.City, sum(person.Salary)
from person
full outer join Department
on person.DepartmentID = Department.DepartmentID
group by Person.City
order by sum(person.Salary) DESC

select * from Person_Info.dbo.Person
select * from Person_Info.dbo.Department