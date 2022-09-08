-- Assignment9

select * from employee;
-- 1.Get employees who have the highest salary

select *  from employee order by salary desc limit 3;

select * from employee where salary in (select max(salary) from employee);


-- 2. Get employees who have the 2nd highest salary

select * from employee order by salary desc limit 1,1;

select first_name , max(salary) from employee where salary <> (select max(salary) from employee);

-- 3. Get employees who have the nth highest salary;
-- replace N with the number
select distinct (salary),last_name from employee order by salary desc limit 0, 1;

select distinct (salary),last_name from employee order by salary desc limit 3, 1;
/*n=1
n=2
n=3
n=4
.......*/

Select * from Employee e1 where 2-1 = (Select COUNT(distinct salary)from Employee e2 where e2.salary > e1.salary) ;

-- 5. Categorize employees into three groups based on their salaries
-- (less than 30M-low,30M to 60M-medium, greater than        

   select
case when salary  >= 0 and salary < 3000000    then 'LOW'
when salary >= 3000000 and salary < 6000000 then 'MEDIUM'
when salary >= 6000000   then 'HIGH'
else 'Not Applicable'
      end salary,count(*) as countofemployees from employee group  by 1;