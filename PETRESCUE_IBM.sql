
drop table if exists PETRESCUE;

create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;







-- Write a query that calculates the total cost of all animal rescues in the PETRESCUE table.
SELECT
    SUM(COST)
FROM
    PETRESCUE;
    -- Write a query that displays the maximum quantity of animals rescued (of any kind).
SELECT
    MAX(QUANTITY)
FROM
    PETRESCUE;
    -- Write a query that displays the average cost of animals rescued.
SELECT
    AVG(COST)
FROM
    PETRESCUE;
    -- Write a query that displays the rounded integral cost of each rescue.
SELECT
    ROUND(COST)
FROM
    PETRESCUE;
SELECT
    ROUND(COST, 2)
FROM
    PETRESCUE;
    -- Write a query that displays the length of each animal name.
SELECT
    LENGTH(ANIMAL)
FROM
    PETRESCUE;
    -- Write a query that displays the animal name in each rescue in uppercase.
SELECT
    UCASE(ANIMAL)
FROM
    PETRESCUE;
    -- Write a query that displays the day of the month when cats have been rescued.
SELECT
    DAY(RESCUEDATE)
FROM
    PETRESCUE
WHERE
    ANIMAL = 'CAT';
    -- Animals rescued should see the vet within three days of arrival. Write a query that displays the third day of each rescue.
SELECT
    RESCUEDATE,
    DATE_ADD(RESCUEDATE, INTERVAL 3 DAY)
FROM
    PETRESCUE;
    -- If the question was to add 2 months to the date, the query would change to:
SELECT
    MONTH(RESCUEDATE),
    MONTH(
        DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH)
    )
FROM
    PETRESCUE;
    -- Similarly, we can retrieve a date before the one given in the column by a given number using the function DATE_SUB. By modifying the same example, the following query would provide the date 3 days before the rescue.
SELECT
    DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) AS BEFORE_RESCUEDATE,
    RESCUEDATE
FROM
    PETRESCUE;
    -- Write a query that displays the length of time the animals have been rescued, for example, the difference between the current date and the rescue date.
SELECT
    DATEDIFF(CURRENT_DATE, RESCUEDATE) AS LENGTH_RESCUEDATE
FROM
    PETRESCUE;
    -- CURRENT_DATE is also an inbuilt function that returns the present date as known to the server.
    -- To present the output in a YYYY-MM-DD format, another function FROM_DAYS(number_of_days)can be used. This function takes a number of days and returns the required formatted output. The query above would thus be modified to
SELECT
    FROM_DAYS(
        DATEDIFF(CURRENT_DATE, RESCUEDATE)
    )
FROM
    PETRESCUE;
    -- Write a query that displays the average cost of rescuing a single dog. Note that the cost per dog would not be the same in different instances.
SELECT
    ID,
    AVG(COST / QUANTITY)
FROM
    PETRESCUE
WHERE
    ANIMAL = 'DOG'
GROUP BY
    ID;
    -- Write a query that displays the animal name in each rescue in uppercase without duplications.
SELECT DISTINCT
    UCASE(ANIMAL)
FROM
    PETRESCUE;
    -- Write a query that displays all the columns from the PETRESCUE table where the animal(s) rescued are cats. Use cat in lowercase in the query.
SELECT
    *
FROM
    PETRESCUE
WHERE
    LCASE(ANIMAL) = 'cat';
    -- a long way 
SELECT
    *
FROM
    PETRESCUE
WHERE
    ANIMAL IN(
    SELECT
        LCASE(ANIMAL)
    FROM
        PETRESCUE
    WHERE
        ANIMAL = 'CAT'
);
-- Write a query that displays the number of rescues in the 5th month.
SELECT
    SUM(QUANTITY)
FROM
    PETRESCUE
WHERE
    MONTH(RESCUEDATE) = 5;
    -- The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. Write a query that displays the ID and the target date.
SELECT
    ID,
    RESCUEDATE,
    DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) AS TARGETDDATE
FROM
    PETRESCUE;