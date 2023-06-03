select release_year, count(*) from moviesdb.movies
group by release_year
order by release_year desc
