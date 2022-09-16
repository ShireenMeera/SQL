-- Assignment 13 
-- practice 1

-- 1. Find Second Highest Salary from Employee table using subquery

use inventory;

select  max(salary) from employee where salary <> (select max(salary) from employee );

select max(salary) from employee;


-- 2. Find Second Highest Salary from Employee table using
-- "not" any where in the query

select  max(salary) from employee where salary not in (select max(salary) from employee);


-- 3. Find Second Highest Salary from Employee table using inline table;

-- 4. Find Second Highest Salary from Employee table using rank window function
select * from 
(select first_name,last_name, rank() over (order by salary desc) as "Rank" from employee)  e 
where e.Rank = 2;

select*from employee;
-- 5. Find Second Highest Salary from Employee table using limit

select salary from employee order by Salary desc limit 1,1;

-- 6. Find Second Highest Salary from Employee table using "<>" any where in the query

select  max(salary) from employee where salary <> (select max(salary) from employee );

-- 7.  Find Second Highest Salary from Employee table using "max() function and subquery" anywhere in the query

select  max(salary) from employee where salary < ( select max(salary) from employee);

-- 8. Find duplicate employees in reward table

select*from reward;

select employee_ref_id  from reward group by employee_ref_id having count(Employee_ref_id) > 1;

Select employee_ref_id, COUNT(employee_ref_id) from reward group by employee_ref_id having  COUNT(employee_ref_id) > 1;

-- 9. Rank each salary using rank function

select first_name, Last_name, salary ,rank() over(order by salary desc) as New_Rank from employee;

-- 10. Rank each salary using dense rank function
delete from employee where employee_id=7;

insert into employee values (7,'ABC','DEF','8900000',NULL,'IT');

select employee_id, departement, salary, rank() over (order by salary desc) as "Rank",
dense_rank() over (order by salary desc) as "dense_rank" from employee;

-- only dense rank 
select employee_id, departement, salary, dense_rank() over (order by salary desc) as "dense_rank" from employee;

-- 11. Rank each salary "with out" using rank functions

select * from employee order by salary desc;
	
-- 12. Find Second Highest Salary from Employee table using "!=" any where in the query

select  max(salary) from employee where salary != (select max(salary) from employee );

-- 13. Find Second Highest Salary from Employee table using "left join and self join" anywhere in the query
-- 14. Find Second Highest Salary from Employee table using Row_number() function

-- 15. Find Second Highest Salary from Employee table using "Row_number() function" and pass blank inside "over()"

select * from (select salary,row_number() over (order by salary desc) as rn from employee)r where r.rn = 2; 


select employee_id, departement, salary, Row_number()  over (order by salary desc) as "row_no" from employee) r where r.row_no = 2;
