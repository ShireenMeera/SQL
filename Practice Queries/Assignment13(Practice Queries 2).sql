-- Practice Queries 2
-- 1. Find the highest salary of each departement

select*from employee;

select Departement,max(salary) from employee group by salary ;

-- 2. Find the highest salary of each year on joining_date

select *, max(salary) from employee group by Joining_date;

use inventory;
-- 3. Find the highest salary of each quarter on joining_date

select quarter(joining_date) from employee;
 
 select CASE 
WHEN month(joining_date)/3 < 1 THEN  'QUARTER - 1' 
WHEN month(joining_date)/3 > 1  THEN 'QUARTER - 2' 
END AS 'QUART' from employee;

-- 4. Find the highest salary of each week of the year on joining_date

select * from employee;

select  max(salary),week(joining_date)  from employee group by week(joining_date);

-- 5. Find the highest salary on the even days of joining_date

select max(salary) from employee where day(joining_date)%2 = 0;

-- 6. Find the highest salary on the odd days of joining_date

select max(salary) from employee where day(joining_date)%1 =0;

-- 7. Find the highest salary of even months on joining_date

select max(salary) from employee where month(Joining_date) %2=0;

-- 8. Find the highest salary of odd weeks of the year on joining_date

select max(salary) from employee where week(joining_date)%1=0;

-- 9. Find week of the month for each joining_date

select CEIL((day(joining_date) -1 )/7),ROUND((day(joining_date) -1 )/7),(day(joining_date) -1 )/7,joining_date as week_of_month from employee;

select Week_of_month(joining_date) from employee;
-- 10. Find the highest salary for each week of the month on joining_date
SELECT 
max(salary) AS max_salary,
CASE 
WHEN day(joining_date) < 8 THEN 'Week 1'
WHEN day(joining_date) < 15 THEN 'Week 2'
WHEN day(joining_date) < 22 THEN 'Week 3'
ELSE 'Week 4'
END AS week_of_month,
month(joining_date)
FROM
employee
GROUP BY  week_of_month, month(joining_date);




select CASE 
WHEN month(joining_date)/3 < 1 THEN  'QUARTER - 1' 
WHEN month(joining_date)/3 > 1  THEN 'QUARTER - 2' 
END AS 'QUART' from employee;

