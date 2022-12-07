-- Your Code Here
select
  name,
  author,
  sum(copies_sold) as copies_sold
from books
group by name, author
order by sum(copies_sold) desc
limit 5