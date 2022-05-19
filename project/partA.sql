create table Keywords(
   id int,
   keywords text
);


create table Credits(
   casting text,
   crew text,
   id int
);

create table Links(
   movieId int,
   imdbId int,
   tmdbId int
);

create table Movies_Metadata(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue int,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);


create table Ratings_Small(
   userId int,
   movieId int,
   rating varchar(10),
   timestamp int
);

--remove duplicates

--table keywords
-- step 1
CREATE TABLE project.keywords_temp (LIKE project.keywords);

-- step 2
INSERT INTO project.keywords_temp(keywords, id)
SELECT 
    DISTINCT ON (keywords) keywords,
    id
FROM project.keywords; 

-- step 3
DROP TABLE project.keywords;

-- step 4
ALTER TABLE project.keywords_temp 
RENAME TO project.keywords; 


--table credits
-- step 1
CREATE TABLE project.credits_temp (LIKE project.credits);

-- step 2
INSERT INTO project.credits_temp(casting, crew,id)
SELECT 
    DISTINCT ON (casting) casting,(crew) crew,
    
    id
FROM project.credits; 

-- step 3
DROP TABLE project.credits;

-- step 4
ALTER TABLE project.credits_temp 
RENAME TO credits; 



--table links
-- step 1
CREATE TABLE project.links_temp (LIKE project.links);

-- step 2
INSERT INTO project.links_temp(movieId,imdbId,tmdbId)
SELECT 
    DISTINCT ON (movieId) movieId,(imdbId) imdbId,(tmdbId) tmdbId
    
FROM project.links; 

-- step 3
DROP TABLE project.links;

-- step 4
ALTER TABLE project.links_temp 
RENAME TO links; 


--table movies_metadata
DELETE FROM project.movies_metadata
WHERE id IN
    (SELECT id
    FROM 
        (SELECT id,
         ROW_NUMBER() OVER( PARTITION BY id
        ORDER BY  id ) AS row_num
        FROM project.movies_metadata ) t
        WHERE t.row_num > 1 );
		
		
alter table project.credits add primary key(id);
alter table project.keywords add primary key(id);
alter table project.links add primary key(imdbid);
alter table project.movies_metadata add primary key(id);

alter table project.links add foreign key(movieId) REFERENCES project.movies_metadata(id);



 
create table project.genres (
genre varchar(270) ,
id int);
insert into project.genres(genre)
select genres
from project.movies_metadata;

create table project.movie_genre(
movie_id int,
genre_id int
);
insert into project.movie_genre(movie_id)
select id
from project.movies_metadata;
