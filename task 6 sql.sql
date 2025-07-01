
CREATE DATABASE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Employees VALUES
(101, 'Adnan', 1, 50000),
(102, 'Bobby', 2, 70000),
(103, 'Charwick', 2, 60000);

SELECT 
    Name, 
    Salary,
    (SELECT AVG(Salary) FROM Employees) AS CompanyAverageSalary
FROM Employees;

SELECT Name, Salary
FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Departments
    WHERE DepartmentName IN ('IT', 'Finance')
);

SELECT Name, Salary
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary) FROM Employees
);

SELECT Name
FROM Employees E
WHERE EXISTS (
    SELECT 1
    FROM Departments D
    WHERE D.DepartmentID = E.DepartmentID AND D.DepartmentName = 'HR'
);

SELECT DeptAvg.DepartmentID, DeptAvg.AvgSalary
FROM (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) AS DeptAvg;

SELECT Name, Salary
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = E.DepartmentID
);
