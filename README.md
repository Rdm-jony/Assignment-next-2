## 1.What is PostgreSQL?

PostgreSQL হচ্ছে একটি পাওয়ারফুল এবং  ওপেন সোর্স  রিলেশনশিপ ডাটাবেজ ম্যানেজমেন্ট সিস্টেম।
**Features:-**
 - ACID সম্মতি।
 - সাপোর্ট কমপ্লেক্স  ডাটা টাইপ।
 - JSON সাপোর্ট।
 - স্ট্রং ডাটা  ইনটেগ্রিটি।
 - ফ্রি এবং ওপেন সোর্স।

## 2.What is the purpose of a database schema in PostgreSQL?

একটি স্কিমা হচ্ছে ব্লু প্রিন্ট বা একটি কন্টেইনার  এর মত
যা:
 - বিভিন্ন  টেবল, ভিউ  এবং  অন্যান্য  অবজেক্ট কে  অর্গানাইজ করে।
 - ডাটার স্ট্রাকচার এবং রিলেশনশিপ ডিফাইন করে।
 - এক্সেস এবং পারমিশন কন্ট্রোল করে।
 - গ্রুপিং অবজেক্ট এর মাধ্যমে নেম(Name) কমপ্লিকট কে  এভোয়েড করে।

*IN short:*
সহজ কথায় ডাটাবেজ কে অরগানাইজ, স্ট্রাকচার এবং সিকিউর করে।

## 3.Explain the Primary Key and Foreign Key concepts in PostgreSQL.
### Primary Key
 - কলাম  বা  কলামের সেট যা  কোন টেবিলের প্রতিটা রো  কে ইউনিকভাবে আইডেন্টিফাই করতে ব্যবহার করা হয়।
 - নাল ভেলু রাখা যাবে না।
 - অবশ্যই ইউনিক ভেলু রাখতে হবে।
 - প্রত্যেকটি টেবিল একটি করে প্রাইমারি কি থাকে।

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
 - কলাম এবং কলামের সেট যা দুটি টেবিল কে  কানেক্ট করার জন্য ব্যবহার করা হয়
 - অন্য কোন টেবিলের প্রাইমারি কি কে ফরেইন কি হিসেবে ব্যবহার করা হয় 
 - রেফারেন্সিয়াল ইনটেগ্রিটি তৈরি করে।

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
|ডাটার একচুয়াল ল্যান্ত স্টোর করে|সব সময় ফিক্সড ল্যান্ত স্টোর করে|
|ব্যবহার করা হয় যখন কোন একটি  বেরিয়েবল এর লেন্থ ভিন্ন ভিন্ন হয়| ব্যবহার করা হয় যখন বেরিয়েবল এর লেন্থ সব সময় সেম থাকে
|
|`'abc'` stored as 3 chars|`'abc'` stored as `'abc '` (if length defined as 4)

### 5.Explain the purpose of the WHERE clause in a SELECT statement.
 *SELECT* স্টেটমেন্টে *WHERE*  ক্লস ব্যবহার করা হয়, যখন কোন একটি টেবিলের প্রতিটা রোকে কন্ডিশনের ভিত্তিতে ফিল্টারিং করা হয়।

**Purpose**
 - টি শুধুমাত্র সেই রো গুলোকে  সিলেক্ট করে যা নির্দিষ্ট  কন্ডিশন পূরণ  করে।
 - যে রো গুলো কন্ডিশন   পূরণ করে না, সে রো গুলোকে রেজাল্টের মধ্যে দেখানো হয় না।
 - একটি টেবিলের সব রো গুলোর পরিবর্তে নির্দিষ্ট সংখ্যক রোকে রিট্রিব  করে।

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
 - **LIMIT:** নির্দিষ্ট সংখ্যক রোকে রিটার্ন করে।
 - **OFFSET:** কতগুলো রোকে স্কিপ করার পর থেকে নির্দিষ্ট সংখ্যক রো কে  রিটার্নকরা হয়।

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

দুটি টেবিলের রিলেটেড একটি কলাম কে নিয়ে দুটি টেবিল  কে কম্বাইন করার জন্য `JOIN` অপারেশন ব্যবহার করা হয়।

>সাধারণত একটি  `Foreign Key` রিলেশনশিপ।

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
| `INNER JOIN`      | শুধুমাত্র  দুটি টেবিলের মিলযুক্ত রো গুলি  রিটার্ন করে  |
| `LEFT JOIN`       | বাম টেবিল থেকে সমস্ত রো এবং ডান এর সাথে মিলে যাওয়া রোগুলি রিটার্ন করে
|
| `RIGHT JOIN`      |  ডান টেবিল থেকে সমস্ত রো এবং বাম এর সাথে মিলে যাওয়া রোগুলি রিটার্ন করে 
| `FULL OUTER JOIN` | যখন কোনও একটি টেবিলে মিল থাকে তখন সমস্ত  
রোগুলি রিটার্ন করে       |
| `CROSS JOIN`      | কার্তেসিয়ান গুণন রিটার্ন করে                    |

### 9. Explain the GROUP BY clause and its role in aggregation operations.

*GROUP BY*  ক্লস ব্যবহার করা হয় , টেবিলের একটি বা মাল্টিপল কলামের মধ্যে  যেসব রো এর ভেলু সেম  থাকে সেসব  রো কে নিয়ে  ইউনিক ভাবে গ্রুপ করা হয় এবং  কিছু এগ্রিগেট ফাংশনও পারফর্ম করা হয়  যেমন `COUNT()`,`MAX()`,`MIN()`,`AVG` etc.

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

| department | employee\Returns_count | avg\_salary |
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

