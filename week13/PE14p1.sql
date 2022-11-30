-- Ryan Cheevers-Brown
-- ISTE230, Prof. Perez-Hardy
-- 2022-11-30

-- Q1:
-- Show model, manufacturer, serial number, processor speed, and memory for computer id 3

SELECT model, manufacturer, serialNumber, processorSpeed, memory FROM COMPUTER WHERE itemID = 3;

-- Q2:
-- Show leaseNumber, salesperson, itemID, quantity for all trucks leased

SELECT LEASEITEM.leaseNumber, LEASE.salesperson, itemID, quantity FROM LEASEITEM, LEASE WHERE itemID IN (SELECT itemID FROM ITEM WHERE type = 'truck');

-- Q3:
-- Query to display all attributes (even nulls) for itemid 7

SELECT * FROM ITEM JOIN TRUCK ON ITEM.itemID = TRUCK.itemID WHERE ITEM.itemID = 7;
-- This doesn't fully work...I can't figure out how to improve it. 

