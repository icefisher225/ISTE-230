-- PE04 - Ryan Cheevers-Brown

-- Task #1
ALTER TABLE contactInfo MODIFY COLUMN firstName VARCHAR(15) NOT NULL DEFAULT "UNKNOWN";

ALTER TABLE contactInfo MODIFY COLUMN lastName CHAR(30) NOT NULL DEFAULT "UNKNOWN";

-- Task #2
INSERT INTO contactInfo (contactID) VALUES (2);

SELECT contactID, firstName, lastName FROM contactInfo;

-- Task #3
ALTER TABLE contactInfo ADD COLUMN owes DECIMAL(6,2);

-- Task #4
-- I would make an identifier based off the email. Emails have to be unique within the domain.
-- It's the only identifier that is required to be unique for domain functioning within the context of RIT and the fields presented in this database. 