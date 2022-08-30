 -- Get the employee’s first name after replacing ‘o’ with ‘#’.
 select replace(first_name,"o","#") from employee;
 

 --  Get all employees in ascending order by first name and descending order by salary;\
 
 select * from employee order by first_name asc, salary desc;
 
 -- Get employees whose first name is neither “Jerry” nor “John”.
 
 select first_name from employee where first_name like '%Jerry%' or first_name like '%John%';
 
 -- Get all the details about employees whose first name ends with ‘n’ and contains 4 letter
 
 
 select * from employee where length(trim(first_name))=4 and First_name like '% ___n%';
 
-- Get the employee’s department and total salary, grouped by department.

select departement, sum(salary) from employee group by Departement;


-- Get the department and total salary, grouped by department, and sorted by total salary in descending order

select departement, sum(salary) from employee group by Departement order by sum(salary)desc;


-- Get the average salary by department in ascending order of salary.
 
 select departement,avg(salary) from employee group by departement order by avg(salary)asc;
 
 --  Get the number of employees grouped by month of joining.
 select count(employee_id), month(joining_date) from employee group by month(joining_date);
 
 --  Get the maximum salary by department in descending order of salary
 select departement, max(salary) from employee group by departement order by avg(salary)desc;
 
 -- Get the department and total salary grouped by the department, where the total salary is greater than 1,000,000, 
 -- and sorted in descending order of the total salary
  select departement, sum(salary) from employee group by departement having sum(salary)> 1000000 order by sum(salary) desc;
  
-- Find maximum salary for the employees NOT having 'o' in their last name (Try using both
-- with/without group by)
 select max(salary) from employee where last_name not like '%o%' ;
 
  

  
  



