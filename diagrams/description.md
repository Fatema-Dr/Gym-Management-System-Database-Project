# Database Design Documentation

## 📌 Overview

This folder contains the Entity Relationship Diagrams (ERDs) developed for the Gym Management System database.

Two design perspectives are included:

1. Logical ERD – Conceptual data model representation
2. Relational ERD – Physical implementation schema

These diagrams illustrate the system architecture, entity relationships, constraints, and normalization structure.

---

## 🧠 1️⃣ Logical ERD

File: `logical_erd.png`

The Logical ERD represents the high-level conceptual data model before implementation.

### Purpose:

* Identify core business entities
* Define relationships between entities
* Ensure correct cardinality (1:M, M:N)
* Support normalization process (up to 3NF)

### Core Entities Identified:

* Member
* Membership_Plan
* Staff
* Fitness_Class
* Personal_Training_Session
* Booking_System
* Workout_Plan
* Billing
* Discount_Code
* Attendance

### Key Relationships:

* A Member subscribes to one Membership Plan.
* A Member can book multiple Fitness Classes or Personal Training Sessions.
* A Fitness Class is conducted by one Staff member.
* A Personal Training Session links a Member and a Staff member.
* A Booking must relate to either a Class OR a Session (business rule enforced later with constraints).
* Billing may optionally include a Discount Code.
* Attendance records member check-in and check-out timestamps.

The logical model ensured elimination of redundancy and supported normalization to Third Normal Form (3NF).

---

## 🏗 2️⃣ Relational ERD

File: `relational_erd.png`

The Relational ERD represents the physical database schema implemented in Oracle SQL.

### Key Features:

✔ Primary Keys defined for all tables
✔ Foreign Key constraints enforcing referential integrity
✔ Data types assigned (VARCHAR2, NUMBER, DATE, TIMESTAMP)
✔ Business rule constraints
✔ Composite validation rules

### Important Constraint Example:

Booking system constraint ensures:

* A booking references either `class_id` OR `session_id`
* Both cannot be NULL
* Both cannot be filled simultaneously

This prevents invalid booking records and enforces real-world logic at database level.

---

## 🔎 Normalization

The schema was normalized to Third Normal Form (3NF):

* 1NF: Atomic values, no repeating groups
* 2NF: No partial dependency on composite keys
* 3NF: No transitive dependencies

This ensures:

* Reduced redundancy
* Improved data integrity
* Efficient updates
* Consistent relationships

---

## ⚙ Design Considerations

During schema design, the following were prioritised:

* Clear separation of transactional data (Billing, Attendance, Booking)
* Separation of static reference data (Membership_Plan, Discount_Code)
* Strong referential integrity
* Scalability for future enhancements
* Support for trigger-based business logic automation

---

## 📌 Conclusion

The ERDs form the foundation of the Gym Management System database.

The logical model ensured conceptual clarity, while the relational model implemented enforceable business rules and structural integrity within Oracle SQL.

This design demonstrates strong understanding of:

* Relational database theory
* Normalization principles
* Entity modelling
* Referential integrity
* Real-world schema implementation

---



