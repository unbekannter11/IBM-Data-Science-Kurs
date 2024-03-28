/****** Script for SelectTopNRows command from SSMS  ******/


/*

FilmLocations(
Title:              titles of the films, 
ReleaseYear:        time of public release of the films, 
Locations:          locations of San Francisco where the films were shot, 
FunFacts:           funny facts about the filming locations, 
ProductionCompany:  companies who produced the films, 
Distributor:        companies who distributed the films, 
Director:           people who directed the films, 
Writer:             people who wrote the films, 
Actor1:             person 1 who acted in the films, 
Actor2:             person 2 who acted in the films,
Actor3:             person 3 who acted in the films
)

ALTER TABLE film_locations
ALTER COLUMN Title VARCHAR(MAX)

ALTER TABLE film_locations
ALTER COLUMN Release_Year VARCHAR(MAX)

ALTER TABLE film_locations
ALTER COLUMN Locations VARCHAR(MAX)

-- FunFact

-- ProductionCompany

ALTER TABLE film_locations
ALTER COLUMN Distributor VARCHAR(MAX)

ALTER TABLE film_locations
ALTER COLUMN Director VARCHAR(MAX)

ALTER TABLE film_locations
ALTER COLUMN Writer VARCHAR(MAX)

ALTER TABLE film_locations
ALTER COLUMN Actor_1 VARCHAR(MAX)

ALTER TABLE film_locations
ALTER COLUMN Actor_2 VARCHAR(MAX)

ALTER TABLE film_locations
ALTER COLUMN Actor_3 VARCHAR(MAX)


*/

-- Suppose we want to count the number of records or rows of the "FilmLocations" table. The query for this would be:
SELECT * From film_locations;

-- We want to retrieve the film names and director and writer names. The query now would be:
SELECT Title, Director, Writer
FROM film_locations

--We want to retrieve film names along with filming locations and release years. But we also want to restrict the output resultset to retrieve only the film records released in 2001 and onwards (release years after 2001, including 2001).
SELECT Title, Release_Year, Locations 
FROM film_locations 
WHERE Release_Year>=2001

--Retrieve the fun facts and filming locations of all films.
SELECT Locations, Fun_Facts
FROM film_locations

-- Retrieve the fun facts and filming locations of all films.

SELECT Fun_Facts, Locations
FROM film_locations

-- Retrieve the names of all films released in the 20th century and before (release years before 2000 including 2000), along with filming locations and release years.
SELECT Title, Locations, Release_Year
FROM film_locations
WHERE Release_Year <= 2000

-- Retrieve the names, production company names, filming locations, and release years of the films not written by James Cameron.

SELECT Title, Production_Company, Locations, Release_Year
FROM film_locations
WHERE Writer != 'James Cameron'


------------ Count, Distinct, Limit

-- Suppose we want to count the number of records or rows of the "FilmLocations" table. The query for this would be:
SELECT COUNT(*) 
FROM film_locations

-- We want to count the number of locations of the films. But we also want to restrict the output result set so that we only retrieve the number of locations of the films written by a certain writer. The query for this can be written as:
SELECT COUNT(Locations)
FROM film_locations
WHERE Writer = 'James Cameron'

-- Assume that we want to retrieve the titles of all films in the table so that duplicates will be discarded in the output result set.
SELECT DISTINCT Title
FROM film_locations

--We want to retrieve the count of release years of the films produced by a specific company so that duplicate release years of those films will be discarded in the count.

SELECT COUNT(DISTINCT Release_Year) 
FROM film_locations
WHERE Production_Company = "Warner Bros. Pictures";


select* from film_locations

SELECT COUNT(DISTINCT Release_Year) FROM film_locations 
WHERE Production_Company='Warner Bros. Pictures';

-- Retrieve only the first 25 rows from the table so that rows other than those are not in the output result set.
SELECT TOP 25 *
FROM film_locations

-- Now, we want to retrieve 15 rows from the table starting from row 11.

SELECT *
FROM film_locations
ORDER BY Title
OFFSET 10 ROWS
FETCH NEXT 15 ROWS ONLY;

-- Retrieve the number of locations of the films which are directed by Woody Allen.

SELECT COUNT(*)
FROM film_locations
WHERE Director = 'Woody Allen'

-- Retrieve the number of films shot at Russian Hill.

SELECT COUNT(Title)
FROM film_locations
WHERE Locations = 'Russian Hall'

-- Retrieve the number of rows having a release year older than 1950 from the "FilmLocations" table.

SELECT COUNT(*)
FROM film_locations
WHERE Release_Year < 1950

-- Retrieve the names of all unique films released in the 21st century and onwards, along with their release years.

SELECT DISTINCT Title, Release_Year
FROM film_locations
WHERE Release_Year >1999

-- Retrieve the directors' names and their distinct films shot at City Hall.

SELECT DISTINCT Title, Director
FROM film_locations
WHERE Locations = 'City Hall'

-- Retrieve the number of distributors who distributed films with the 1st actor, Clint Eastwood.

SELECT COUNT(*)
FROM film_locations
WHERE Actor_1 = 'Clint Eastwood'


SELECT COUNT(DISTINCT Distributor) 
FROM film_locations 
WHERE Actor_1 = 'Clint Eastwood';


-- Retrieve the names of the first 50 films.

SELECT TOP 50 Title
FROM film_locations

SELECT DISTINCT TOP 50 Title
FROM film_locations

-- Retrieve the first 10 film names released in 2015.

SELECT DISTINCT TOP  10  Title
FROM film_locations
WHERE Release_Year = 2015
ORDER BY Title;


SELECT DISTINCT Title
FROM film_locations
WHERE Release_Year = 2015
ORDER BY Title 
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;


-- Retrieve the next 3 film names that follow after the first 5 films released in 2015.

SELECT DISTINCT Title
FROM film_locations
WHERE Release_Year = 2015 
ORDER BY Title
OFFSET 5 ROWS
FETCH NEXT 3 ROWS ONLY;



















