-- retrieve all employee records whose salary is lower than the average salary

SELECT * 
FROM EMPLOYEES
WHERE SALARY < AVG(SALARY);

-- However, this query will generate an error stating, "Illegal use of group function." 
-- Here, the group function is AVG and cannot be used directly in the condition since 
-- it has not been retrieved from the data. Therefore, the condition will use a 
-- sub-query to retrieve the average salary information to compare the existing salary.
-- The modified query would become:

SELECT * 
FROM EMPLOYEES 
WHERE SALARY < (SELECT AVG(SALARY) 
				FROM EMPLOYEES);
				
-- Now, consider executing a query that retrieves all employee records with EMP_ID, 
-- SALARY, and maximum salary as MAX_SALARY in every row. For this, the maximum salary 
-- must be queried and used as one of the columns. This can be done using the query 
-- below.

SELECT EMP_ID, SALARY, 
 		( 	SELECT MAX(SALARY) 
 			FROM EMPLOYEES
 		 ) 	AS MAX_SALARY
FROM EMPLOYEES;

-- Now, consider that you wish to extract the first and last names of the oldest 
-- employee. Since the oldest employee will be the one with the smallest date of 
-- birth, the query can be written as:

SELECT F_NAME, L_NAME 
FROM EMPLOYEES
WHERE B_DATE = (SELECT MIN(B_DATE) FROM EMPLOYEES);

 
-- You may also use sub-queries to create derived tables, which can then be used to 
-- query specific information. Say you want to know the average salary of the top 5 
-- earners in the company. You will first have to extract a table of the top five 
-- salaries as a table. From that table, you can query the average value of the salary. 
-- The query can be written as follows.

SELECT AVG(SALARY)
FROM (SELECT SALARY 
      FROM EMPLOYEES 
      ORDER BY SALARY DESC 
      LIMIT 5) AS SALARY_TABLE;

-- Write a query to find the average salary of the five least-earning employees.

SELECT AVG(SALARY)
FROM (SELECT SALARY 
	  FROM EMPLOYEES 
	  ORDER BY SALARY 
	  LIMIT 5) AS MIN_SALARY_AVG; 



-- Write a query to find the records of employees older than the average age of all 
-- employees.

SELECT * FROM EMPLOYEES;


SELECT EMPL_ID, YEARS_BETWEEN(CURRENT DATE, START_DATE),
    (SELECT AVG(YEARS_BETWEEN(CURRENT DATE, START_DATE)) 
     FROM JOB_HISTORY)
FROM JOB_HISTORY;









