Here's a well-structured **README.md** file for your SQL project to submit on GitHub. It explains the purpose, structure, and subquery usage in your code.

---

## 📘 README.md

````markdown
# 📊 SQL Subqueries Practice – CompanyDB

This project demonstrates the use of **SQL subqueries** in different clauses such as `SELECT`, `WHERE`, and `FROM`. It also includes examples of **scalar** and **correlated subqueries**, and subqueries with operators like `IN`, `EXISTS`, and `=`.

---

## 🏢 Database: CompanyDB

### Tables:
- **Departments**
- **Employees**

---

## 🗂️ Table Structures

### 🔸 Departments

| Column         | Type         | Description               |
|----------------|--------------|---------------------------|
| DepartmentID   | INT (PK)     | Unique department ID      |
| DepartmentName | VARCHAR(50)  | Name of the department    |

### 🔸 Employees

| Column       | Type           | Description                |
|--------------|----------------|----------------------------|
| EmployeeID   | INT (PK)       | Unique employee ID         |
| Name         | VARCHAR(100)   | Employee name              |
| DepartmentID | INT (FK)       | Foreign key to Departments |
| Salary       | DECIMAL(10,2)  | Employee salary            |

---

## 🧪 Sample Data Inserted

- Departments: HR, IT, Finance, Marketing
- Employees: Adnan, Bobby, Charwick

---

## ✅ Subquery Examples

### 1. **Subquery in `SELECT` (Scalar Subquery)**
Returns the average company salary as an extra column for each employee.

```sql
SELECT 
    Name, 
    Salary,
    (SELECT AVG(Salary) FROM Employees) AS CompanyAverageSalary
FROM Employees;
````

---

### 2. **Subquery in `WHERE` with `IN`**

Filters employees who belong to 'IT' or 'Finance' departments.

```sql
SELECT Name, Salary
FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Departments
    WHERE DepartmentName IN ('IT', 'Finance')
);
```

---

### 3. **Subquery in `WHERE` with `=`**

Finds the employee with the maximum salary.

```sql
SELECT Name, Salary
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary) FROM Employees
);
```

---

### 4. **Subquery in `WHERE` with `EXISTS`**

Returns employees if their department exists with the name 'HR'.

```sql
SELECT Name
FROM Employees E
WHERE EXISTS (
    SELECT 1
    FROM Departments D
    WHERE D.DepartmentID = E.DepartmentID AND D.DepartmentName = 'HR'
);
```

---

### 5. **Subquery in `FROM` Clause**

Calculates the average salary per department using a derived table.

```sql
SELECT DeptAvg.DepartmentID, DeptAvg.AvgSalary
FROM (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) AS DeptAvg;
```

---

### 6. **Correlated Subquery**

Finds employees earning more than the average salary of their own department.

```sql
SELECT Name, Salary
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = E.DepartmentID
);
```

---

## 📌 Key Concepts Demonstrated

| Concept              | Demonstrated            |
| -------------------- | ----------------------- |
| Subquery in `SELECT` | ✅                       |
| Subquery in `WHERE`  | ✅ (`IN`, `=`, `EXISTS`) |
| Subquery in `FROM`   | ✅                       |
| Scalar Subquery      | ✅                       |
| Correlated Subquery  | ✅                       |

---

## 📁 How to Run

1. Copy and paste the SQL script into your SQL editor (MySQL, PostgreSQL, etc.).
2. Execute the queries step by step or all at once.
3. Analyze the results to understand how each subquery works.

---

## 📬 Author

Adnan Shafi
*SQL Subqueries Practice Project*

```

---

Let me know if you'd like:
- A `.sql` file to go along with this README
- A GitHub repository structure
- Markdown badges or screenshots

Would you like me to generate the `.sql` script and README as downloadable files too?
```
