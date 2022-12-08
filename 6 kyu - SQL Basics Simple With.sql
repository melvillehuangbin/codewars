-- Create your SELECT statement here
--https://www.codewars.com/kata/5811501c2d35672d4f000146/train/sql
with special_sales as (
  select 
    s.department_id as id
  from sales s
  where s.price > 90.00
)

select * 
from departments
where id in (select id from special_sales)


