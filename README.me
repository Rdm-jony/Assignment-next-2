## 1.What is PostgreSQL?

PostgresSQL is a powerful and open source relational database management system.
**Features:-**
 - ACID compliance
 - Support complex data types
 - JSON support
 - Strong data integrity
 - Fee & open source

## 2.What is the purpose of a database schema in PostgreSQL?

A schema is like a blueprint or a container that:
 - Organizes table,view and other database objects.
 - Define structured and relationships of data
 - Controll access and permission
 - Avoid name conflict bt grouping object

*IN short:*
Helps to database organized,structured and secure.

## 3.Explain the Primary Key and Foreign Key concepts in PostgreSQL.
### Primary Key
 - Column or set of column used to uniquely identify each row of a table.
 - Cannot conatin NULL values.
 - Must contain unique value.
 - Each table have one primary key.

*Example*
```
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

``` 
### 📄 Table: `Employees`

| employee_id (PK)| name | eamil|
|-------------|-----------------|-------------|
| 1 | Alice Green              | Alice@gmail.com|
| 2   | Bob White               |Bob@gmail.com
| 3  | Carol King              |Carol@gmail.com

### Foreign Key
 - Column or set of column used to connect two table
 - contain the primary key of another table
 - Create referntial integrity

*Example*
```
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    employee_id INT,
    order_date DATE,
    CONSTRAINT fk_employee
      FOREIGN KEY(employee_id)
      REFERENCES employees(employee_id)
);
```
### 📄 Table: `Orders`

| order_id (PK) | employee_id (FK) | product_name | order_date  |
|----------|-------------|--------------|-------------|
| 101      | 1           | Keyboard     | 2024-05-01  |
| 102      | 2           | Mouse        | 2024-05-02  |
| 103      | 1           | Monitor      | 2024-05-03  |

### 4.What is the difference between the VARCHAR and CHAR data types?
|            VARCHAR       |               CHAR                   |
|--------------------------|--------------------------------------|
|Vaiable length chracter string|Fixed length charcter string|
|Store actual length of data|Store always fixed length|
|Use when string length varies a lot| Use when sirng length always same|
|`'abc'` stored as 3 chars|`'abc'` stored as `'abc '` (if length defined as 4)

### 5.Explain the purpose of the WHERE clause in a SELECT statement.
THE *WHERE* clause is *SELECT* statement used for filter rowa from a table based on specific conditions.

**Purpose**
 - It selects only those rows that meet the condition.
 - Rows that do not satisfy the condition are excluded from the result.
 - Helps retrieve specific data instead of all rows.

***Example***
### 📄 Table: `Employee`

| employee\_id | name        | department | salary |
| ------------ | ----------- | ---------- | ------ |
| 1            | Alice Green | Sales      | 5000   |
| 2            | Bob White   | HR         | 4500   |
| 3            | Carol King  | Sales      | 5500   |
| 4            | Dan Brown   | IT         | 6000   |

```
SELECT name, salary
FROM employees
WHERE department = 'Sales';

```
### 📄 Table: `AFTER FILTER`

| name        | salary |
| ----------- | ------ |
| Alice Green | 5000   |
| Carol King  | 5500   |

### 6.What are the LIMIT and OFFSET clauses used for?
 - **LIMIT:** Return the specific maximum number of rows
 - **OFFSET:** Skips a specific rows before return the specific maximum number of rows.

 > Basically usefull for ***Pagination***

 ***Example***
### 📄 Table: `Employee`

| employee\_id | name        | department |
| ------------ | ----------- | ---------- |
| 1            | Alice Green | Sales      |
| 2            | Bob White   | HR         |
| 3            | Carol King  | IT         |
| 4            | Dan Brown   | Sales      |
| 5            | Eva Black   | HR         |
| 6            | Frank Stone | IT         |
| 7            | Grace Field | Sales      |

```
SELECT * FROM employees
LIMIT 3;

```
### 📄 Table: `After using LIMIT`

| employee\_id | name        | department |
| ------------ | ----------- | ---------- |
| 1            | Alice Green | Sales      |
| 2            | Bob White   | HR         |
| 3            | Carol King  | IT         |

```
SELECT * FROM employees
ORDER BY employee_id
LIMIT 3 OFFSET 3;
```
### 📄 Table: `After using LIMIT & OFFSET`

| employee\_id | name        | department |
| ------------ | ----------- | ---------- |
| 4            | Dan Brown   | Sales      |
| 5            | Eva Black   | HR         |
| 6            | Frank Stone | IT         |

