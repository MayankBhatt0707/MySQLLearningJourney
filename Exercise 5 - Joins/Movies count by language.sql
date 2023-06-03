select l.name, count(m.title) as `moviecount`
from languages l left join movies m
on l.language_id = m.language_id
group by l.name
order by `moviecount` desc


