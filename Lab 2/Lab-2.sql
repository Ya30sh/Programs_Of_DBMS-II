--Lab-2--
--1--
create or alter procedure sp_department_insert
@DepartmentName varchar(50)
as
begin 
	insert into Department
	(	  DepartmentName
	)
	values( @DepartmentName)
end

exec sp_department_insert 'Incometax'


--2--
create or alter proc sp_department_update
@DepartmentId int,
@DepartmentName varchar(50)
as
begin
	 update Department
	 set	DepartmentName = @DepartmentName
			where DepartmentID = @DepartmentId
end

exec sp_department_update 5,'income'


--3--
create or alter proc sp_department_delete
@DepartmentId int
as
begin
	delete from Department
	where DepartmentID  = @DepartmentId
end

exec sp_department_delete 5


--4--
create or alter proc sp_SelectPK
@pk int
as
begin
	select * from Person
	where Person.WorkerID = @pk
end

exec sp_SelectPK 102


--5--
create or alter proc sp_AllTable
as
begin
	select 
		Person.WorkerID,
		person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Department.DepartmentName,
		Designation.DesignationName
	from Person
	left outer join Department
	on Person.DepartmentID = Department.DepartmentID
	left outer join Designation
	on Person.DesignationID = Designation.DesignationID
end

exec sp_AllTable