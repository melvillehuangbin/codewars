-- Replace with your query (in pure SQL)
-- https://www.codewars.com/kata/580d08b5c049aef8f900007c/train/sql

select
  c.customer_id,
  c.email,
  count(p.payment_id)::int as payments_count,
  sum(p.amount)::float as total_amount
from 
  customer c
  left join payment p on c.customer_id = p.customer_id
group by 1,2
order by total_amount desc
limit 10