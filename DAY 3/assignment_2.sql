show databases;
use  inventory;
CREATE TABLE Employee (
    Employee_id int ,
    First_name VARCHAR(50),
	Last_name VARCHAR(50),
	Salary int,
	Joining_date Date,
    Departement  VARCHAR(50) 
);
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Departement) VALUES (1, ' Bob ', 'Kinto', 1000000, "2019-01-20", "Finance");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Departement) VALUES (2, '  Jerry  ', 'Kansxo', 6000000, "2019-01-15", "IT");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Departement) VALUES (3, '   Philip   ', 'Jose', 8900000, "2019-02-05", "Banking");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Departement) VALUES (4, ' John ', 'Abraham', 2000000, "2019-02-25", "Insurance");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Departement) VALUES (5, '  Michael  ', 'Mathew', 2200000, "2019-02-28", "Finance");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Departement) VALUES (6, '   Alex   ', 'chreketo', 4000000, "2019-05-10", "IT");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Departement) VALUES (7, ' Yohan ', 'Soso', 1230000, "2019-06-20", "Banking");

select * from employee;
select  first_name, last_name from employee;

--  Display all the values of the “First_Name” column using the alias “Employee
select first_name as "Employee" from employee;

-- Get all “Last_Name” in lowercase. 

SELECT lower(last_name) AS Lowercase FROM employee;


-- 5. Get all “Last_Name”  in uppercase 
 select upper(last_name) as Uppercase from employee;
 
 -- Get unique “DEPARTMENT" 
 
 select distinct Departement from employee;
 
 -- Get the first 4 characters of “FIRST_NAME” column 
 
  select substring(first_name, 1,4) from employee;
  
  -- Get the position of the letter ‘h’ in ‘John’.
  
  select position("h" in "john") , instr('john','h');
  
-- Get all values from the “FIRST_NAME” column after removing white space on the right.
select  rtrim(FIRST_NAME) as "FIRST_NAME" from employee;
  
  -- Get all values from the “FIRST_NAME” column after removing white space on the left.
  select  ltrim(FIRST_NAME)  as "FIRST_NAME"  from employee;

  /* PART 2*/

-- Concat and display the names


select concat(first_name,last_name) as "fullname" from employee;

-- List name of the employees earning salary more than 4 million 
select first_name,last_name from employee where salary > 4000000;

-- List employees belonging to IT department

select first_name,last_name from employee where Departement='IT';

-- List salaries of Insurance department
select Salary from  employee where Departement='Insurance';

select first_name,last_name from  employee where Departement in ( 'Banking','Finance');

select * from employee;

-- Get the salary employee having the name "Bob 
select Salary from employee where first_name like '%bob%';


-- Get total salary as "Expenditure"

select sum(salary) as "Expenditure" from employee;

-- Get first name after trimming space in suffix

select rtrim(first_name) from employee;

-- Get last name after trimming space in preffix

select ltrim(last_name) from employee;

/-- PART 3/

-- Get list of employees who joined in february

select * from employee where month(joining_date) = '02';

-- List the salaries of employees who joined in 2nd quart

select first_name , salary from employee where month(joining_date) in ( '04','05','06');

-- List the date in the format "Bob joined on day:20 month:01 year:2019

select  concat('Bob joined on day : ', day(joining_date),' month : ',month(joining_date),' year : ',year(joining_date ) ) as "date format" from employee 
 where month(joining_date) = '01'
 and day(joining_date) = '20'
 and year(joining_date)='2019';
 
 -- Get employee who has "jo" in either of the names
 
 select first_name,last_name from employee where first_name like '%jo%'or last_name like'%jo%'; 
 
 -- List how much "Yohan" earns after deducting one lakh from his salary
 
 select salary-1000000 from employee where first_name like '%yohan%' or last_name like'%yohan%'; 
 
 
 -- Trim the spaces in the names and concat them as "last name, first name" 
 select concat(trim(first_name),', ',trim(last_name)) as "last name, first name" from employee;
 
 -- . Replace "John" with "Jane" and the rest as it is
 
 select replace(first_name,"John","Jane") from employee;

 -- List the employees who earns more than one million
 
 select first_name ,salary from employee where salary>1000000;
--  Find the position of 'i' from the department
select position("i" in departement) ,departement from employee;

-- List salary details: Salary, HRA, DA, PF, Income(Salary+HRA+DA), Deductions(PF),
--  Net Salary(Income-Deductions) HRA-10% of salary, DA-5% of salary, PF-1% of salary
select  first_name, salary as "Net salary", salary-.1*salary as "HRA",salary-.5*salary as "DA" , salary-.01*salary as "PF" from employee;

 
 