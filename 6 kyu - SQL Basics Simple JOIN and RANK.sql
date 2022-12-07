-- Create your SELECT statement here
-- 6 kyu - Simple Join and Rank
-- https://www.codewars.com/kata/58094559c47d323ebd000035/train/sql
with people_sales as (
  select
    p.id,
    p.name,
    count(s.id) as sale_count
  from
    people p
    left join sales s on p.id = s.people_id
  group by 1,2
)

select
  id,
  name,
  sale_count,
  dense_rank() over(order by sale_count) as sale_rank
from people_sales