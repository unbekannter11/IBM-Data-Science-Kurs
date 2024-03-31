-- Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table.

-- Way 1: Using Implicit Joins
SELECT * 
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

-- Way 2: Using sub-queries                
SELECT * 
FROM EMPLOYEES 
WHERE JOB_ID IN (SELECT JOB_IDENT 
                 FROM JOBS);
                 
-- Retrieve JOB information for employees earning over $70,000.

-- Way 1: Using Implicit Joins
SELECT J.JOB_TITLE, J.MIN_SALARY, J.MIN_SALARY, J.JOB_IDENT
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT AND E.SALARY > 70000;


-- Way 2: Using sub-queries    
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT 
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
                    FROM EMPLOYEES
                   WHERE SALARY > 70000);
                   

-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.

-- Way 1: Using Implicit Joins

SELECT E.F_NAME, E.L_NAME, E.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT AND J.JOB_TITLE = 'Jr. Designer';


-- Way 2: Using sub-queries

SELECT F_NAME, L_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_IDENT
                 FROM JOBS
                 WHERE JOB_TITLE = 'Jr. Designer' 
                );


-- Retrieve JOB information and a list of employees whose birth year is after 1976.

-- Way 1: Using Implicit Joins

SELECT *
FROM JOBS J, EMPLOYEES E
WHERE E.JOB_ID = J.JOB_IDENT AND YEAR(E.B_DATE)>1976;


-- Way 2: Using sub-queries    

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
                    FROM EMPLOYEES
                    WHERE YEAR(B_DATE)>1976 );
                   

