TEE CheeversBrown_HW7.txt;

DROP DATABASE CheeversBrown_ACMEOnline;

CREATE DATABASE CheeversBrown_ACMEOnline;

USE CheeversBrown_ACMEOnline;

CREATE TABLE CATEGORY (
    categoryName VARCHAR(35) NOT NULL,
    shippingPerPound DECIMAL(4,2) NOT NULL,
    offersAllowed BOOLEAN NOT NULL,
    PRIMARY KEY (categoryName)
);

CREATE TABLE ITEM (
    itemNumber INT UNSIGNED NOT NULL AUTO_INCREMENT,
    itemName VARCHAR(35) NOT NULL,
    itemDescription VARCHAR(255),
    modelNumber VARCHAR(50) NOT NULL,
    itemPrice DECIMAL(7,2) NOT NULL,
    categoryName VARCHAR(35) NOT NULL,
    PRIMARY KEY (itemNumber),
    FOREIGN KEY (categoryName) REFERENCES CATEGORY(categoryName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE OFFER (
    offerCode VARCHAR(15) NOT NULL,
    discountAmt VARCHAR(35) NOT NULL,
    minAmount DECIMAL(4,2) NOT NULL,
    expirationDate DATE NOT NULL,
    PRIMARY KEY (offerCode)
);

CREATE TABLE CUSTOMER (
    customerNumber INT UNSIGNED NOT NULL AUTO_INCREMENT,
    custName VARCHAR(50) NOT NULL,
    custAddress VARCHAR(150) NOT NULL,
    email VARCHAR(80) NOT NULL,
    businessOrHomeAddress ENUM('business', 'home') NOT NULL,
    PRIMARY KEY (customerNumber)
);

CREATE TABLE BUSINESS (
    customerID INT UNSIGNED NOT NULL,
    paymentTerms VARCHAR(50) NOT NULL,
    PRIMARY KEY (customerID),
    FOREIGN KEY (customerID) REFERENCES CUSTOMER(customerNumber) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PURCHASE_CONTACT (
    customerID INT UNSIGNED NOT NULL,
    contactName VARCHAR(50) NOT NULL,
    contactPhone CHAR(12) NOT NULL,
    PRIMARY KEY (customerID, contactName),
    FOREIGN KEY (customerID) REFERENCES BUSINESS(customerID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE HOME (
    customerID INT UNSIGNED NOT NULL,
    creditCardNum CHAR(26) NOT NULL,
    cardExpiration CHAR(6) NOT NULL,
    PRIMARY KEY (customerID),
    FOREIGN KEY (customerID) REFERENCES CUSTOMER(customerNumber) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ORDERED (
    orderNumber INT UNSIGNED NOT NULL AUTO_INCREMENT,
    totalCost DECIMAL(10,2) NOT NULL,
    offerCode VARCHAR(15) NOT NULL,
    customerID INT UNSIGNED NOT NULL,
    PRIMARY KEY (orderNumber),
    FOREIGN KEY (offerCode) REFERENCES OFFER(offerCode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (customerID) REFERENCES CUSTOMER(customerNumber) ON UPDATE CASCADE ON DELETE CASCADE
);

-- this one has an issue
CREATE TABLE LINE_ITEM (
    orderNumber INT UNSIGNED NOT NULL,
    itemNumber INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    shippingAmount DECIMAL(6,2),
    PRIMARY KEY (orderNumber, itemNumber),
    FOREIGN KEY (orderNumber) REFERENCES ORDERED(orderNumber) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (itemNumber) REFERENCES ITEM(itemNumber) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE GUARANTEE (
    orderID INT UNSIGNED NOT NULL,
    customerID INT UNSIGNED NOT NULL,
    refundAmount DECIMAL(12,2),
    url VARCHAR(50),
    PRIMARY KEY (orderID, customerID),
    FOREIGN KEY (orderID) REFERENCES ORDERED(orderNumber) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (customerID) REFERENCES CUSTOMER(customerNumber) ON UPDATE CASCADE ON DELETE CASCADE
);

SELECT 'Starting Insert into Category';

INSERT INTO CATEGORY VALUES ('Books', '0.99', '1');
INSERT INTO CATEGORY VALUES ('Home', '1.99', '1');
INSERT INTO CATEGORY VALUES ('Jewelry', '0.99', '0');
INSERT INTO CATEGORY VALUES ('Toys', '0.99', '1');

SELECT 'Starting Insert into Item';
INSERT INTO ITEM (itemName, itemDescription, modelNumber, itemPrice, categoryName) VALUES ('Cabbage Patch Doll', 'Baby boy doll', 'Boy', '39.95', 'Toys');
INSERT INTO ITEM (itemName, itemDescription, modelNumber, itemPrice, categoryName) VALUES ('The Last Lecture', 'Written by Randy Pausch', 'Hardcover', '9.95', 'Books');
INSERT INTO ITEM (itemName, itemDescription, modelNumber, itemPrice, categoryName) VALUES ('Keurig Beverage Maker', 'Keurig Platinum Edition Beverage Maker in Red', 'Platinum Edition', '299.95', 'Home');
INSERT INTO ITEM (itemName, itemDescription, modelNumber, itemPrice, categoryName) VALUES ('1ct Diamond Ring in White Gold', 'Diamond is certified vvs, D, round', '64gt32', '4000.00', 'Jewelry');

SELECT 'Starting insert into offer';
INSERT INTO OFFER (offerCode, discountAmt, minAmount, expirationDate) VALUES ('345743213', '20% off', '20.00', '2013-12-31');
INSERT INTO OFFER (offerCode, discountAmt, minAmount, expirationDate) VALUES ('4567890123', '30% off', '30.00', '2013-12-31');

SELECT 'Starting Transaction 1';
START TRANSACTION;
-- Starts the transaction; this guarantees that all the following statements will be executed as a single transaction (all or none).

INSERT INTO CUSTOMER (custName, custAddress, email, businessOrHomeAddress) VALUES ('Janine Jeffers', '152 Lomb Memorial Drive, Rochester, NY 14623', 'jxj1234@rit.edu', 'home');
INSERT INTO HOME (customerID, creditCardNum, cardExpiration) VALUES (LAST_INSERT_ID(), '1234567890123456', '012014');
INSERT INTO ORDERED (totalCost, offerCode, customerID) VALUES ('4919.75', '4567890123', LAST_INSERT_ID());
INSERT INTO LINE_ITEM (orderNumber, itemNumber, quantity, shippingAmount) VALUES ('1', '4', '1', '.99');
INSERT INTO LINE_ITEM (orderNumber, itemNumber, quantity, shippingAmount) VALUES ('1', '2', '2', '3.99');
INSERT INTO LINE_ITEM (orderNumber, itemNumber, quantity) VALUES ('1', '3', '3');

COMMIT;
-- Commits the transaction; this guarantees that all the statements in the transaction will be executed as a single transaction (all or none).
-- If any of the statements in the transaction fail, the transaction will be rolled back.

SELECT 'Starting Transaction 2';
START TRANSACTION;

INSERT INTO CUSTOMER (custName, custAddress, email, businessOrHomeAddress) VALUES ('Joey John Barber Shop', '15 John St., Rochester, NY 14623', 'jj1978@hotmail.com', 'business');
INSERT INTO BUSINESS (customerID, paymentTerms) VALUES (LAST_INSERT_ID(), '30/90 days');
INSERT INTO PURCHASE_CONTACT (customerID, contactName, contactPhone) VALUES (LAST_INSERT_ID(), 'Joey James', '585-475-1234');
INSERT INTO ORDERED (totalCost, offerCode, customerID) VALUES ('299.95', '345743213', LAST_INSERT_ID());
INSERT INTO LINE_ITEM (orderNumber, itemNumber, quantity) VALUES ('2', '3', '1');

COMMIT;

NOTEE;