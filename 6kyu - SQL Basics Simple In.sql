-- Create your SELECT statement here
-- https://www.codewars.com/kata/58113c03009b4fcc66000d29/train/sql
select
  id,
  name
from departments
where id in (select department_id from sales where price > 98.00)