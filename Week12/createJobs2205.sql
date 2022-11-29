DROP DATABASE jobs;
CREATE DATABASE jobs;
USE jobs;

CREATE TABLE state (
stateCode   CHAR(2),
description VARCHAR(30) NOT NULL,
CONSTRAINT state_pk PRIMARY KEY (stateCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE quarter (
qtrCode  VARCHAR(5),
location CHAR(2),
minSal   DECIMAL(6,2) NOT NULL,
minHrs   TINYINT UNSIGNED NOT NULL,
CONSTRAINT quarter_pk PRIMARY KEY (qtrCode),
CONSTRAINT quarter_location_fk FOREIGN KEY (location) REFERENCES state(stateCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE employer (
companyName VARCHAR(30) NOT NULL,
division    VARCHAR(30) NOT NULL,
address     VARCHAR(30),
city        VARCHAR(20),
stateCode   CHAR(2) NOT NULL,
zipCode     VARCHAR(10),
CONSTRAINT employer_pk PRIMARY KEY (companyname, division),
CONSTRAINT employer_stateCode_fk FOREIGN KEY (stateCode) REFERENCES state(stateCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE interview (
interviewID   INTEGER UNSIGNED,
interviewDate DATE,
companyName   VARCHAR(30) NOT NULL,
division      VARCHAR(30) NOT NULL,
qtrCode       VARCHAR(5),
salaryOffered DECIMAL(8,2),
minHrsOffered TINYINT UNSIGNED,
listing       ENUM('y', 'n'),
jobDesc       VARCHAR(255),
CONSTRAINT interview_pk PRIMARY KEY (interviewID),
CONSTRAINT interview_companyName_division_fk FOREIGN KEY (companyName, division) 
	REFERENCES employer(companyname, division),
CONSTRAINT interview_qtrCode_fk FOREIGN KEY (qtrCode) REFERENCES quarter(qtrCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO state(description,stateCode) VALUES('ALABAMA','AL');
INSERT INTO state(description,stateCode) VALUES('ALASKA','AK');
INSERT INTO state(description,stateCode) VALUES('AMERICAN SAMOA','AS');
INSERT INTO state(description,stateCode) VALUES('ARIZONA','AZ');
INSERT INTO state(description,stateCode) VALUES('ARKANSAS','AR');
INSERT INTO state(description,stateCode) VALUES('CALIFORNIA','CA');
INSERT INTO state(description,stateCode) VALUES('COLORADO','CO');
INSERT INTO state(description,stateCode) VALUES('CONNECTICUT','CT');
INSERT INTO state(description,stateCode) VALUES('DELAWARE','DE');
INSERT INTO state(description,stateCode) VALUES('DISTRICT OF COLUMBIA','DC');
INSERT INTO state(description,stateCode) VALUES('FEDERATED STATES OF MICRONESIA','FM');
INSERT INTO state(description,stateCode) VALUES('FLORIDA','FL');
INSERT INTO state(description,stateCode) VALUES('GEORGIA','GA');
INSERT INTO state(description,stateCode) VALUES('GUAM','GU');
INSERT INTO state(description,stateCode) VALUES('HAWAII','HI');
INSERT INTO state(description,stateCode) VALUES('IDAHO','ID');
INSERT INTO state(description,stateCode) VALUES('ILLINOIS','IL');
INSERT INTO state(description,stateCode) VALUES('INDIANA','IN');
INSERT INTO state(description,stateCode) VALUES('IOWA','IA');
INSERT INTO state(description,stateCode) VALUES('KANSAS','KS');
INSERT INTO state(description,stateCode) VALUES('KENTUCKY','KY');
INSERT INTO state(description,stateCode) VALUES('LOUISIANA','LA');
INSERT INTO state(description,stateCode) VALUES('MAINE','ME');
INSERT INTO state(description,stateCode) VALUES('MARSHALL ISLANDS','MH');
INSERT INTO state(description,stateCode) VALUES('MARYLAND','MD');
INSERT INTO state(description,stateCode) VALUES('MASSACHUSETTS','MA');
INSERT INTO state(description,stateCode) VALUES('MICHIGAN','MI');
INSERT INTO state(description,stateCode) VALUES('MINNESOTA','MN');
INSERT INTO state(description,stateCode) VALUES('MISSISSIPPI','MS');
INSERT INTO state(description,stateCode) VALUES('MISSOURI','MO');
INSERT INTO state(description,stateCode) VALUES('MONTANA','MT');
INSERT INTO state(description,stateCode) VALUES('NEBRASKA','NE');
INSERT INTO state(description,stateCode) VALUES('NEVADA','NV');
INSERT INTO state(description,stateCode) VALUES('NEW HAMPSHIRE','NH');
INSERT INTO state(description,stateCode) VALUES('NEW JERSEY','NJ');
INSERT INTO state(description,stateCode) VALUES('NEW MEXICO','NM');
INSERT INTO state(description,stateCode) VALUES('NEW YORK','NY');
INSERT INTO state(description,stateCode) VALUES('NORTH CAROLINA','NC');
INSERT INTO state(description,stateCode) VALUES('NORTH DAKOTA','ND');
INSERT INTO state(description,stateCode) VALUES('NORTHERN MARIANA ISLANDS','MP');
INSERT INTO state(description,stateCode) VALUES('OHIO','OH');
INSERT INTO state(description,stateCode) VALUES('OKLAHOMA','OK');
INSERT INTO state(description,stateCode) VALUES('OREGON','OR');
INSERT INTO state(description,stateCode) VALUES('PALAU','PW');
INSERT INTO state(description,stateCode) VALUES('PENNSYLVANIA','PA');
INSERT INTO state(description,stateCode) VALUES('PUERTO RICO','PR');
INSERT INTO state(description,stateCode) VALUES('RHODE ISLAND','RI');
INSERT INTO state(description,stateCode) VALUES('SOUTH CAROLINA','SC');
INSERT INTO state(description,stateCode) VALUES('SOUTH DAKOTA','SD');
INSERT INTO state(description,stateCode) VALUES('TENNESSEE','TN');
INSERT INTO state(description,stateCode) VALUES('TEXAS','TX');
INSERT INTO state(description,stateCode) VALUES('UTAH','UT');
INSERT INTO state(description,stateCode) VALUES('VERMONT','VT');
INSERT INTO state(description,stateCode) VALUES('VIRGIN ISLANDS','VI');
INSERT INTO state(description,stateCode) VALUES('VIRGINIA','VA');
INSERT INTO state(description,stateCode) VALUES('WASHINGTON','WA');
INSERT INTO state(description,stateCode) VALUES('WEST VIRGINIA','WV');
INSERT INTO state(description,stateCode) VALUES('WISCONSIN','WI');
INSERT INTO state(description, stateCode) VALUES('WYOMING','WY');

INSERT INTO quarter VALUES('20171', 'NY', 19.00,40);
INSERT INTO quarter VALUES('20173', 'CA', 19.50,30);
INSERT INTO quarter VALUES('20181', 'NY', 20.00,30);
INSERT INTO quarter VALUES('20183', 'MA', 20.75,40);
INSERT INTO quarter VALUES('20184', 'NY', 21.50,40);

INSERT INTO employer VALUES('Acme Information Source', 'Customer Support', '132 Commerical Way', 'Cleveland','OH',44234);
INSERT INTO employer VALUES('Ajax Software, Inc.', 'RandD', '2421 West Industrial Way', 'Berkeley','CA',94710);
INSERT INTO employer VALUES('Ajax Software, Inc.', 'Production', '2421 West Industrial Way', 'Berkeley','CA',94710);
INSERT INTO employer VALUES('Bay Software Inc.', 'Production', '4223 Halster Way', 'Berkeley','CA',94710);
INSERT INTO employer VALUES('Bay Software Inc.', 'RandD', '4223 Halster Way', 'Berkeley','CA',94710);
INSERT INTO employer VALUES('Braddock Information Assoc.', 'Payroll', '1 Washington Complex','Boston','MA',02101); 
INSERT INTO employer VALUES('Yankee Software', 'Development', '1 Braddock Circle','Kenmore','NY',14223);
INSERT INTO employer VALUES('Yankee Software', 'RandD', '1 Braddock Circle','Kenmore','NY',14223);
INSERT INTO employer VALUES('Yankee Software', 'Management', '1 Braddock Circle','Kenmore','NY',14223);
INSERT INTO employer VALUES('Buffalo Software Assoc.','Payroll','45511 Delaware Ave.','Buffalo','NY',14221);
INSERT INTO employer VALUES('Cameron Industries', 'Management', '3112 West Helm Street', 'Kingwood','TX',77339);
INSERT INTO employer VALUES('Cameron Industries', 'Customer Support', '3112 West Helm Street', 'Kingwood','TX',77339);
INSERT INTO employer VALUES('CCC Software', 'Production', '41 Golem Terrace', 'New York', 'NY',10012);
INSERT INTO employer VALUES('DC Security Applications','RandD','1602 Jackson Ave.','Arlington','VA',22202);
INSERT INTO employer VALUES('Davis-Klein Software', 'RandD', '8871 West Grange Drive', 'Cairo', 'NY',12413);
INSERT INTO employer VALUES('Jersey Computer Services','Customer Support','44 WhiteStallion Pike','Lindenwold','NJ',08021);
INSERT INTO employer VALUES('Flordia Software Designs', 'Development', '45A Sturgeon Dr., Bldg. 5', 'Ft. Pierce', 'FL',34951);
INSERT INTO employer VALUES('Flordia Software Designs', 'RandD', '45A Sturgeon Dr., Bldg. 5', 'Ft. Pierce', 'FL',34951);
INSERT INTO employer VALUES('Focused Applications, Inc.','Production','776 West Ninth St.','Myrtle Beach','SC', 29579);
INSERT INTO employer VALUES('Georgia Software Design','RandD','6665 Peachtree Lane','Atlanta','GA',30328);
INSERT INTO employer VALUES('ApplDesign','RandD','3 Mapleview Drive','Huntsville','AL',35803);
INSERT INTO employer VALUES('Long Island Apps, Inc.','Development','67 Merrifield Ave.','Oceanside','NY',11572);
INSERT INTO employer VALUES('Manhattan-Made Software','Customer Support','35 West 9th St.','New York','NY',10012);
INSERT INTO employer VALUES('Manhattan-Made Software','Payroll','35 West 9th St.','New York','NY',10012);
INSERT INTO employer VALUES('Michigan Application Design','Development','5531 E. Lansing Ave.','Ypsilanti','MI',48197);
INSERT INTO employer VALUES('Midtown Software Development','Customer Support','7554 West 9th St.','New York','NY',10003);
INSERT INTO employer VALUES('Mountainside Magic Software','Customer Support','4 Rocky Way','Colorado Springs','CO',80941);
INSERT INTO employer VALUES('Mountainside Magic Software','Management','4 Rocky Way','Colorado Springs','CO',80941);
INSERT INTO employer VALUES('Nantucket Applications, Inc.','RandD','45521 Pilgrim Circle','Nantucket','MA',02554);
INSERT INTO employer VALUES('PennState Programming, Inc.','Management','3 Carnegie Circle','Pittsburgh','PA',15108);
INSERT INTO employer VALUES('PSWD, Inc.','Management','15 Carnegie Circle','Pittsburgh','PA',15108);
INSERT INTO employer VALUES('Rochester Software Design','Development','16 Broad Street','Rochester','NY',14621);
INSERT INTO employer VALUES('Rochester Application Software','Production','16 Broad Street','Rochester','NY',14621);
INSERT INTO employer VALUES('Sandy Shore Software','Development','5665 MassPike Circle','Waterford','CT',06482);
INSERT INTO employer VALUES('Vegas Programming and Design','Development','3 Desert Trail','Las Vegas','NV',89117);
INSERT INTO employer VALUES('Virginia Software Industries','Production','3 Confederate Ave.','Roanoke','VA',24010);
INSERT INTO employer VALUES('Western New York Applications','RandD','44 Rockman Blvd.','Rochester','NY',14623);

INSERT INTO interview VALUES(01,'2017-06-01','Acme Information Source', 'Customer Support', '20171',20,40,'y','Job Desc');
INSERT INTO interview VALUES(02,'2017-06-01','Braddock Information Assoc.', 'Payroll', '20171',18.75,40,'n','Job Desc');
INSERT INTO interview VALUES(03,'2017-06-30','Ajax Software, Inc.', 'Production', '20171',19,40,'y','Job Desc');
INSERT INTO interview VALUES(04,'2017-06-30','Ajax Software, Inc.', 'RandD', '20171',19.5,40,'y','Job Desc');
INSERT INTO interview VALUES(05,'2017-07-01','Bay Software Inc.', 'Production', '20171',19.75,20,'y','Job Desc');
INSERT INTO interview VALUES(06,'2017-08-01','Vegas Programming and Design', 'Development', '20171',19,40,'n','Job Desc');
INSERT INTO interview VALUES(07,'2017-08-01','Mountainside Magic Software', 'Management', '20171',19.5,20,'y','Job Desc');
INSERT INTO interview VALUES(08,'2017-08-02','Mountainside Magic Software', 'Customer Support', '20171',18.75,40,'y','Job Desc');
INSERT INTO interview VALUES(09,'2017-12-01','Cameron Industries', 'Management', '20173',21.25,35,'n','Job Desc');
INSERT INTO interview VALUES(10,'2017-12-02','Cameron Industries', 'Customer Support', '20173',21,35,'n','Job Desc');
INSERT INTO interview VALUES(11,'2017-12-04','CCC Software', 'Production', '20173',19.5,40,'n','Job Desc');
INSERT INTO interview VALUES(12,'2018-01-21','DC Security Applications', 'RandD', '20173',19.5,30,'n','Job Desc');
INSERT INTO interview VALUES(13,'2018-02-01','Davis-Klein Software', 'RandD', '20173',19.25,20,'n','Job Desc');
INSERT INTO interview VALUES(14,'2018-02-02','Flordia Software Designs', 'RandD', '20173',19.75,30,'n','Job Desc');
INSERT INTO interview VALUES(15,'2018-07-01','Rochester Software Design', 'Development', '20181',20,30,'n','Job Desc');
INSERT INTO interview VALUES(16,'2018-07-01','Focused Applications, Inc.', 'Production', '20181',20,30,'y','Job Desc');
INSERT INTO interview VALUES(17,'2018-08-01','Georgia Software Design', 'RandD', '20181',19.75,40,'y','Job Desc');
INSERT INTO interview VALUES(18,'2018-08-08','ApplDesign', 'RandD', '20181',19.5,30,'y','Job Desc');
INSERT INTO interview VALUES(19,'2018-08-11','Long Island Apps, Inc.', 'Development', '20181',20.25,40,'y','Job Desc');
INSERT INTO interview VALUES(20,'2019-01-01','Jersey Computer Services', 'Customer Support', '20183',20.5,35,'n','Job Desc');
INSERT INTO interview VALUES(21,'2019-01-01','Flordia Software Designs', 'Development', '20183',20.75,30,'n','Job Desc');
INSERT INTO interview VALUES(22,'2019-01-31','Manhattan-Made Software', 'Customer Support', '20183',20.5,40,'y','Job Desc');
INSERT INTO interview VALUES(23,'2019-02-01','Manhattan-Made Software', 'Payroll', '20183',21.25,40,'y','Job Desc');
INSERT INTO interview VALUES(24,'2019-03-24','Nantucket Applications, Inc.', 'RandD', '20184',21,40,'y','Job Desc');
INSERT INTO interview VALUES(25,'2019-03-31','PennState Programming, Inc.', 'Management', '20184',21,40,'y','Job Desc');
INSERT INTO interview VALUES(26,'2019-04-20','Sandy Shore Software', 'Development', '20184',20.75,35,'n','Job Desc');
INSERT INTO interview VALUES(27,'2019-04-22','Buffalo Software Assoc.', 'Payroll', '20184',20.75,35,'y','Job Desc');
INSERT INTO interview VALUES(28,'2019-05-01','Virginia Software Industries', 'Production', '20184',21.75,40,'n','Job Desc');
