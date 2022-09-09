-- tables
-- Table: Books

DROP DATABASE IF EXISTS PE02;

CREATE DATABASE PE02;

USE PE02;

CREATE TABLE Books (
    title           VARCHAR(50),
    isbn13Number    VARCHAR(13)     UNIQUE,
    author          VARCHAR(255),
    numberOfPages   SMALLINT,
    releaseDate     DATE,
);

DESCRIBE Books;