### 7.How can you modify data using `UPDATE` statements

#### ✅ Basic syntex
```
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

```
>🔒 Important: Always use a `WHERE` clause to prvent mistake.Unless Update all rows of table.

***Example***
### 📄 Table: `Employee`

| employee\_id | name        | department | salary |
| ------------ | ----------- | ---------- | ------ |
| 1            | Alice Green | Sales      | 5000   |
| 2            | Bob White   | HR         | 4500   |
| 3            | Carol King  | Sales      | 5500   |


```
UPDATE employees
SET salary = salary + 500
WHERE department = 'Sales';

```
### 📄 Table: `After update salary`

| employee\_id | name        | department | salary |
| ------------ | ----------- | ---------- | ------ |
| 1            | Alice Green | Sales      | 5500   |
| 2            | Bob White   | HR         | 4500   |
| 3            | Carol King  | Sales      | 6000   |

### 8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?

The `JOIN` operation is used for combine two or more table based on related a related column.
>Usally a `Foreign Key` relationships

***Example***
#### 📄 Table: `Employee`

| employee\_id | name        |
| ------------ | ----------- |
| 1            | Alice Green |
| 2            | Bob White   |
| 3            | Carol King  |

#### 📄 Table: `Order`

| order\_id | employee\_id | product  |
| --------- | ------------ | -------- |
| 101       | 1            | Laptop   |
| 102       | 2            | Keyboard |
| 103       | 1            | Mouse    |

```
SELECT employees.name, orders.product
FROM employees
JOIN orders ON employees.employee_id = orders.employee_id;

```
#### 📄 Table: `Result after JOIN`

| name        | product  |
| ----------- | -------- |
| Alice Green | Laptop   |
| Bob White   | Keyboard |
| Alice Green | Mouse    |

#### 🧠 JOIN Types in PostgreSQL:
| JOIN Type         | Description                                                            |
| ----------------- | ---------------------------------------------------------------------- |
| `INNER JOIN`      | Only returns rows with matches in both tables                          |
| `LEFT JOIN`       | Returns all rows from the left table, and matching rows from the right |
| `RIGHT JOIN`      | Returns all rows from the right table, and matching rows from the left |
| `FULL OUTER JOIN` | Returns all rows when there is a match in one of the tables            |
| `CROSS JOIN`      | Returns the Cartesian product (every combination)                      |

### 9. Explain the GROUP BY clause and its role in aggregation operations.

The `GROUP BY` clause is used for **group rows** that have same value in one or more column and then preform aggregiate function like `COUNT()`,`MAX()`,`MIN()`,`AVG` etc.

#### ✅ Purpose of GROUP BY:
 - To summarize or aggregate data.

***Example***

#### 📄 Table: `Employee`

| employee\_id | name        | department | salary |
| ------------ | ----------- | ---------- | ------ |
| 1            | Alice Green | Sales      | 5000   |
| 2            | Bob White   | HR         | 4500   |
| 3            | Carol King  | Sales      | 5500   |
| 4            | Dan Brown   | HR         | 4700   |

```
SELECT department, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

```
#### 📄 Table: `Result`

| department | employee\_count | avg\_salary |
| ---------- | --------------- | ----------- |
| Sales      | 2               | 5250.0      |
| HR         | 2               | 4600.0      |

### 10.How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

#### ✅ Common Aggregate Functions:

| Function  | Description                      |
| --------- | -------------------------------- |
| `COUNT()` | Counts the number of rows        |
| `SUM()`   | Adds up values in a column       |
| `AVG()`   | Calculates the average of values |

***Example***

#### 📄 Table: `Employee`

| employee\_id | name        | department | salary |
| ------------ | ----------- | ---------- | ------ |
| 1            | Alice Green | Sales      | 5000   |
| 2            | Bob White   | HR         | 4500   |
| 3            | Carol King  | Sales      | 5500   |
| 4            | Dan Brown   | HR         | 4700   |

```
SELECT COUNT(*) AS total_employees
FROM employees;
```
#### `COUNT()`
| total\_employees |
| ---------------- |
| 4                |

```
SELECT SUM(salary) AS total_salary
FROM employees;

```
#### `SUM()`

| total\_salary |
| ------------- |
| 19700         |

```
SELECT AVG(salary) AS average_salary
FROM employees;

```
#### `AVG()`

| average\_salary |
| --------------- |
| 4925.00         |

