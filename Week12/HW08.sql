-- Ryan Cheevers-Brown, ISTE230 HW08

USE jobs;

-- Q1:
-- Show Employer[stateCode] + Quarter[location]

SELECT stateCode FROM EMPLOYER;




-- Q2:
-- Relational algebra equijoin between employer and interview
-- Project companyName, division, stateCode, salaryOffered



-- Q3: 
-- SQL for STATE-EMPLOYER
-- output: Shows all state and territory codes and names



-- Q4:
-- INTERVIEW[companyName, minHrsOffered]

SELECT companyName, minHrsOffered FROM INTERVIEW;

-- Q5:
-- State table where description[2] = a, e, i, o, u

SELECT * FROM STATE WHERE description[2] IN ('a', 'e', 'i', 'o', 'u');

-- Q6:
-- QuarterCode, Location, Description for locations in quarter AND state

SELECT qtrCode, location, description FROM QUARTER, STATE WHERE qtrCode = stateCode;

-- Q6:
-- Show description for all states and companyNames for all employers

SELECT companyName from EMPLOYER
WHERE stateCode IN (SELECT stateCode FROM STATE);

-- TODO: This sucks and is not correct