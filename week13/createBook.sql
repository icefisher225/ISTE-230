DROP DATABASE IF EXISTS book;
CREATE DATABASE book;
use book;

CREATE TABLE author(
   authorID INT,
   lastName VARCHAR(50) NOT NULL,
   firstName VARCHAR(50) NOT NULL,
   photo VARCHAR(1),
   CONSTRAINT author_pk PRIMARY KEY(authorID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE category(
   catID INT,
   catDescription VARCHAR(24),
   CONSTRAINT category_pk PRIMARY KEY(catID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE state(
   stateCode CHAR(2),
   stateName VARCHAR(50),
   CONSTRAINT state_pk PRIMARY KEY(stateCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE bookCondition(
   ranking INT,
   description VARCHAR(50),
   fullDescription VARCHAR(255),
   CONSTRAINT condition_pk PRIMARY KEY(ranking)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE conditionEvaluator(
   evaluator CHAR(3),
   evaluatorsName VARCHAR(36) NOT NULL,
   CONSTRAINT condeval_pk PRIMARY KEY(evaluator)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE reviewer(
   reviewerID INT,
   name VARCHAR(20) NOT NULL,
   employedBy CHAR(30),
   CONSTRAINT reviewer_pk PRIMARY KEY(reviewerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE owner(
   ownerID INT,
   lastName VARCHAR(30) NOT NULL,
   firstName VARCHAR(20) NOT NULL,
   phoneNumber CHAR(14),
   username VARCHAR(30) NOT NULL,
   password VARCHAR(30) NOT NULL,
   CONSTRAINT owner_pk PRIMARY KEY(ownerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE publisher(
   publisherID INT,
   name VARCHAR(50) NOT NULL,
   city VARCHAR(30),
   stateCode CHAR(2),
   CONSTRAINT publisher_pk PRIMARY KEY(publisherID),
   CONSTRAINT publisher_stateCode_fk FOREIGN KEY(stateCode) REFERENCES state(stateCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE book(
   isbn CHAR(13),
   title VARCHAR(70) NOT NULL,
   description VARCHAR(100),
   category INT,
   edition CHAR(30),
   publisherID INT NOT NULL,
   CONSTRAINT book_pk PRIMARY KEY(isbn),
   CONSTRAINT book_category_fk FOREIGN KEY(category) REFERENCES category(catID),
   CONSTRAINT book_publisherID_fk FOREIGN KEY(publisherID) REFERENCES publisher(publisherID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE bookAuthor(
   isbn CHAR(13) NOT NULL,
   authorID INT NOT NULL,
   primaryAuthor CHAR(1),
   CONSTRAINT bookAuthor_pk PRIMARY KEY(isbn, authorID),
   CONSTRAINT bookAuthor_isbn_fk FOREIGN KEY(isbn) REFERENCES book(isbn),
   CONSTRAINT bookauther_authorID_fk FOREIGN KEY(authorID) REFERENCES author(authorID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE bookReview(
   isbn CHAR(13) NOT NULL,
   reviewerID INT NOT NULL,
   rating INT,
   comments VARCHAR(255),
   CONSTRAINT bookReview_pk PRIMARY KEY(isbn, reviewerID),
   CONSTRAINT bookReview_isbn_fk FOREIGN KEY(isbn) REFERENCES book(isbn),
   CONSTRAINT bookReview_reviewerID_fk FOREIGN KEY(reviewerID) REFERENCES reviewer(reviewerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ownersBook(
   ownerID INT NOT NULL,
   isbn CHAR(13) NOT NULL,
   ranking INT,
   evaluator CHAR(3),
   comments VARCHAR(255),
   price DECIMAL(12,2),
   transactionFlag CHAR(1),
   CONSTRAINT ownersBook_pk PRIMARY KEY(ownerID, isbn),
   CONSTRAINT ownersBook_ownerID_fk FOREIGN KEY(ownerID) REFERENCES owner(ownerID),
   CONSTRAINT ownersBook_isbn_fk FOREIGN KEY(isbn) REFERENCES book(isbn),
   CONSTRAINT ownersBook_ranking_fk FOREIGN KEY(ranking) REFERENCES bookCondition(ranking),
   CONSTRAINT ownersBook_evaluator_fk FOREIGN KEY(evaluator) REFERENCES conditionEvaluator(evaluator)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'author'
--

INSERT INTO author VALUES (1,'Machogeek','Hero', NULL);
INSERT INTO author VALUES (2,'Stratton','Bill', NULL);
INSERT INTO author VALUES (3,'Kennedy','Dan', NULL);
INSERT INTO author VALUES (4,'Sonstein','Jeff', NULL);
INSERT INTO author VALUES (5,'Troell','Luther', NULL);
INSERT INTO author VALUES (6,'Lutz','Peter', NULL);
INSERT INTO author VALUES (7,'Heartthrob','Danielle', NULL);
INSERT INTO author VALUES (8,'Lawley','Elizabeth', NULL);
INSERT INTO author VALUES (9,'Weeden','Elissa', NULL);
INSERT INTO author VALUES (10,'Johnson','Daryl', NULL);
INSERT INTO author VALUES (11,'Garrison','Dan', NULL);
INSERT INTO author VALUES (12,'Hartpence','Bruce', NULL);
INSERT INTO author VALUES (13,'Leone','James', NULL);
INSERT INTO author VALUES (14,'Phelps','Andrew', NULL);
INSERT INTO author VALUES (15,'Henderson','Tona', NULL);
INSERT INTO author VALUES (17,'Webguy','Smerdley', NULL);
INSERT INTO author VALUES (18,'Jacobs','Steve', NULL);
INSERT INTO author VALUES (19,'Niemi','Rayno', NULL);
INSERT INTO author VALUES (20,'Kang','Jai', NULL);
INSERT INTO author VALUES (21,'Perez-Hardy','Sylvia', NULL);
INSERT INTO author VALUES (22,'Mason','Sharon', NULL);
INSERT INTO author VALUES (23,'Perry','Ron', NULL);
INSERT INTO author VALUES (24,'Whittington','Keith', NULL);
INSERT INTO author VALUES (25,'Bierre','Kevin', NULL);
INSERT INTO author VALUES (26,'Holden','Ed', NULL);
INSERT INTO author VALUES (27,'Axelrod','Mike', NULL);


--
-- Dumping data for table 'category'
--

INSERT INTO category VALUES (1,'Romance');
INSERT INTO category VALUES (2,'Comics');
INSERT INTO category VALUES (3,'Programming');
INSERT INTO category VALUES (4,'Database');
INSERT INTO category VALUES (5,'Networking');
INSERT INTO category VALUES (6,'Library Science');
INSERT INTO category VALUES (7,'Science');
INSERT INTO category VALUES (8,'Geography');
INSERT INTO category VALUES (9,'Sports');


--
-- Dumping data for table 'state'
--

INSERT INTO state VALUES ('AK','ALASKA');
INSERT INTO state VALUES ('AL','ALABAMA');
INSERT INTO state VALUES ('AR','ARKANSAS');
INSERT INTO state VALUES ('AS','AMERICAN SAMOA');
INSERT INTO state VALUES ('AZ','ARIZONA');
INSERT INTO state VALUES ('CA','CALIFORNIA');
INSERT INTO state VALUES ('CO','COLORADO');
INSERT INTO state VALUES ('CT','CONNECTICUT');
INSERT INTO state VALUES ('DC','DISTRICT OF COLUMBIA');
INSERT INTO state VALUES ('DE','DELAWARE');
INSERT INTO state VALUES ('FL','FLORIDA');
INSERT INTO state VALUES ('FM','FEDERATED STATES OF MICRONESIA');
INSERT INTO state VALUES ('GA','GEORGIA');
INSERT INTO state VALUES ('GU','GUAM');
INSERT INTO state VALUES ('HI','HAWAII');
INSERT INTO state VALUES ('IA','IOWA');
INSERT INTO state VALUES ('ID','IDAHO');
INSERT INTO state VALUES ('IL','ILLINOIS');
INSERT INTO state VALUES ('IN','INDIANA');
INSERT INTO state VALUES ('KS','KANSAS');
INSERT INTO state VALUES ('KY','KENTUCKY');
INSERT INTO state VALUES ('LA','LOUISIANA');
INSERT INTO state VALUES ('MA','MASSACHUSETTS');
INSERT INTO state VALUES ('MD','MARYLAND');
INSERT INTO state VALUES ('ME','MAINE');
INSERT INTO state VALUES ('MH','MARSHALL ISLANDS');
INSERT INTO state VALUES ('MI','MICHIGAN');
INSERT INTO state VALUES ('MN','MINNESOTA');
INSERT INTO state VALUES ('MO','MISSOURI');
INSERT INTO state VALUES ('MP','NORTHERN MARIANA ISLANDS');
INSERT INTO state VALUES ('MS','MISSISSIPPI');
INSERT INTO state VALUES ('MT','MONTANA');
INSERT INTO state VALUES ('NC','NORTH CAROLINA');
INSERT INTO state VALUES ('ND','NORTH DAKOTA');
INSERT INTO state VALUES ('NE','NEBRASKA');
INSERT INTO state VALUES ('NH','NEW HAMPSHIRE');
INSERT INTO state VALUES ('NJ','NEW JERSEY');
INSERT INTO state VALUES ('NM','NEW MEXICO');
INSERT INTO state VALUES ('NV','NEVADA');
INSERT INTO state VALUES ('NY','NEW YORK');
INSERT INTO state VALUES ('OH','OHIO');
INSERT INTO state VALUES ('OK','OKLAHOMA');
INSERT INTO state VALUES ('OR','OREGON');
INSERT INTO state VALUES ('PA','PENNSYLVANIA');
INSERT INTO state VALUES ('PR','PUERTO RICO');
INSERT INTO state VALUES ('PW','PALAU');
INSERT INTO state VALUES ('RI','RHODE ISLAND');
INSERT INTO state VALUES ('SC','SOUTH CAROLINA');
INSERT INTO state VALUES ('SD','SOUTH DAKOTA');
INSERT INTO state VALUES ('TN','TENNESSEE');
INSERT INTO state VALUES ('TX','TEXAS');
INSERT INTO state VALUES ('UT','UTAH');
INSERT INTO state VALUES ('VA','VIRGINIA');
INSERT INTO state VALUES ('VI','VIRGIN ISLANDS');
INSERT INTO state VALUES ('VT','VERMONT');
INSERT INTO state VALUES ('WA','WASHINGTON');
INSERT INTO state VALUES ('WI','WISCONSIN');
INSERT INTO state VALUES ('WV','WEST VIRGINIA');
INSERT INTO state VALUES ('WY','WYOMING');


--
-- Dumping data for table 'bookCondition'
--

INSERT INTO bookCondition VALUES (1,'Bad','Not much is left of the book. Parts are not legible, cover may be missing.');
INSERT INTO bookCondition VALUES (2,'Poor','Pages may be missing. Many pages may be marked.');
INSERT INTO bookCondition VALUES (3,'Average','Less than 3 pages missing. Small markings. Cover intact.');
INSERT INTO bookCondition VALUES (4,'Good','No pages missing, may be marked on less than 5 pages, not obscuring text or diagrams. Cover is in good condition');
INSERT INTO bookCondition VALUES (5,'Excellent','Like new.');


--
-- Dumping data for table 'conditionEvaluator'
--

INSERT INTO conditionEvaluator VALUES ('bgq','Brendle Gottschalk Quakfloat');
INSERT INTO conditionEvaluator VALUES ('bwq','Brendle Whitehouse Quakfloat');
INSERT INTO conditionEvaluator VALUES ('bxz','Brendle Xavier Zorfwaite');
INSERT INTO conditionEvaluator VALUES ('efy','Everest Frandice Yerfwundle');
INSERT INTO conditionEvaluator VALUES ('evr','Everest Vorble Rufflehouse');
INSERT INTO conditionEvaluator VALUES ('ews','Everest Whitehouse Xavier');
INSERT INTO conditionEvaluator VALUES ('ggy','Gertrude Gottschalk Yerfwundle');
INSERT INTO conditionEvaluator VALUES ('gos','Gertrude Orlando Sweepfuddle');
INSERT INTO conditionEvaluator VALUES ('jfs','Jamie Frandice Sweepfuddle');
INSERT INTO conditionEvaluator VALUES ('jwg','Jamie Whitehouse Gruffwinder');
INSERT INTO conditionEvaluator VALUES ('pap','Paul Alfred Prefwindow');
INSERT INTO conditionEvaluator VALUES ('pop','Phyllis Orlando Prefwindow');
INSERT INTO conditionEvaluator VALUES ('pvp','Paul Vorble Prefwindow');
INSERT INTO conditionEvaluator VALUES ('rxg','Robert Xavier Gruffwinder');
INSERT INTO conditionEvaluator VALUES ('tag','Thomas Alfred Gruffwinder');
INSERT INTO conditionEvaluator VALUES ('tgr','Thomas Gottschalk Rufflehouse');
INSERT INTO conditionEvaluator VALUES ('wwq','William Whitehouse Quakfloat');
INSERT INTO conditionEvaluator VALUES ('xgz','Xavier Gottschalk Zorfwaite');
INSERT INTO conditionEvaluator VALUES ('xvx','Xavier Vorble Xavier');


--
-- Dumping data for table 'reviewer'
--

INSERT INTO reviewer VALUES (1,'Jacobs','Gadget Boy');
INSERT INTO reviewer VALUES (2,'Troell','Dallas Underground');
INSERT INTO reviewer VALUES (3,'Bills','The RIT Reporter');
INSERT INTO reviewer VALUES (4,'Hill','Microsoft News');
INSERT INTO reviewer VALUES (5,'Kurtz','MacIntosh News');
INSERT INTO reviewer VALUES (6,'Leone',null);
INSERT INTO reviewer VALUES (7,'Doubleday','Media Mania');
INSERT INTO reviewer VALUES (8,'Wells','The RIT Reporter');
INSERT INTO reviewer VALUES (9,'Worthington','The Annex');
INSERT INTO reviewer VALUES (10,'Lawson','The Last Word');
INSERT INTO reviewer VALUES (11,'Lasky',null);
INSERT INTO reviewer VALUES (12,'Rozanski',null);
INSERT INTO reviewer VALUES (13,'Whittington','JAVA Rocks');
INSERT INTO reviewer VALUES (14,'Holden',null);
INSERT INTO reviewer VALUES (15,'Stratton','Harvard Lampoon');
INSERT INTO reviewer VALUES (16,'Johnson','NRA Weekly');
INSERT INTO reviewer VALUES (17,'Mason','BMW Owners Quarterly');
INSERT INTO reviewer VALUES (18,'Goodman','MacIntosh News');
INSERT INTO reviewer VALUES (19,'Phelps','Detroit News');
INSERT INTO reviewer VALUES (20,'Yacci','The Learning Channel');
INSERT INTO reviewer VALUES (24,'Weeden','Scrye');
INSERT INTO reviewer VALUES (25,'McVea','Programming Central');
INSERT INTO reviewer VALUES (26,'Perez-Hardy','The Network Voice');
INSERT INTO reviewer VALUES (27,'Heartthrob','Journal of Romance');
INSERT INTO reviewer VALUES (28,'Bierre','JAVA Rocks');
INSERT INTO reviewer VALUES (29,'Axelrod','JAVA Rocks');



--
-- Dumping data for table 'owner'
--

INSERT INTO owner VALUES (1,'Fribblestone','Gus','(716) 555-0975','GusBuster@arl.com','democrat');
INSERT INTO owner VALUES (2,'Scott','Francis','(716) 555-4567','FranTheMan@arl.com','Habib');
INSERT INTO owner VALUES (3,'Corplestein','Leslie','(716) 555-4567','LesTheLass@hopmail.com','Amit');
INSERT INTO owner VALUES (4,'Corplestein','Ira','(716) 555-4567','IraBeForever@maybe.com','Peng');
INSERT INTO owner VALUES (5,'Francis','Scott','(716) 555-0840','scotty@wherever.com','scotty');
INSERT INTO owner VALUES (6,'Ling','Wei','(716) 555-4567','wxl0101@rit.edu','Cao');
INSERT INTO owner VALUES (7,'Burblemonger','Mary','(716) 555-8865','GerbilLover@hatmail.com','mymy!');
INSERT INTO owner VALUES (8,'Rabblewok','George','(716) 555-1989','ForRent@wherever.com','yourmine');
INSERT INTO owner VALUES (9,'Tripplewander','Martha','(716) 555-2877','TakeMeFirst@quicksend.com','imfirst');
INSERT INTO owner VALUES (10,'Lumberworker','George','(31) 555-5977','RachetMan@toolbox.net','timthetoolman');
INSERT INTO owner VALUES (11,'Ferblemander','Frederick','(315) 555-6778','FerbieTheGreat@webSent.net','whoknows');
INSERT INTO owner VALUES (12,'Ribblemaze','Ronda','(716) 555-2443','RibbleIsHere@webSent.net','idon');


--
-- Dumping data for table 'publisher'
--

INSERT INTO publisher VALUES (1,'CovertoCover Publishing','Rochester','NY');
INSERT INTO publisher VALUES (2,'ReadMeFirst House of Publishing','New York','NY');
INSERT INTO publisher VALUES (3,'TitlesRUs Book Company','Rochester','MN');
INSERT INTO publisher VALUES (4,'ReadEmandWeep Romance Publishing','Chicago','IL');
INSERT INTO publisher VALUES (5,'ScanALot Paperback Books','Chicago','IL');
INSERT INTO publisher VALUES (6,'EZRead Masterpiece Comics','New York','NY');
INSERT INTO publisher VALUES (7,'CumbersomeText Press','New York','NY');
INSERT INTO publisher VALUES (8,'PrintingPress Magic','Rochester','NY');
INSERT INTO publisher VALUES (9,'Guttenberg and Associates','Chicago','IL');
INSERT INTO publisher VALUES (10,'ReadMeNext House of Publishing','New York','NY');
INSERT INTO publisher VALUES (11,'ReadEmandSleep Publishing House','Hartford','CT');
INSERT INTO publisher VALUES (12,'WebTime Publishing Incorporated','Boston','MA');
INSERT INTO publisher VALUES (13,'The JAVA Press','San Francisco','CA');

--
-- Dumping data for table 'book'
--

INSERT INTO book VALUES ('1-111-11111-4','Women are From Venus ORACLE is from Beyond Pluto','New York Times Best Seller 27 weeks',1,'4',1);
INSERT INTO book VALUES ('1-222-32443-7','Calculus for Phys Ed Majors','Carry our 200 lb text book: learn integrals and keep in Shape',7,'3',7);
INSERT INTO book VALUES ('1-295-84547-1','My Love\'s Last Longing','Volume 1 of 4',1,'1',4);
INSERT INTO book VALUES ('1-533-73363-8','From the Shores of Lake Erie to IT','One man\'s Journey to IT',8,'2',1);
INSERT INTO book VALUES ('1-559-68777-1','My Love\'s Last Lingering Lost','Volume 2 of 4',1,'1',4);
INSERT INTO book VALUES ('1-932-87447-6','The Science of Literature Searching','A Book Worth a Look is Worth a Good Look Up',6,'1',5);
INSERT INTO book VALUES ('2-089-77869-5','Yes! Networking is for Bills Fans','How to Use a Spanning Tree to Exit Rich Stadium',9,'1',8);
INSERT INTO book VALUES ('2-122-29058-5','How to Keep your Cellular Bill Down','How to carry 500 Miles of Fiber in Your Wallet',5,'2',2);
INSERT INTO book VALUES ('2-221-11341-5','Tired of wired? Infrared instead!','500 Ways to pull out your hair while pulling out all your cable',5,'1',2);
INSERT INTO book VALUES ('3-444-95595-4','ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR','How U can avoid being trapped in Database acronyms',4,'1',3);
INSERT INTO book VALUES ('3-445-43341-2','Master Wireless Through The Classic Comics','Infrared man triumphs over Cable Guy and CoAx NastyMan',2,'1',6);
INSERT INTO book VALUES ('3-445-58668-5','How to Keep your Cable Bill Down','How to Avoid Tripping on 500 Miles of Fiber in your wallet',5,'1',10);
INSERT INTO book VALUES ('4-344-22221-1','I Lasted my Love\'s Last Lingering Longing','Volume 3 of 4',1,'2',4);
INSERT INTO book VALUES ('4-668-39283-8','From Deep in the Heart of Texas to IT','One man\'s Journey to IT',8,'1',1);
INSERT INTO book VALUES ('5-538-55746-1','My Lost Love\'s Long Last Lingering','Volume 4 of 4',1,'1',4);
INSERT INTO book VALUES ('6-449-68668-8','From Brockport to IT','Prof. Johnson\'s Journey to IT (about 25 min via 490)',8,'1',1);
INSERT INTO book VALUES ('7-999-14432-2','Master HTML Through The Classic Comics','Using his Super Web thrower, Spiderman creates HTML docs',2,'2',6);
INSERT INTO book VALUES ('8-330-69586-6','The Shortest Book in the World','A Guide to how Detroit will win the World Series in 2001',9,'1',3);
INSERT INTO book VALUES ('9-333-44441-1','My Love\'s at Long Last Lost his Lingering','Volume 5 of 4',1,'1',4);
INSERT INTO book VALUES ('9-337-55467-3','How to add Class to your Programming','How to write programs in VB instead of C',3,'3',10);
INSERT INTO book VALUES ('9-400-55555-2','Master C++ Through The Classic Comics','GeekMan triumphs over C++ program infected with Kryptonite virus',2,'1',6);
INSERT INTO book VALUES ('9-444-43356-3','A language without Pointers? Priceless.','For Everything Else, there\'s C++',3,'1',13);
INSERT INTO book VALUES ('9-455-61223-3','JAVA: It\'s more than Just a Programming Language','Achieve enlightenment through the mystery of the Swing package',3,'1',7);

--
-- Dumping data for table 'bookAuthor'
--

INSERT INTO bookAuthor VALUES ('1-111-11111-4',9,'Y');
INSERT INTO bookAuthor VALUES ('1-222-32443-7',5,'N');
INSERT INTO bookAuthor VALUES ('1-222-32443-7',11,'N');
INSERT INTO bookAuthor VALUES ('1-222-32443-7',12,'Y');
INSERT INTO bookAuthor VALUES ('1-295-84547-1',7,'Y');
INSERT INTO bookAuthor VALUES ('1-533-73363-8',2,'Y');
INSERT INTO bookAuthor VALUES ('1-559-68777-1',7,'Y');
INSERT INTO bookAuthor VALUES ('1-932-87447-6',8,'Y');
INSERT INTO bookAuthor VALUES ('1-932-87447-6',15,'N');
INSERT INTO bookAuthor VALUES ('2-089-77869-5',6,'Y');
INSERT INTO bookAuthor VALUES ('2-089-77869-5',13,'N');
INSERT INTO bookAuthor VALUES ('2-089-77869-5',14,'N');
INSERT INTO bookAuthor VALUES ('2-122-29058-5',12,'Y');
INSERT INTO bookAuthor VALUES ('2-221-11341-5',12,'Y');
INSERT INTO bookAuthor VALUES ('3-444-95595-4',2,'Y');
INSERT INTO bookAuthor VALUES ('3-445-43341-2',12,'Y');
INSERT INTO bookAuthor VALUES ('3-445-58668-5',12,'Y');
INSERT INTO bookAuthor VALUES ('4-344-22221-1',7,'Y');
INSERT INTO bookAuthor VALUES ('4-668-39283-8',5,'Y');
INSERT INTO bookAuthor VALUES ('5-538-55746-1',7,'Y');
INSERT INTO bookAuthor VALUES ('6-449-68668-8',10,'Y');
INSERT INTO bookAuthor VALUES ('7-999-14432-2',1,'N');
INSERT INTO bookAuthor VALUES ('7-999-14432-2',17,'Y');
INSERT INTO bookAuthor VALUES ('8-330-69586-6',14,'Y');
INSERT INTO bookAuthor VALUES ('9-333-44441-1',7,'Y');
INSERT INTO bookAuthor VALUES ('9-337-55467-3',19,'N');
INSERT INTO bookAuthor VALUES ('9-337-55467-3',20,'Y');
INSERT INTO bookAuthor VALUES ('9-400-55555-2',1,'N');
INSERT INTO bookAuthor VALUES ('9-400-55555-2',17,'Y');
INSERT INTO bookAuthor VALUES ('9-444-43356-3',25,'Y');
INSERT INTO bookAuthor VALUES ('9-444-43356-3',27,'N');
INSERT INTO bookAuthor VALUES ('9-455-61223-3',4,'Y');


--
-- Dumping data for table 'bookReview'
--

INSERT INTO bookReview VALUES ('1-111-11111-4',19,10,'Hold on to your hats, gang! If you think a cookbook or the yellow pages is exciting reading, you gotta read Professor Spada\'s remarkable treatise on enriching you personal relationships through your knowledge of ORACLE 8.1.6. In an easy-to-read fashion, s');
INSERT INTO bookReview VALUES ('1-295-84547-1',27,10,'This is one of the most outstanding books ever written. Five thumbs up. Five stars. A must-read for everyone.');
INSERT INTO bookReview VALUES ('1-533-73363-8',20,4,'A rather boring autobiography of a northern Ohio native who migrates to Rochester New York where he becomes a professor of Information Technology at RIT. Other than the chapters devoted to the Cleveland Indians (chapters 1, 2, 3, 6, 10, 11, 12, 13), The C');
INSERT INTO bookReview VALUES ('1-559-68777-1',2,8,'A wonderful romance novel about Matt, a successful editor for the New York Times, who resigns and retreats to a Dude Ranch in New Mexico to find himself.  Matt meets Margaret, a person with cowgirl charm in touch with her masculine self. Matt falls in lov');
INSERT INTO bookReview VALUES ('1-559-68777-1',19,9,'A wonderful romance novel about Margaret, a successful editor for the New York Times, who resigns and retreats to a Dude Ranch in New Mexico to find herself.  Margaret meets Matt, a person with tough cowboy swagger in touch with his feminine self. Margare');
INSERT INTO bookReview VALUES ('2-089-77869-5',5,5,'Definitely don\'t buy this book if you are a Giants fan.  Two Giants fans tried this technique at the Giants game several weeks ago and they aren\'t back yet.');
INSERT INTO bookReview VALUES ('2-089-77869-5',13,8,'For any networking buff/Bills fan, Dr. Lutz\' treatise on the use of spanning trees to exit a Buffalo Bills game is a must. It is difficult to slog through in spots, but he shows you that by applying his minimalization technique you can get back to Rochest');
INSERT INTO bookReview VALUES ('2-089-77869-5',15,6,'Don\'t buy this book unless your are  Bills fan.  Fans of any other team will find their departure time from a Bills game actually triples when the technique is applied. In fact, it probably accounts for why Dr. Lutz (and any other Bills fan who applies it');
INSERT INTO bookReview VALUES ('2-122-29058-5',6,7,'Professor Hartpence shows you how to carry 500 miles of fiber in your wallet.  Warning to the unwary: don\'t buy this book unless you have deep pockets.');
INSERT INTO bookReview VALUES ('2-122-29058-5',13,8,'Watch out Jim Carey .. this non-cable guy may leave you out of work. In his book, Professor Hartpence combines his cellular and networking skills with his experience in both the military and the commercial world and the practice of Zen to show you how to');
INSERT INTO bookReview VALUES ('3-444-95595-4',3,4,'U lose if you ever bother to read this book.');
INSERT INTO bookReview VALUES ('3-445-58668-5',6,7,'This book is a follow-up to Professor Hartpence\'s book on how to carry 500 miles of fiber in your wallet.');
INSERT INTO bookReview VALUES ('4-344-22221-1',24,7,'A wonderful romance novel about Nelson, a successful editor for the New York Times, who resigns and retreats to a Dude Ranch in New Mexico to find himself.  Nelson meets Laura, a person with cowgirl charm in touch with her masculine self. Nelson falls in');
INSERT INTO bookReview VALUES ('4-668-39283-8',6,6,'A sometimes boring autobiography of a Texan transplanted to Rochester New York where he becomes a professor of Information Technology at RIT. Other than the chapters devoted to the Dallas Cowboys (chapters 1, 2, 3, 6, 10, 11, 12, 13), The Presidential ele');
INSERT INTO bookReview VALUES ('5-538-55746-1',15,9,'A wonderful romance novel about Laura, a successful editor for the New York Times, who resigns and retreats to a Dude Ranch in New Mexico to find herself.  Laura meets Nelson, a person with tough cowboy swagger in touch with his feminine self. Laura falls');
INSERT INTO bookReview VALUES ('6-449-68668-8',20,7,'The funny, often racy, autobiography of Daryl Johnson and his escapades to and from RIT. The book is largely about the excitement of commuting from the west side to RIT every day and how much fun it can be. A great book for those who live on the west side');
INSERT INTO bookReview VALUES ('6-449-68668-8',26,10,'An absolutely outstanding autobiography of a Saint John Fisher Graduate and how he has adapted to his 20 minute ride (mostly on 490) to RIT every morning and his 20 ride (mostly on 490) home from RIT every night. The author uses thirteen chapters to vibra');
INSERT INTO bookReview VALUES ('8-330-69586-6',5,10,'Geez .. no pages, no paragraphs, no words .. not even an illustration. But he did dedicate the book to Tony Clark. Says something for the fervor of this Detroit Tigers fan.');
INSERT INTO bookReview VALUES ('8-330-69586-6',15,10,'Very accurate analysis of a problem that is not NP complete.');
INSERT INTO bookReview VALUES ('9-333-44441-1',24,7,'Throwing the usual themes and twists of a romance novel to the winds, the author tells the store of Laura, a successful Dude Ranch owner in New Mexico, who resigns and moves to New York to seek her fortune as an editor for the New York Times. Laura meets');
INSERT INTO bookReview VALUES ('9-337-55467-3',25,9,'These authors know their way around a coding pad, let me tell you! In clear, bell-shaped tones, with succinct wording and pinpoint accuracy, they nail this subject matter to the wall. Do you like inheritance? How about information hiding? Maybe you like e');
INSERT INTO bookReview VALUES ('9-455-61223-3',13,9,'Professor Sonstein shows how oneness with the spiritual universe can be achieved by bringing the soul into rhytmn with the JAVA runtime machine. He shows that through various forms of self denial, such as writing code without pointers and heavy weight com');


--
-- Dumping data for table 'ownersBook'
--

INSERT INTO ownersBook VALUES (2,'2-089-77869-5',4,'gos','',40.00,'b');
INSERT INTO ownersBook VALUES (3,'1-295-84547-1',4,'gos','',50.00,'s');
INSERT INTO ownersBook VALUES (3,'1-533-73363-8',3,'wwq','',null,'b');
INSERT INTO ownersBook VALUES (3,'4-668-39283-8',3,'jwg','',null,'s');
INSERT INTO ownersBook VALUES (4,'2-089-77869-5',4,'pop','',75.00,'s');
INSERT INTO ownersBook VALUES (4,'2-122-29058-5',5,'pop','',65.00,'s');
INSERT INTO ownersBook VALUES (4,'3-444-95595-4',2,'pvp','',null,'s');
INSERT INTO ownersBook VALUES (5,'2-122-29058-5',4,'pvp','',25.00,'s');
INSERT INTO ownersBook VALUES (5,'3-444-95595-4',3,'pvp','',50.00,'s');
INSERT INTO ownersBook VALUES (6,'1-932-87447-6',2,'rxg','',60.00,'b');
INSERT INTO ownersBook VALUES (6,'4-668-39283-8',3,'rxg','',null,'s');
INSERT INTO ownersBook VALUES (6,'9-333-44441-1',4,'bwq','',100.00,'b');
INSERT INTO ownersBook VALUES (7,'1-559-68777-1',4,'efy','',80.00,'b');
INSERT INTO ownersBook VALUES (8,'2-122-29058-5',2,'ggy','',65.00,'s');
INSERT INTO ownersBook VALUES (9,'3-445-58668-5',1,'jwg','',45.00,'b');
INSERT INTO ownersBook VALUES (9,'4-344-22221-1',3,'jwg','',null,'s');
INSERT INTO ownersBook VALUES (9,'5-538-55746-1',4,'jwg','',25.00,'s');
INSERT INTO ownersBook VALUES (9,'8-330-69586-6',2,'bgq','',35.00,'s');
INSERT INTO ownersBook VALUES (10,'1-533-73363-8',3,'bgq','',0.00,'s');


