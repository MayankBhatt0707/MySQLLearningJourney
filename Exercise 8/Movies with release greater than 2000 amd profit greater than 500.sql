with x as(
select movie_id from movies m join financials f
using (movie_id)
where f.revenue > 500
)
select *, f.revenue from movies m join financials f using (movie_id)
join x using(movie_id)
where
release_year > "2000" and movie_id >= x.movie_id  