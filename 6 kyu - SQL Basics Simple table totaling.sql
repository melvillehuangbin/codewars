-- https://www.codewars.com/kata/5809575e166583acfa000083/train/sql

-- Create your SELECT statement here
-- rank each clan by total_points
-- return each unique clan
-- no clan name, replace with no clan specified
-- sum total_points, total_people

with cte as (
  select
    clan,
    count(name) as total_people,
    sum(points) as total_points
  from people
  group by clan
)

select distinct
  dense_rank() over (order by total_points desc) as rank,
  case when clan = '' then '[no clan specified]' else clan end as clan,
--   coalesce(clan, 'no clan specified') as clan,
  total_people,
  total_points
from cte
order by rank asc