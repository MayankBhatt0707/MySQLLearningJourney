select * from movies
where imdb_rating >
(select avg(imdb_rating) from movies)
order by imdb_rating