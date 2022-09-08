-- tables
-- Table: Books
CREATE TABLE Books (
    title           VARCHAR(50),
    isbn13Number    VARCHAR(13)     UNIQUE,
    author          VARCHAR(255),
    numberOfPages   SMALLINT,
    releaseDate     DATE,
);

DESCRIBE Books;