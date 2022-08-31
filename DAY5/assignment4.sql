-- 1. Fetch the departments that have less than two people in it

select * from employee;

select departement from employee group by Departement having count(*) <2 ;

-- 2 Show all departments along with the number of people in there

select departement,count(*) from employee  group by Departement;

-- 3. Get total salary for each department in the month of february

 select departement,sum(salary)  from employee group by Departement;
 
-- 4.  Use any five aggegrate functions on salary for each departement

select departement,sum(salary) from employee where departement='finance';

select Departement,count(*) from employee where departement='finance';

select departement, max(salary) from employee where departement='insurance';

select departement, min(salary) from employee where departement='it';

select departement, avg(salary) from employee where Departement='finance';

-- Get the employee’s department and minimum salary, grouped by department.

select departement ,min(salary) from employee group by departement;

-- Get the department, the number of employees in that department, and the total salary grouped by department, and sorted by total salary in descending order 
select departement,sum(salary)  ,count(*) from employee group by departement order by sum(salary) desc;

-- Get the minimum salary by department in ascending order of salary. 
select departement,min(salary) from employee group by departement order by sum(salary) asc;

-- Get the number of employees grouped by quarter and month of joining. 

select count(*),month(joining_date),quarter(joining_date)  from employee  group by month(joining_date),quarter(joining_date) ;

-- Get the department and maximum salary grouped by the department, where the maximum salary
 -- is greater than 1,000,000

  select departement, max(salary) from employee group by departement having max(salary)> 1000000 ;

-- Get employees whose first name is neither “Jerry” nor “John” 
 select first_name from employee where trim(first_name) <> 'Jerry'  and trim(first_name) not like '%John%' and trim(first_name) like '%_n%';















