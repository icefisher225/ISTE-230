-- Ryan Cheevers-Brown, ISTE230 HW08

USE jobs;

-- Q1:
-- Show Employer[stateCode] + Quarter[location]

SELECT stateCode FROM EMPLOYER CROSS JOIN QUARTER;

-- Q2:
-- Relational algebra equijoin between employer and interview
-- Project companyName, division, stateCode, salaryOffered

SELECT employer.companyName, employer.division, employer.stateCode, interview.salaryOffered FROM EMPLOYER JOIN interview USING (companyName, division);

-- Q3: 
-- SQL for STATE-EMPLOYER
-- output: Shows all state and territory codes and names

SELECT stateCode, description from STATE WHERE stateCode NOT IN (SELECT stateCode FROM employer);

-- Q4:
-- INTERVIEW[companyName, minHrsOffered]

SELECT DISTINCT companyName, minHrsOffered FROM INTERVIEW;

-- Q5:
-- State table where description[2] = a, e, i, o, u

 SELECT stateCode, description FROM STATE WHERE description REGEXP '^.{2}[aeiou].*';

-- Q6:
-- QuarterCode, Location, Description for locations in quarter AND state

SELECT qtrCode, location, STATE.description FROM QUARTER, STATE WHERE QUARTER.location = STATE.stateCode;

-- Q7:
-- Show description for all states and companyNames for all employers

SELECT STATE.description, companyName from EMPLOYER JOIN STATE USING (stateCode);
