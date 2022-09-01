-- ASSIGNMENT 5  8/31/2022
alter table employee modify employee_id int primary key;
use inventory;

CREATE TABLE reward (
    Employee_ref_id int,
    date_reward Date,
	amount int,
    FOREIGN KEY (Employee_ref_id) REFERENCES Employee(Employee_id)
);

INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES (1, '2019-05-11', '1000');
INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES (2, '2019-02-15', '5000');
INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES (3, '2019-04-22', '2000');
INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES (1, '2019-06-20', '8000');

select * from reward;

-- 1. update the first name to 'Johny' for the employee having the first name as 'Bob' in it;
update employee set first_name= 'johny' where trim(first_name)='bob' ;

select * from employee;

-- 2. Get the name, the amount of the reward for the employees who have rewards

select employee.first_name,last_name,amount from employee inner join reward where employee.employee_id= reward.Employee_ref_id;

-- 3. Get the last name, the reward amount for employees who have rewards with an amount greater than 2500

select employee.last_name from employee inner join reward where employee.employee_id= reward.Employee_ref_id and amount > 2500;

-- 4 Get the employee name, the amount of the reward for the employees earning salary greater than 1 million, even if
-- they have not received any rewards

select employee.last_name,amount from employee left outer join reward on employee.employee_id= reward.Employee_ref_id and salary >1000000;

-- 5. Get total rewards for FINANCE department

select sum(amount) from employee inner join reward where employee.employee_id= reward.Employee_ref_id and departement='finance';

-- 6. Get total rewards for each department

select sum(amount),departement from employee  inner join reward where employee.employee_id= reward.Employee_ref_id group by departement ;

-- 7. Get net amount taken by each employee who received rewards less than 7500

-- inlne view
select * from (  -- outer query
select sum(amount) amount,employee_id from employee inner join reward where 
employee.employee_id= reward.Employee_ref_id  group by employee_id) A  -- inner query
 where amount < 7500 ;
 
 select sum(amount) amount,employee_id from employee inner join reward where 
employee.employee_id= reward.Employee_ref_id and  amount < 7500 group by employee_id ;

-- 8. Get the employee name, total amount of the reward for the employees , even if they have not
-- received any rewards. 

select employee.last_name,sum(amount) from employee left outer join reward on employee.employee_id= reward.Employee_ref_id group by 
employee.last_name;

-- 9. Get the employee name, total amount of the reward for the employees containing 'john' in their
-- firstname, even if they have not received any rewards.(use: having)

select employee.first_name,sum(amount) from employee left outer join reward on employee.employee_id= reward.Employee_ref_id 
 group by employee.first_name having trim(first_name) like '%john%';

-- 10. Get the employee name, total amount of the reward for the employees containing 'j' in their
-- firstname, even if they have not received any rewards.(use: where)

select employee.first_name,sum(amount) from employee left outer join reward on employee.employee_id= reward.Employee_ref_id 
 where trim(first_name) like '%j%' group by employee.first_name ;







