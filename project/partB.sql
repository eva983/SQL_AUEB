/* Αριθμός ταινιών ανά χρόνο*/

 SELECT extract (year from movies_metadata.release_date) AS Year, COUNT(imdb_id)
 FROM project.movies_metadata
 GROUP BY Year;
 


/*Αριθμός ταινιών ανά είδος(genre)*/
SELECT genre, COUNT(genre) 
FROM project.movies_metadata
NATURAL JOIN  project.movie_genre
NATURAL JOIN  project.genres
GROUP BY genre;


