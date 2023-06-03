select release_year, title from movies
where release_year in
((select max(release_year) from movies), (select min(release_year) from movies))
order by release_year