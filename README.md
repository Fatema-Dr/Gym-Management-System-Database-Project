# 🏋️ Gym Management System – Oracle SQL Database Project

## 📌 Project Overview

This project presents the design and implementation of a fully normalized relational database for a **Gym Management System (GMS)** using Oracle SQL and PL/SQL.

The system manages:

* Member registrations & memberships
* Fitness classes & personal training sessions
* Booking system
* Billing & discount management
* Workout plans
* Attendance tracking
* Automated business logic using triggers

The project demonstrates strong database design principles, SQL querying, and PL/SQL trigger implementation.

---

## 👥 Project Type

Academic Group Project – Database Systems Module

My Contributions:

* Schema design and normalization
* SQL query development
* Trigger implementation & testing
* Business rule enforcement
* Revenue analysis queries

---

## 🧱 Database Design

### Key Entities

* MEMBER
* MEMBERSHIP_PLAN
* STAFF
* FITNESS_CLASS
* PERSONAL_TRAINING_SESSION
* BOOKING_SYSTEM
* WORKOUT_PLAN
* BILLING
* DISCOUNT_CODE
* ATTENDANCE

The database was normalized to **Third Normal Form (3NF)** to eliminate redundancy and maintain data integrity.

---

## 🔐 Data Integrity & Constraints

Implemented:

* Primary Keys
* Foreign Keys
* Unique Constraints
* Check Constraints
* Composite business rule validation

Example:

```sql
CHECK ( (class_id IS NULL AND session_id IS NOT NULL)
     OR (class_id IS NOT NULL AND session_id IS NULL) )
```

This ensures a booking is either for a class OR a personal session — never both.

---

## 📊 Analytical SQL Queries

Implemented complex queries including:

✔ Class schedules with instructor names
✔ Members booking yoga classes
✔ Revenue breakdown by service type
✔ Top 5 trainers by sessions conducted
✔ Expired members attending recently
✔ Discount revenue loss analysis
✔ Window functions for attendance tracking

Example (Revenue Analysis):

```sql
SELECT
    TO_CHAR(payment_date, 'Month') AS month_name,
    SUM(CASE WHEN service_description = 'Membership Fee'
             THEN amount_paid ELSE 0 END) AS membership_revenue,
    SUM(amount_paid) AS total_revenue
FROM Billing
GROUP BY TO_CHAR(payment_date, 'Month');
```

---

## ⚙ Business Logic Automation (Triggers)

### 1️⃣ Automatic Membership Expiry

Automatically sets membership to **Inactive** when expired.

### 2️⃣ Class Capacity Enforcement

Prevents overbooking using:

```sql
RAISE_APPLICATION_ERROR(-20001,
'No available spots for the class.');
```

### 3️⃣ Expiry Notification

Automatically notifies members 7 days before expiry.

These demonstrate real-world business rule implementation using PL/SQL.

---

## 🛠 Technologies Used

* Oracle SQL
* PL/SQL
* Oracle Data Modeler
* Oracle APEX
* ERD Design Tools

---

## 🚀 How to Run the Project

1. Run `01_schema.sql`
2. Run `02_insert_data.sql`
3. Run `03_foreign_keys.sql`
4. Run `business_logic_triggers.sql`
5. Execute `analytical_queries.sql`

---

## 📈 Skills Demonstrated

* Relational Database Design
* Normalization (1NF → 3NF)
* DDL & DML
* Advanced SQL Queries
* Window Functions
* PL/SQL Triggers
* Constraint Management
* Business Rule Enforcement
* Revenue & Attendance Analytics

---


