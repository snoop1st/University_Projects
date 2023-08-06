
-- Arithmos tainiwn ana etos

SELECT substring (CAST(release_date AS VARCHAR(255)),1,4) AS year,
				COUNT (*) AS movieyear
				FROM movie
				WHERE release_date IS NOT NULL
				GROUP BY substring (CAST (release_date AS VARCHAR(255)),1, 4)
				ORDER BY YEAR
				
				
-- Arithmos tainiwn ana eidos 

SELECT COUNT(movie_genres.movie_id) as movies, genre.name as genres
				FROM movie_genres
				INNER JOIN genre
				ON genre.id = movie_genres.genre_id 
				GROUP BY name
				
--Arithmos tainiwn ana eidos kai ana etos

SELECT genre.name as genres, substring (CAST(release_date AS VARCHAR(255)),1,4) AS year,
				COUNT (*) AS movieyear
				FROM movie_genres
				INNER JOIN movie
				ON movie.id = movie_genres.movie_id
				INNER JOIN genre
				ON genre.id = movie_genres.genre_id 
				WHERE release_date IS NOT NULL
				GROUP BY name, substring (CAST (release_date AS VARCHAR(255)),1, 4)
				ORDER BY year
				
--To ypshlotero badget tainias ana etos

SELECT substring (CAST(release_date AS VARCHAR(255)),1,4) AS year, MAX(budget)
				FROM movie
				WHERE release_date IS NOT NULL
				GROUP BY year
				ORDER BY year
				
--Brad pitt revenue ana etos

SELECT substring (CAST(release_date AS VARCHAR(255)),1,4) AS year, SUM(revenue)
				FROM movie
				INNER JOIN movie_cast ON
				movie_cast.movie_id = movie.id
				INNER JOIN person ON 
				person.id = movie_cast.person_id
				WHERE name = 'Brad Pitt'
				GROUP BY year
				
-- Mesh bathmologia ana xrhsth

SELECT AVG(rating), user_id
				FROM ratings
				GROUP BY user_id

-- Arithmos apo bathmologies ana xrhsth

SELECT COUNT(rating), user_id
				FROM ratings
				GROUP BY user_id	

-- Mesh bathmologia ana eidos

SELECT genre.name as genres, AVG(rating)
				FROM movie_genres
				INNER JOIN ratings ON
				ratings.movie_id = movie_genres.movie_id
				INNER JOIN genre
				ON genre.id = movie_genres.genre_id 
				GROUP BY genre.name				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				