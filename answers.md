# ISTE-230 Final Exam Review

### Q1: *Relational Algebra* is a procedural data manipulation language that uses operators that work on relatons. 

### Q2: Relation A has 5 attributes and 10 tuples, relation B as 10A and 5T. A PRODUCT is executed between A and B, followed by a projection over 3 attributes. 

#### Results: 50 Tuples, 3 Attributes

### Q3: In order for two SWQL queries to be union compatible, they must 

#### Answer: both output compatible data types for each column, return the same number of columns, and the order of the columns match up

### Q4: Which relational operator does *not* require the relations to be union compatible? 

- Union
- Difference
- **product**
- Intersection

### Q5: Projection is *not* anoperation that selects specified rows from a relation. It is for attributes. 

### Q6: Given two relations, A and B, A LEFT OUTER JOIN (A.id=B.id) returns:

#### Answer: All rows in A, matching rows in B

### Q7: In relational algebra, A upside down U B is *Intersection*

### Q8: Relational algebra, AuB is *Union*

### Q9: Relational algebra, A-B =? B-A

#### False

### Q10: Cartesian product of A with 10 tuples and B with 20 tuples will contain *200* tuples. 

### Q11: Relational algebra SELECTION is performed within which clause of Select?

#### Answer: SELECT

### Q12: Relational algebra PROJECTION is performed within which clause of Select?

#### Answer: WHERE

### Q13-15: Relational algebra statements on a table, see photos

### Q16-18: Relational algebra on tables, see photos

### Q19: SQL Select *will* always conform to properties of relation

### Q20: ?? Answer: Join

### Q21: Union of two relations returns *all tuples found in either relation without dupliactes*

### Q22: ??

## Supertypes/Subtypes

### Q23: A Member of a subtype does *not* have to be a member of the supertype

### Q24: Defining subtypes and forming relationships is called *specialization*

### Q25: ?? A: Partial specialization rule

### Q26: Transposition, see photo

### Q27-36: See photo, questions on ER diagram

### Q28: Doubles lines going our of CARD_ACCOUNT and into subtype circle means that: 

#### Answer: Instance of CARD_ACCOUNT *must* belong to a subtype

### Q30: Customer identity *is* strong

### Q31: List all subtype entities:

- DEBIT_CARD
- CREDIT_CARD

### Q32: List all supertype entities:

- CARD_ACCOUNT

### Q33: List all associative entities: 

- CHARGE

### Q34: Card account MUST be either debit or credit

### Q35: Card account can *NOT* be both a debit and credit card

### Q36: Degree of 'bills' relationship: 2

### Q37: What type is 'has' relationship? 1:N (N:1)

### Q38: ???

## SQL

### Q39: *HAVING* finds all groups meeting stated conditions

### Q40: The HAVING clause can restrict rows absed on the value of aggregate functions

### Q41: ? A: Percent (%)

### Q42: When performing a JOIN it is important that *both tables contain some "common" columns from the same physical and logical domain*


### Q43: Referential integrity

## Transactions

### Q44: ??

### Q45: ACID acronym

- Atomicity: All or nothing changes
- Consistency: Statements must leave database in consistent state, no data constraint violations
- Isolation: In-process transaction will not be impacted by other users. Changes made will not be seen by others until transaction is resolved. 
- Durability: Once transaction is committed, changes are permanent. 

## Exam

- ~8 tasks to do on Practical
- 