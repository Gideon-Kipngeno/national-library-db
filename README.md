#  NationalLibrary Database

_Final Project – Week 8 Assignment for PLP Academy: Database Design & SQL_

This project is a fully-featured relational database system designed to manage core operations of a national library. It was built as part of the **Database Design & Programming with SQL** module at **PLP Academy**.

---

##  Overview

The `NationalLibrary` database models a real-world library system, supporting:

- Member registration
- Staff management
- Book and digital media inventory
- Borrowing, fines, and reservations
- Library-hosted events and registrations

It demonstrates:
-  Clean schema design
-  Proper use of constraints and relationships
-  Realistic data population
-  Production-ready SQL scripting

---

##  Schema Design

The database consists of both **reference** and **core** tables.

###  Reference Tables
- `MembershipTypes` — Library membership categories  
- `StaffRoles` — Staff job roles  
- `MediaFormats` — Digital media formats (e.g. PDF, MP4)  
- `ReservationStatuses` — Statuses for reservations (Pending, Fulfilled, etc.)

###  Core Tables
- `Members` — Library users
- `Staff` — Library employees
- `Books` — Physical book records
- `DigitalMedia` — Online content (eBooks, videos)
- `Archives` — Archived records
- `BorrowRecords` — Book borrowing transactions
- `Fines` — Fines for overdue returns
- `Reservations` — Book reservation tracking
- `Events` — Events hosted by the library
- `EventRegistrations` — Member sign-ups for events

 All tables include `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, and `UNIQUE` constraints.  
 Indexes are applied on key columns for optimized query performance.

---

##  ER Diagram

A complete **entity-relationship diagram (ERD)** for the `NationalLibrary` database is available on dbdiagram.io:

[**View ER Diagram on dbdiagram.io**](https://dbdiagram.io/d/NationalLibrary-ER-68cf21df960f6d821a0d1841)  
*(Interactive layout with all tables, attributes, and foreign key relationships)*

---

##  Data Population

Each table is populated with **at least 10 valid records**, ensuring relational integrity and realistic test scenarios.

### Example Insert:
```sql
INSERT INTO MembershipTypes (type_name) VALUES
('Regular'), ('Premium'), ('Student'), ('Senior'), ('Staff'),
('Family'), ('VIP'), ('Corporate'), ('Guest'), ('Library Assistant');
```
---

## Setup Instructions: 

1. Clone this repository:

```bash
git clone https://github.com/Gideon-Kipngeno/national-library-db.git
```
2. Run the Schema Script

In your MySQL client or CLI:

```bash
national_library_schema.sql;
```
3. Run the data population script to Populate Sample Data:

```bash
Insert_data.sql;
```
4. Run to Verify with sample queries.

 Execute queries
```bash
 sample_queries.sql;
 ```
 
Sample Queries

Below are a few sample queries included in the project:
```bash
-- List all overdue borrow records
SELECT * FROM BorrowRecords
WHERE due_date < CURDATE() AND return_date IS NULL;

-- Count members by membership type
SELECT MT.type_name, COUNT(M.member_id) AS total_members
FROM Members M
JOIN MembershipTypes MT ON M.type_id = MT.type_id
GROUP BY MT.type_name;

-- Find events hosted by 'Alice Williams'
SELECT E.title, E.event_date
FROM Events E
JOIN Staff S ON E.hosted_by = S.staff_id
WHERE S.name = 'Alice Williams';

```
---

## _Author_

Gideon Kipngeno

Software Development Cohort VIII

PLP Academy — July-September 2025

## ***Acknowledgments***

Special thanks to PLP Academy instructors and peers for their guidance and support throughout the course.