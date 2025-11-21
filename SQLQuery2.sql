	create database Emp;
	use Emp;

--1. Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).

	create table Employees
	(
	ID int Not Null ,    -->Primary Key q.6
	Name Varchar(50) Null,
	Salary decimal Null
	)

--2. Add a new column named "Department" to the "Employees" table with data type varchar(50).
	alter table Employees
	add Department varchar(50);

--3. Remove the "Salary" column from the "Employees" table.

	alter table Employees
	drop column Salary;

--4.Rename the "Department" column in the "Employees" table to "DeptName".

 exec sp_rename 'Employees.Department' ,'DeptName','column';

 --5. Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).

   create table Projects
   (
   ProjectID int Not Null ,
   ProjectName varchar(30) Null ,
   Emp_id int not null
   )

--6. Add a primary key constraint to the "Employees" table for the "ID" column.
 
	 alter table Employees
	 add constraint PK_Emp_id primary key(ID);
  
--7. Create a foreign key relationship between the "Employees" table (referencing "ID") 
--and the "Projects" table (referencing "ProjectID").

    alter table Projects
    add constraint Fk_Pro_Emp foreign key(Emp_id) references Employees(ID);

-- 8. Remove the foreign key relationship between "Employees" and "Projects."

	alter table Projects
	drop constraint Fk_Pro_Emp ; 

--9. Add a unique constraint to the "Name" column in the "Employees" table.
	alter table Employees
	add constraint unq_Name unique(Name);

--10. Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar),
--LastName (varchar), and Email (varchar), and Status (varchar).

create table Customers
	(
	CustomerID int primary key Not Null ,
	FirstName varchar(50) ,
	LastName varchar(50) ,
	Email varchar(30) ,
	Status varchar(50)
	)

--11.Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.

	alter table Customers
	add constraint Unq_FullName unique(FirstName,LastName) ;

--12. Add a default value of 'Active' for the "Status" column in the "Customers" table, where 
--the default value should be applied when a new record is inserted.

	alter table Customers
	add constraint default_Stat default 'Active' for Status ;

--13. Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer),
--OrderDate (datetime), and TotalAmount (decimal).

create table Orders
	(
	OrderID int primary key not null ,
	CustomerID int ,
	OrderDate datetime2 ,
	TotalAmount decimal
	)

--14. Add a check constraint to the "TotalAmount" column in the "Orders" 
--table to ensure that it is greater than zero.

	alter table Orders
	add constraint ch_Amount check(TotalAmount>0);

--15 .Create a schema named "Sales" and move the "Orders" table into this schema.
go
create schema Sales;
go

alter schema Sales transfer dbo.Orders;

--16. Rename the "Orders" table to "SalesOrders."
 exec sp_rename 'Sales.Orders','SalesOrders';