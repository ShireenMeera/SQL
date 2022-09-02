-- ASSIGNMENT 6

-- 1. Get the employee’s first name and last name in separate rows.
Select first_name name from employee union all select Last_name name from employee;


-- 2. Get the employee’s first name and last name in separate rows without duplicates.
select first_name name from employee union select last_name name from employee ;

-- 3. Get the employee’s first name, each reward amount for employees who have rewards.
select employee.first_name,amount from employee inner join reward on employee.employee_id=reward.Employee_ref_id;

-- 4. Get the first name, each reward amount for employees who have rewards not using "Inner Join"
select employee.first_name,amount from employee right join reward on employee.employee_id=reward.Employee_ref_id;


-- 5. Get the first name, each reward amount for employees along with who not have rewards by not
-- using “Inner Join”

select employee.first_name,amount from employee left outer join reward on employee.employee_id=reward.Employee_ref_id;

-- 6. . Get the first name, each reward amount for employees along with who not have rewards using
-- “union”.  --NOt sure about this answer
select employee.first_name from employee 
union 
select amount from reward;

-- Get count of employees having last name same as first name of other employee
update inventory.employee set  last_name ='johny' where last_name='Kansxo';
select count(*) from employee a, employee b where a.First_name=b.Last_name;

-- 8. List employees having last name same as first name of other employees
select b.* from employee a, employee b where a.First_name=b.Last_name;

-- 9. Get count of employees not having last name same as first name of other employees
-- NOt sure about this answer

select count(distinct b.Last_name) from employee a, employee b where a.First_name<>b.Last_name;
select  distinct b.Last_name from employee a, employee b where a.First_name<>b.Last_name;  --  and b.Last_name='johny' -- and a.first_name='johny';

-- 10. List FName, LName, rewardamount of employees having last name same as first name of other
 -- employees or vice-versa, with each of their reward amoun
-- NOt sure about this answer
select distinct  a.first_name,a.last_name,c.amount, b.first_name,b.Last_name,c.amount from employee a, employee b,reward c 
where (a.First_name=b.Last_name or b.First_name=a.Last_name) and (a.employee_id=c.employee_ref_id
or  b.employee_id=c.employee_ref_id); 











