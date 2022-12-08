select
  data ->> 'first_name' as first_name,
  data ->> 'last_name' as last_name,
  extract(year from age(current_date, to_date(data ->> 'date_of_birth', 'yyyy-mm-dd'))) as age,
  case 
    when data->>'private' = 'true' then 'Hidden'
    else coalesce(data #>> '{email_addresses, 0}', 'None')
  end as email_address
from users
order by first_name, last_name

