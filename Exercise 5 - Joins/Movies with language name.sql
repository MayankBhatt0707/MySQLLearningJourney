select title, name 
from
movies join	languages
using(language_id)