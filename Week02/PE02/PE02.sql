-- Ryan Cheevers-Brown
-- PE02 for ISTE230

DROP DATABASE IF EXISTS PE02;

CREATE DATABASE PE02;

USE PE02;

CREATE TABLE Book (
    title           VARCHAR(50),
    isbn13Number    CHAR(13)     UNIQUE,
    author          VARCHAR(255),
    numberOfPages   SMALLINT UNSIGNED,
    releaseDate     DATE,
    CONSTRAINT Book_pk PRIMARY KEY (isbn13Number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESCRIBE Book;