-- Ryan Cheevers-Brown
-- HW 02 - ISTE230, Intro to DB

tee /tmp/CheeversBrown_HW02.txt;

DROP DATABASE IF EXISTS HW02;

CREATE DATABASE HW02;

USE HW02;

-- Table: Item
CREATE TABLE Item (
    itemID VARCHAR(25) UNIQUE,
    itemName VARCHAR(25),
    iName VARCHAR(25),
    street VARCHAR(25),
    city VARCHAR(25), 
    colors VARCHAR(25),
    usState CHAR(2),
    zipcode CHAR(5),
    cost INT,
    retailPrice INT,
    notes VARCHAR(255),
    descriptn VARCHAR(255), 
    returnable CHAR(1),
    perishable CHAR(1),
    shelfQty INT UNSIGNED,
    CONSTRAINT Item_pk PRIMARY KEY (itemID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESCRIBE Item;

notee;