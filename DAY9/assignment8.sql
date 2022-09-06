-- ASSIGNMENT 8
use inventory;
-- 1. Get first 3 employees who were the earliest to join 

select * from employee;

select first_name,last_name from employee order by joining_date limit 3;

-- 2. Get first 3 employees who were the latest to join.

select first_name,last_name from employee order by Joining_date desc limit 3;

-- 3. Get details of the employees who were neither the first joinee nor last joinee

select first_name,last_name from employee order by Joining_date limit  1,5 ;

select * from employee order by Joining_date limit  1,5 ;

-- 4. Create a table dpt_toppers containing employees from each department earning
  -- highest salary
  select * from employee;
  create table dpt_toppers as 
    select * from employee where salary in (select max(salary) from employee group by Departement);
    
    
  -- 5. Get top salary using max
  
  select max(salary) from employee;
  
  -- 6. Get top salary using limit
 
  select salary from employee order by salary desc limit 1;
  
  -- 7. Get top salary using sub query
  -- get top sales using subquery
 select salary from employee where salary = (select max(salary) from employee);
  
  -- 8. Include comments column in dpt_toppers stating to 'give 10% bonus' for those
-- employees who have not received any reward

		alter table dpt_toppers add column comments varchar(100);
		-- update using multiple/other tables along with subquery
		update dpt_toppers set comments = 'give 10% bonus for those  employees who have not received any reward'
		where employee_id in (SELECT employee_id FROM inventory.employee where employee_id not in (select employee_ref_id from reward));

		select * from dpt_toppers;

-- 9. Create a view vw_facilitated who have recieved rewards being a top salary earner
-- of their department
		drop view vw_facilitated;
		create view vw_facilitated  as select * from employee where  employee_id in 
		(select employee_ref_id from reward);

		select * from vw_facilitated;

 -- 10. Delete those employees from dpt_toppers who have received rewards alread
		  select * from dpt_toppers;  
		  
		 delete from dpt_toppers where employee_id in (select employee_ref_id from reward);  
