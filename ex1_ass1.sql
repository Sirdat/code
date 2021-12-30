USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Company')
DROP DATABASE Company
GO

CREATE DATABASE Company
GO

USE Company
GO


 CREATE TABLE Department(
 dno int NOT NULL PRIMARY KEY,
 dname nvarchar(20) NOT NULL,
 budget int NOT NULL
 )
 GO

 CREATE TABLE Employee(
 ssn int NOT NULL PRIMARY KEY,
 salary int NOT NULL,
 phone char(10) NOT NULL,
 dno int,
 CONSTRAINT Fk_Employee_Department FOREIGN KEY(dno) REFERENCES Department(dno)
 )
 GO

 CREATE TABLE ChildEmployee(
	name nvarchar(20) NOT NULL,
	age int NOT NULL,
	ssn int NOT NULL,
	dno int NOT NULL,
	PRIMARY KEY(ssn,dno),
	CONSTRAINT Fk_ChildEmployee_Department FOREIGN KEY(dno) REFERENCES Department(dno),
	CONSTRAINT Fk_ChildEmployee_Employee FOREIGN KEY(ssn) REFERENCES Employee(ssn)
	)
GO
INSERT INTO Department VALUES(1,N'A Department',10000)
INSERT INTO Department VALUES(2,N'B Department',15000)
INSERT INTO Department VALUES(3,N'C Department',30000)
GO
INSERT INTO Employee VALUES(1,1000,'123456789',1)
INSERT INTO Employee VALUES(2,1000,'123456789',Null)
INSERT INTO Employee VALUES(3,1000,'123456789',Null)
INSERT INTO Employee VALUES(4,1000,'123456789',2)
GO
INSERT INTO ChildEmployee VALUES(N'Văn Thanh',23,1,1)
INSERT INTO ChildEmployee VALUES(N'Văn Toàn',22,1,2)
INSERT INTO ChildEmployee VALUES(N'Văn Quý',23,2,3)
INSERT INTO ChildEmployee VALUES(N'Xuân Lộc',28,1,3)

SELECT dno,dname,budget
FROM Department
SELECT ssn,salary,phone,dno
FROM Employee 
SELECT name,age,ssn,dno
FROM ChildEmployee
