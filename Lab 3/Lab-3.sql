--3--
create or alter proc sp_Person_SelectTopThree
as
begin
	select top 3 * from person
end

exec sp_Person_SelectTopThree


--2--
create or alter proc sp_Department_DepartmentName
@DepartmentName varchar(50) = null
as
begin
	select person.* from Person
	inner join Department
	on person.DepartmentID = Department.DepartmentID
	where @DepartmentName is null or Department.DepartmentName = @DepartmentName
end

exec sp_Department_DepartmentName 'HR'


--3--
create or alter proc sp_Person_DepartmentandDegisnationName
@DepartmentName varchar(50) = null,
@DeginationName varchar(50) = null
as
begin
	select  Person.FirstName,
			Person.Salary,
			Person.JoiningDate,
			Department.DepartmentName
	from Person
	inner join Department
	on Person.DepartmentID = Department.DepartmentID
	inner join Designation
	on Person.DesignationID = Designation.DesignationID
	where (@DepartmentName is null or Department.DepartmentName = @DepartmentName)
	and 
	(@DeginationName is null or Designation.DesignationName = @DeginationName)
end 

exec sp_Person_DepartmentandDegisnationName


--4--
create or alter proc sp_Person_FirstName
@FirstName varchar(50) = null
as
begin
	select  Person.*,
			Department.DepartmentName,
			Designation.DesignationName
	from Person
	left outer join Department
	on Person.DepartmentID = Department.DepartmentID
	left outer join Designation
	on Person.DesignationID = Designation.DesignationID
	where @FirstName is null or Person.FirstName = @FirstName
end

exec sp_Person_FirstName


--5--
create or alter proc sp_Person_DepartmentwiseMinMaxTotal
as
begin
	select  Department.DepartmentName,
			max(Person.Salary) as Maximum_Salary,
			min(Person.Salary) as Minimum_Salary,
			sum(Person.Salary) as Total_Salary
	from person
	left outer join Department
	on Person.DepartmentID = Department.DepartmentID
	group by Department.DepartmentName
end

exec sp_Person_DepartmentwiseMinMaxTotal


--6--
create or alter proc sp_Person_DesignationwiseMinMaxTotal
as
begin
	select  Designation.DesignationName,
			max(Person.Salary) as Maximum_Salary,
			min(Person.Salary) as Minimum_Salary,
			sum(Person.Salary) as Total_Salary
	from person
	left outer join Designation
	on Person.DesignationID = Designation.DesignationID
	group by DesignationName
end

exec sp_Person_DesignationwiseMinMaxTotal