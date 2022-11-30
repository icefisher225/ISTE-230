-- Ryan Cheevers-Brown
-- ISTE230, Prof. Perez-Hardy
-- 2022-11-30

-- Q4:
SELECT book.title, bookreview.rating, reviewer.name FROM book, bookreview, reviewer WHERE book.isbn IN (SELECT isbn FROM BOOKREVIEW WHERE rating >= 5 AND rating <= 7) AND bookreview.rating >= 5 AND bookreview.rating <= 7 AND reviewer.reviewerID = bookreview.reviewerid AND bookreview.isbn = book.isbn;

-- Q5:
SELECT OWNER.FirstName, OWNER.LastName, BOOK.title FROM BOOK, OWNERSBOOK LEFT JOIN OWNER ON OWNERSBOOK.ownerID = OWNER.ownerID WHERE BOOK.isbn IN (SELECT isbn FROM ownersbook) AND BOOK.isbn = OWNERSBOOK.isbn;

-- Q6:
select PUBLISHER.name, PUBLISHER.city, PUBLISHER.stateCode, book.title FROM PUBLISHER, BOOK WHERE INSTR(PUBLISHER.name, "read") AND BOOK.publisherID = PUBLISHER.publisherID;
-- This doesn't work. I can't figure out how to fix it.

-- Q7:
select title, TRUNCATE(AVG(BOOKREVIEW.rating), 0) 'Average Rating', CONCAT(SUBSTRING(BOOK.description, 1, 20), '...') 'Description Excerpt' FROM BOOK LEFT JOIN BOOKREVIEW ON BOOKREVIEW.isbn = BOOK.isbn WHERE BOOK.title LIKE '%The%' GROUP BY BOOK.isbn ORDER BY AVG(BOOKREVIEW.rating) DESC;