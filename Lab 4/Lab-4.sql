--Lab 4--

--1--
create function hello_world()
returns varchar(100)
as 
begin 
	declare @str varchar(20)
	set @str = 'Hello World'
	return @str
end

select dbo.hello_world()


--2--
create function Add_two_Number(@num1 int, @num2 int)
returns int
as 
begin 
	declare @numb1 int , @numb2 int
	return @num1 + @num2
end

select dbo.Add_two_Number(12,345)


--3--
create function CubeOfNumber(@num int)
returns int
as
begin 
	declare @numb int
	set @numb = @num
	return @numb * @numb * @numb
end

select dbo.CubeOfNumber(34)


--4--
create function OddEven(@num int)
returns varchar(10)
as
begin
	declare @result varchar(5)

	if(@num % 2 = 0)
		set @result = 'Even'
	else
		set @result = 'Odd'
		
	return @result
end

select dbo.OddEven(5)


--5--
create or alter function CompareInteger(@n1 int, @n2 int)
returns varchar(20)
as
begin
	declare @result varchar(50)
	 set @result = case
					when @n1 > @n2
					then convert(varchar(5),@n1)+' is greater'

					when @n1 < @n2
					then convert(varchar(5),@n2)+' is greater'

					when @n1=@n2
					then 'Both are same'
					end
		return @result
end
select dbo.CompareInteger(2,3)

--6--
create function Printnums(@num int)
returns varchar(200)
as 
begin
	declare @result varchar(200), @i int
	set @i=1
	set @result = ''
	while(@i <= @num)
		begin
			set @result = @result +(convert(varchar(5),@i)+' ')
			set @i = @i+1
		end
	return @result
end

select dbo.Printnums(50)


--7--
alter function Printsum(@num int)
returns int
as 
begin
	declare @result int, @i int
	set @i=2
	set @result = 0
	while(@i <= @num)
		begin
			set @result = @result + @i
			set @i = @i+2
		end
	return @result
end

select dbo.Printsum(25)


--8--
alter function CheckPrime(@num int)
returns varchar(30)
as 
begin
	declare @i int, @count int, @prime varchar(30)
	set @count =0
	set @i = 2
	while (@i<=@num/2)
		begin
			if(@num%@i=0)
				begin
					set @count =  1
					break
				end
			set @i = @i+1
		end

	if(@count != 0)
		begin 
			set @prime = 'Number is not a Prime'
		end
	else
		begin
			set @prime = 'Number is Prime'
		end
	return @prime
end

select dbo.CheckPrime(18)


--9--
create function DayDifference(@date1 date, @date2 date)
returns int
as 
begin
	declare @difference int
	set @difference = datediff(day,@date1,@date2)
	return @difference
end

select dbo.DayDifference('2020-12-02','2020-12-03')


--10--
alter function TotalDay(@year int, @month int)
returns varchar(500)
as
begin
	declare @result varchar(500), @date varchar(500)
	set @date = '01-'+convert(varchar(6),@month)+'-'+convert(varchar(6),@year)
	set @result = 'days in given '+ CONVERT(VARCHAR(50),DATENAME(MONTH,(convert(datetime,@date,103))))+' '+CONVERT(VARCHAR(50),DATENAME(YEAR,(convert(datetime,@date,103))))+ ' is '+ convert(varchar(200),day(eomonth(convert(datetime,@date,103))))
	return @result
end

SELECT DBO.TotalDay(2003,2)	


--11--
create or alter function PersonName()
returns table
as
return (select * from person
		where FirstName like 'B%')

select * from PersonName()

--12--
create or alter function UniqueName()
returns table
as
return (select distinct Person.FirstName from 
		person)

select * from UniqueName()


--13--
create or alter function DepartmentId(@departmentid int)
returns table
as
return (select * from Person
		where DepartmentID = @departmentid)

select * from DepartmentId(1)