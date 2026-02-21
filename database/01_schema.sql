CREATE TABLE Member(
    Member_id         VARCHAR2(10) NOT NULL,
    Membership_id    VARCHAR2(10)  NOT NULL,
    Fname             VARCHAR2(25) NOT NULL,
    lname             VARCHAR2(25) NOT NULL,
    date_of_birth     DATE NOT NULL,
    gender            VARCHAR2(10) NOT NULL,
    address           VARCHAR2(30),
    phone_number      VARCHAR2(15) NOT NULL,
    email             VARCHAR2(50)  NOT NULL,
    emergency_contact VARCHAR2(15),
    plan_start_date   DATE NOT NULL,
    plan_status       VARCHAR2(10) NOT NULL,
    PRIMARY KEY(MEMBER_ID),
    CONSTRAINT chk_gender CHECK (UPPER(gender) IN ('MALE', 'FEMALE', 'OTHER'))
);

CREATE TABLE Staff(
    staff_id       VARCHAR2(10)  NOT NULL,
    Fname           VARCHAR2(25)  NOT NULL,
    Lname           VARCHAR2(25)  NOT NULL,
    phone_number   VARCHAR2(15)  NOT NULL,
    email          VARCHAR2(50) NOT NULL,
    position       VARCHAR2(20) NOT NULL,
    salary         NUMBER(8,2) NOT NULL,
    specialization VARCHAR2(50),
    PRIMARY KEY(STAFF_ID),
    CONSTRAINT chk_staff_position CHECK (upper(position) IN ('ADMIN','SUPPORT STAFF', 'FITNESS INSTRUCTOR', 'PERSONAL TRAINER', 'NUTRITIONIST'))
);

CREATE TABLE Booking_System(
    booking_id       VARCHAR2(10) NOT NULL,
    member_id        VARCHAR2(10) NOT NULL,
    class_id       VARCHAR2(10) NULL,
    session_id       VARCHAR2(10) NULL,
    activity_name     VARCHAR2(20) NOT NULL,
    booking_date      DATE NOT NULL,
    booking_status   VARCHAR2(20) NOT NULL,
    CHECK ( (class_id IS NULL AND session_id IS NOT NULL) OR (class_id IS NOT NULL AND session_id IS NULL) ),
    CONSTRAINT chk_booking_status CHECK (UPPER(booking_status) IN ('CONFIRMED', 'CANCELLED') ),
    PRIMARY KEY(booking_id)
);

CREATE TABLE Fitness_class(
    class_id       VARCHAR2(10) NOT NULL,
    staff_id       VARCHAR2(10) NOT NULL,
    class_name      VARCHAR2(20) NOT NULL,
    class_type      VARCHAR2(20) NOT NULL,
    class_time      TIMESTAMP NOT NULL,
    duration        VARCHAR2(30) NOT NULL,
    max_capacity    number(3,0) NOT NULL,
    class_status    VARCHAR2(20) NOT NULL,
    PRIMARY KEY(Class_id)
);

CREATE TABLE Personal_Training_session (
    session_id       VARCHAR2(10) NOT NULL,
    session_date     DATE NOT NULL,
    start_time       TIMESTAMP NOT NULL,
    duration        VARCHAR2(30) NOT NULL,
    staff_id         VARCHAR2(10) NOT NULL,
    member_id        VARCHAR2(10) NOT NULL,
    session_status    VARCHAR2(15)  NOT NULL,
    PRIMARY KEY(SESSION_ID)
);

CREATE TABLE Workout_plan(
    workout_plan_id           VARCHAR2(10) NOT NULL,
    member_id                 VARCHAR2(10)  NOT NULL,
    trainer_id                VARCHAR2(10)  NOT NULL,
    focus_area                VARCHAR2(30)  NOT NULL,
    goal                      VARCHAR2(30)  NOT NULL,
    exercise_details          VARCHAR2(250),
    plan_status               VARCHAR2(10)  NOT NULL,
    progress_notes            VARCHAR2(250),
    primary key(workout_plan_id)
);


CREATE TABLE Membership_plan(
    membership_id              VARCHAR2(10)  NOT NULL,
    plan_name                  VARCHAR2(20) NOT NULL,
    duration_IN_MONTHS        NUMBER(2)  NOT NULL,
    amount                    NUMBER(10,2) NOT NULL,
    PRIMARY KEY(MEMBERSHIP_ID),
    CONSTRAINT uq_plan_name UNIQUE (plan_name)
 );

CREATE TABLE Discount_Code(
    Discount_Code_ID            VARCHAR2(10) NOT NULL,
    Discount_Name                 VARCHAR2(30),
    Discount_Percentage         NUMBER(5,2) NOT NULL,
    Expiry_Date                 DATE NOT NULL,
    Usage_Count                 NUMBER(5),
    primary key (Discount_Code_ID),
    CONSTRAINT uq_Discount_Name UNIQUE (Discount_Name)
);

CREATE TABLE Billing(
    billing_id       VARCHAR2(10) NOT NULL,
    member_id        VARCHAR2(10) NOT NULL,
    Discount_Code_ID       VARCHAR2(10) NULL,
    service_description     VARCHAR2(30) NOT NULL,
    total_amount         NUMBER(10,2) NOT NULL,
    amount_paid      NUMBER(10,2) NOT NULL,
    payment_date     DATE NOT NULL,
    payment_method   VARCHAR2(20) NOT NULL,
    PRIMARY KEY(billing_ID),
    CONSTRAINT chk_service_description CHECK (UPPER(service_description) IN ('MEMBERSHIP FEE', 'TRAINING SESSION','CLASS' ))
);

CREATE TABLE Attendance(
    attendance_id        VARCHAR2(10) NOT NULL,
    member_id            VARCHAR2(10) NOT NULL,
    check_in             TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
    check_out            TIMESTAMP WITH LOCAL TIME ZONE,
    PRIMARY KEY(attendance_id)
);
