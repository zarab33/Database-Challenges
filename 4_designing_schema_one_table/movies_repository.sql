--To verify your work, make sure to run an INSERT query to insert a new movie record, and then a SELECT query to list the records.

movies_directory=# INSERT INTO movies (title, genre, release_year)
VALUES ('Whats Love got to do with it', 'Drama/Music', '1993');
INSERT 0 1
movies_directory=# SELECT * FROM movies
;
 id |            title             |    genre    | release_year 
----+------------------------------+-------------+--------------
  1 | Whats Love got to do with it | Drama/Music |         1993
(1 row)

movies_directory=# 