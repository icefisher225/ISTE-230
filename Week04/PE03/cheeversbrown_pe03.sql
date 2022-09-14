use database sakilav2;

tee /tmp/cheeversbrown_pe03.txt;

-- #1
select `title`, `length` from `film` where `description` like '%fun%' and `length` <= 120;

-- #2
select `title` from `film` where `title` like '%a' or `title` like '%e' or `title` like '%i' or `title` like '%o' or `title` like '%u';

-- #3
select `title` from `film` where  `length` >= 120 and `length` <= 180;

-- #4
select `title`, `length` from `film` where  `title` like "%river%" and (`rating` like 'PG' or `rating` like 'PG-13');

-- #5
select `title` from `film` where length > 160 and releaseYear > 2012;

-- #6
select `title`, `replacementCost`, `rating` from `film` where (not `title` like '_a%') and replacementCost = 19.99;

-- #7
select `title` from `film` where `description` is null;

-- #8
select `replacementCost` from `film` where `title` like 'Town Ark';

-- #9
select `title` from `film` where (`rating` like 'G' and releaseYear = 2006) or (`rating` like 'PG' and releaseYear = 2010);

-- #10
select `filmID`, `title`, `releaseYear`, `length`, `replacementCost`, `rating` from `film` where not (releaseYear = 2006 or releaseYear = 2010);

-- #11
UPDATE film SET `replacementCost` = 5.59 WHERE releaseYear = 2006;

-- #12
UPDATE film SET `replacementCost` = 10.00 WHERE releaseYear = 2006;

-- #13
DELETE FROM film WHERE (`length` < 60 and rating like 'PG');

notee;