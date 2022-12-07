SELECT 
  date(s.transaction_date) as day,
  d.name department,
  COUNT(s.id) sale_count
FROM sale s
LEFT JOIN department d on s.department_id = d.id 
group by date(s.transaction_date), d.name
order by date(s.transaction_date) asc