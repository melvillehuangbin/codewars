-- reverse the string, split from 2nd last, reverse it back
-- https://www.codewars.com/kata/594323fde53209e94700012a/train/sql
-- 6 kyu- Subqueries master
with cte as (
  select
    string_to_array(name, ' ') as name_array,
    reverse(split_part(reverse(name), ' ', 1)) as second_lastname,
    reverse(split_part(reverse(name), ' ', 2)) as first_lastname
  from people
)

select
  array_to_string(name_array[1:array_length(name_array, 1) - 2], ' ') as name,
  first_lastname,
  second_lastname
from cte