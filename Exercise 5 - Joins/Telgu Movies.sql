select m.title, l.name 
from 
movies m join languages l
on m.language_id = l.language_id
where  l.name like "Telugu"