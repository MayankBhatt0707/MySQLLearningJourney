select m.title as `movie name`,
case
when unit = "Billions" then f.revenue*1000
when unit = "Thousand" then round(f.revenue/1000,2)
else f.revenue 
end as `revenue in million` ,
currency, unit
from movies m join financials f
on m.movie_id=f.movie_id join languages l
on m.language_id = l.language_id
where l.language_id = 1
order by `revenue in million` desc