-- Retrieve all employees whose adrrees is in Elgin, IL.

SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

-- Retrieve all employees who were born during the 1970’s.

SELECT *
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.

SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 60000 AND 70000;

-- Retrieve a list of employees ordered by department ID.

SELECT DEP_ID, F_NAME, L_NAME
FROM EMPLOYEES 
ORDER BY DEP_ID;

-- Retrieve a list of employees ordered in descending order by department ID and 
-- within each department ordered alphabetically in descending order by last name.

SELECT DEP_ID, F_NAME, L_NAME
FROM EMPLOYEES 
ORDER BY DEP_ID, L_NAME DESC;

-- In SQL problem above, use department name instead of department ID. 
-- Retrieve a list of employees ordered by department name, and within each department 
-- ordered alphabetically in descending order by last name.


SELECT D.DEP_NAME, E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP 
ORDER BY D.DEP_NAME, E.L_NAME DESC;


-- For each department ID retrieve the number of employees in the department.

SELECT DEP_ID, COUNT(*) AS NUMBER_EMPLOYEES
FROM EMPLOYEES 
GROUP BY DEP_ID;

SELECT *
FROM EMPLOYEES;

-- For each department retrieve the number of employees in the department, 
-- and the average employee salary in the department..

SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVg_SALARY
FROM EMPLOYEES 
GROUP BY DEP_ID;


-- In above SQL problem order the result set by Average Salary..

SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES 
GROUP BY DEP_ID
ORDER BY AVG(SALARY);

-- In above SQL problem, limit the result to departments with fewer than 4 employees.

SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES 
GROUP BY DEP_ID
HAVING COUNT(*) <4
ORDER BY AVG(SALARY);
