/* Your Query Here */

-- player_name
-- games
-- batting_average = hits/at_bats, text, round(3), highest average first
-- exclude sum(at_bats) >= 100
-- https://www.codewars.com/kata/5994dafcbddc2f116d000024/train/sql

select
  player_name,
  sum(games) as games,
  round(sum(hits)::numeric/sum(at_bats)::numeric, 3)::text as batting_average
from yankees
group by 1
having sum(at_bats) >= 100
order by batting_average desc