create database employee
use employee

--Question 1

create table Employee(EmployeeId int primary key, EmployeeName nvarchar(20), ManagerID int)
insert into Employee values (1, 'Mike', 3)
insert into Employee values (2, 'David', 3)
insert into Employee values (3, 'Roger', null)
insert into Employee values (4, 'Marry', 2)
insert into Employee values (5, 'Joseph', 2)
insert into Employee values (6, 'Ben', 2)
select * from Employee


SELECT E.EmployeeName as 'Employee Name',
ISNULL(M.EmployeeName, 'Top Manager') as 'Manager Name'
FROM Employee E
left join Employee M 
on E.ManagerID=M.EmployeeId

--Question 2

create table Department(DeptId nvarchar(20), EmpName nvarchar(20), Salary int)
insert into Department values ('Engg', 'Sam', 1000)
insert into Department values ('Engg', 'Smith', 2000)
insert into Department values ('Engg', 'Tom', 2000)
insert into Department values ('HR', 'Denis', 1500)
insert into Department values ('HR', 'Denny', 3000)
insert into Department values ('IT', 'David', 2000)
insert into Department values ('IT', 'John', 3000)


SELECT DeptId, EmpName, Salary FROM Department 
WHERE Salary
IN (SELECT MAX(Salary) FROM Department GROUP BY DeptID)