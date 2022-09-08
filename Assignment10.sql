/*Assignment 10
1. Write a procedure to fetch employee earning less than average salary
2. Write a procedure to fetch salary of the employee id passed as input
3. Write a function to fetch 50% of salary
4. Write a function to add a string to the passed name
5. Write a function to fetch the next maximum salary to the input
number passed*/


-- 1. Write a procedure to fetch employee earning less than average salary
drop procedure  fetch_avgerage_salary;
delimiter && 
create  procedure fetch_avgerage_salary(in xyz int, out nam int)
begin
select employee_id,last_name from employee where salary < (select avg(salary) from employee);
end &&
delimiter ;
call fetch_avgerage_salary(2,@abc);


-- 2. Write a procedure to fetch salary of the employee id passed as input

use inventory;
/*Procedure to get employee salary based on employee id*/
delimiter && 
create procedure employee_salary(in empid int, out o_salary int) 
begin
select salary from employee where employee_id=empid;
end &&
delimiter ;

call employee_salary(2,@abc);


-- 3. Write a function to fetch 50% of salary

drop function get_50pctsalary;
delimiter && 
create function get_50pctsalary(empid decimal)
returns decimal no sql -- reads sql data
begin
return (select   salary*.5 from employee where employee_id=empid);
end &&
delimiter ;

select get_50pctsalary(1);

-- 4. Write a function to add a string to the passed name

drop function add_string_to_name;
create function add_string_to_name(a varchar(100))
returns varchar(100) no sql -- reads sql data
return concat("My name is ",a) ;

select add_string_to_name('shireen');

--  5 Write a function to fetch the next maximum salary to the input number passed

select * from employee where salary >1230000 order by salary  limit 1;
select * from employee where salary >1230000   order by salary  ;
select * from employee  order by salary  ;


drop function next_max_salary;
delimiter && 
create function next_max_salary(in_salary int)
returns decimal no sql -- reads sql data
begin
return (select salary from employee where salary >in_salary order by salary  limit 1);
end &&
delimiter ;

select next_max_salary('4000000');