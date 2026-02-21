---FOREIGN KEYS
ALTER TABLE member
    ADD CONSTRAINT member_membership_id_fk FOREIGN KEY(Membership_id)
    REFERENCES Membership_plan(membership_id);

ALTER TABLE Booking_system
    ADD CONSTRAINT booking_member_fk FOREIGN KEY (member_id )
    REFERENCES member ( member_id );

ALTER TABLE Booking_system
    ADD CONSTRAINT booking_class_fk FOREIGN KEY (class_id )
    REFERENCES fitness_class( class_id );
    
ALTER TABLE Booking_system
    ADD CONSTRAINT booking_session_fk FOREIGN KEY (session_id )
    REFERENCES Personal_Training_session( session_id );


ALTER TABLE Fitness_class
    ADD CONSTRAINT class_staff_fk FOREIGN KEY (staff_id )
    REFERENCES Staff(staff_id );


ALTER TABLE Personal_Training_session
    ADD CONSTRAINT Personal_Training_session_member_id FOREIGN KEY(member_id)
    references Member(member_id);

ALTER TABLE Personal_Training_session
    ADD CONSTRAINT Personal_Training_session_Staff_id FOREIGN KEY(Staff_id)
    references Staff(Staff_id);

ALTER TABLE Workout_plan
    ADD CONSTRAINT Workout_plan_member_id FOREIGN KEY(member_id)
    references Member(member_id);

ALTER TABLE Workout_plan
    ADD CONSTRAINT Workout_plan_trainer_id FOREIGN KEY(trainer_id)
    references Staff(staff_id);

ALTER TABLE Billing
    ADD CONSTRAINT Billing_member_id FOREIGN KEY(member_id)
    references Member(member_id);

ALTER TABLE Billing
    ADD CONSTRAINT Billing_discount_code_id FOREIGN KEY(discount_code_id)
    references Discount_code(discount_code_id);

ALTER TABLE Attendance
    ADD CONSTRAINT Attendance_member_id FOREIGN KEY(member_id)
    references Member(member_id);
