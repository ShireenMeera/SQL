-- ASSIGNMENT11



-- 1. Create a table as same as employee table with true condition
-- (but no columns used)

create table employee_1 as select * from employee where 1=1; 

-- 2. Create a table as same as employee table with true condition
-- (but columns used)

create table employee_2 as select * from employee where employee_id=1;


-- 3. Create a table as same as employee table with false condition
-- (but columns used)

create table Employee_3 as select * from employee where employee_id=15;

-- 4. Create a table as same as employee table with false condition
-- (but no columns used)

create table Employee_4 as select * from employee where 1=2;


-- 5. Write a trigger to convert negative salary to 0 before any insertion into employee Table

delimiter &&
create trigger updated_salary
before insert on employee for each row
begin
if new.salary <0 then
	set new.salary = 0;
end if;
end &&
delimiter ;

-- 6. Write a trigger to insert an entry into new table after any insertion into employee table

create table new_employee as select * from employee where 1=2;
delimiter &&
create trigger new_employee
 after insert on employee for each row 
 begin 
  insert into new_employee values (new.employee_id,new.first_name,new.last_name,new.salary,new.joining_date,new.departement); 
end &&
delimiter ;
  
  
insert into employee values(12,'abc','xyz',123456,'2019-08-13','Science');


-- 7. Write a trigger to delete entry from new table after any deletion into employee table

delimiter &&
create trigger trg_delete
after delete on employee for each row
begin
	delete from new_employee where employee_id = old.employee_id;
end &&
delimiter ;


 delete from employee where employee_id=12;
