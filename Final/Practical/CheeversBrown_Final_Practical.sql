-- Ryan Cheevers-Brown
-- ISTE-230 Final Practical
-- 12/7/2022, 10:17 EST


-- tee "D:\\Profiles\\rfc6058\\CheeversBrown_Final_Practical.txt";

USE jobsv2;

-- Q1: subquery for EMPLOYER[statecode] - QUARTER[location]

SELECT DISTINCT statecode AS "State Code"
FROM EMPLOYER
WHERE statecode NOT IN 
    (SELECT location
    FROM QUARTER);

-- Q2: List employers where name[2,3] == "an" or "oc"

SELECT EMPLOYER.companyName AS "Company Name", interviewDate AS "Interview Date"
FROM EMPLOYER LEFT JOIN INTERVIEW ON EMPLOYER.companyName = INTERVIEW.companyName
WHERE SUBSTRING(EMPLOYER.companyName, 2, 2)
IN ("an", "oc");

-- Q3: 

SELECT EMPLOYER.companyName AS "Company Name", AVG(INTERVIEW.salaryOffered) AS "Average Salary", MAX(INTERVIEW.salaryOffered) AS "Max Salary" 
FROM EMPLOYER, INTERVIEW
WHERE INTERVIEW.companyName = EMPLOYER.companyName
GROUP BY EMPLOYER.companyName;

-- Q4: New TRAVEL table
DROP TABLE TRAVEL;

CREATE TABLE TRAVEL (
    travelID INT UNSIGNED AUTO_INCREMENT,
    interviewID INT UNSIGNED,
    departDate DATE NOT NULL,
    departLoc CHAR(3) NOT NULL,
    destinationDate DATE NOT NULL,
    destinationLoc CHAR(3) NOT NULL,
    bookedThrough VARCHAR(50),
    paid BOOLEAN NOT NULL,
    FOREIGN KEY (interviewID) REFERENCES INTERVIEW(interviewID) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (travelID)
);

DESCRIBE TRAVEL;


