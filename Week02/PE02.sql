-- tables
-- Table: Books
CREATE TABLE Books (
    title           VARCHAR(50)     NULL,
    isbn13Number    VARCHAR(13)     UNIQUE,
    author          VARCHAR(255)    NULL,
    numberOfPages   SMALLINT        NULL,
    releaseDate     DATE            NULL,
);

SHOW TABLE WHERE NAME=Books;