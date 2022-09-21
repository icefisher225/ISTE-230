-- Ryan Cheevers-Brown
-- ISTE 230, 9/20/2022

-- Q1:
SELECT headOfState FROM country WHERE code2="US";

-- Q2:
UPDATE country SET headOfState="Joseph R. Biden"  WHERE headOfState="Donald J. Trump" and code2="US";
SELECT headOfState FROM country WHERE code2="US";

-- Q3:
select name from country where indepYear is NULL;

-- Q4:
select name, continent from country where population>1000000000 and lifeExpectancy>70 and lifeExpectancy<80;

-- Q5:
select name from country where continent="North America" or continent="South America";

