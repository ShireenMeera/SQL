-- Assignment7


-- 1. Get count of employees having last name same as first name of other

select count(*) from employee a, employee b where a.first_name = b.last_name;

-- 2. List employees having last name same as first name of other employee

select a.Last_name,b.First_name from employee a, employee b where a.last_name= b.first_name;



-- 3. List FName,LName,rewardamount of employees having last name same as first name of other
-- employees or vice-versa, with each of their reward amount.

select a.first_name,a.last_name ,r.amount from employee where a.last_name = b.first_name;

-- .4 Display the tours with source and destination as follows (use: places, tours tables)
-- Tour_id   start_city   end_city
--    1      hyderabad    chennai

create table places (
id int, 
place_name varchar(10));

create table tours (
id int, 
stloc int, 
endloc int);

insert into places values 
(1,'chennai'),
(2,'bengaluru'),
(3,'cochin'),
(4,'hyderabad'),
(5,'mysuru');

insert into tours values  
(1,	4,	1), 
(2,	4,	3), 
(3,	4,	2), 
(4,	1,	4), 
(5,	2,	3), 
(6,	2,	5), 
(7,	5,	3);

select * from places;
select * from tours;


-- 4. Display the tours with source and destination as follows (use: places, tours tables)
-- Tour_id   start_city   end_city
--    1      hyderabad    chetourstoursnnai

select * from places;
select * from tours;

select A.id,b.place_name,c.place_name from tours A 
left outer join places B on (a.stloc=b.id ) 
left outer join places C on (a.endloc=c.id );
/*1	hyderabad	chennai
2	hyderabad	cochin
3	hyderabad	bengaluru
4	chennai	hyderabad
5	bengaluru	cochin
6	bengaluru	mysuru
7	mysuru	cochin*/


-- another method
use inventory;
select A.id Tour_id, A.place_name start_city,B.place_name end_city from (
(select a.id,place_name from tours a, places b
where a.stloc=b.id ) A,
(select a.id,place_name from tours a, places b
where a.endloc=b.id ) B
) where A.id=B.id order by 1; 

use inventory;
drop table marts;

create table marts(
id numeric,
nam char(50));

insert into marts values (101,'MART');
insert into marts values(102,'supermarket');
insert into marts values(103,'supermarket');
insert into marts values(104,'supermarket');
insert into marts values(106,'MART');

select * from marts;
select * from marts A, marts B where A.nam=b.nam  order by a.id;
select * from marts A, marts B where A.nam=b.nam and a.id < b.id order by a.id;

select a.id , a.nam,b.id,b.nam from marts a, marts b
where a.nam=b.nam  and  a.id<b.id order by a.id;






