-- Ryan Cheevers-Brown
-- ISTE230, 9/20/2022

-- Task 1: Add new data into contactInfo table

use conman;

INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, url, birthday, notes) VALUES (2, "Ryan", "F", "Cheevers-Brown", "rfc6058@rit.edu", "www.rfcb.contact", "2001-02-16", "Kind of a problem");
INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, url, birthday, notes) VALUES (3, "Eli", "T", "Wallowby", "etwallowby@concor.com", "www.concor.com/~wallowby", "1956-03-26", "All meetings must be scheduled through his assistant.");
INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, birthday, notes) VALUES (4, "Eve", "C", "Sampson", "esampson@concor.com", "1972-05-11", "Very Helpful.");
INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, birthday, notes) VALUES (5, "Carson", "B", "Campbell", "cbc232@mvch.org", "1955-01-05", "Wife: Lisa Kids: Lucas, Lucy, and Lucinda.");

SELECT * FROM contactInfo;

-- Task 2: Add an attribute to the contactInfo table
ALTER TABLE contactInfo ADD COLUMN nickname VARCHAR(20) DEFAULT "To Be Determined";
SELECT * FROM contactInfo;

-- Task 3: Add constraints to the contactInfo table
ALTER TABLE contactInfo 
    MODIFY COLUMN firstName VARCHAR(15) NOT NULL,
    MODIFY COLUMN lastName VARCHAR(25) NOT NULL;

SELECT * FROM contactInfo;

-- Task 4: Update an existing record
UPDATE contactInfo SET nickname="Dave" WHERE contactID=1;
SELECT * FROM contactInfo;

-- Task 5: Delete records
DELETE FROM contactInfo WHERE url="www.concor.com/~wallowby";
SELECT * FROM contactInfo;