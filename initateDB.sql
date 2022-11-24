CREATE TABLE contact_person (
 contact_person_id SERIAL NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 relation VARCHAR(50),
 phone_number VARCHAR(12),
 email_address VARCHAR(100)
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (contact_person_id);


CREATE TABLE instrument_stock (
 instrument_stock_id SERIAL NOT NULL,
 total_number_of_instruments INT NOT NULL
);

ALTER TABLE instrument_stock ADD CONSTRAINT PK_instrument_stock PRIMARY KEY (instrument_stock_id);


CREATE TABLE instrument_type (
 instrument_type_id SERIAL NOT NULL,
 instrument_type_name VARCHAR(50)
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instrument_type_id);


CREATE TABLE person (
 person_id SERIAL NOT NULL,
 personal_number UNIQUE  VARCHAR(12) NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 street_name VARCHAR(100) NOT NULL,
 city_name VARCHAR(50) NOT NULL,
 zip_code VARCHAR(5) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE phone_number (
 phone_number  UNIQUE   VARCHAR(12) NOT NULL,
 person_id SERIAL NOT NULL
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (phone_number  UNIQUE  ,person_id);


CREATE TABLE siblings (
 sibling_to_student_id UNIQUE VARCHAR(20) NOT NULL,
 this_student_id UNIQUE VARCHAR(20) NOT NULL
);

ALTER TABLE siblings ADD CONSTRAINT PK_siblings PRIMARY KEY (sibling_to_student_id UNIQUE);


CREATE TABLE skill_binded_with_instrument_type_information (
 skill_information_id SERIAL NOT NULL,
 skill_level ENUM NOT NULL,
 instrument_type_id SERIAL NOT NULL
);

ALTER TABLE skill_binded_with_instrument_type_information ADD CONSTRAINT PK_skill_binded_with_instrument_type_information PRIMARY KEY (skill_information_id);


CREATE TABLE student (
 student_id SERIAL NOT NULL,
 person_id SERIAL NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_contact_person (
 student_id SERIAL NOT NULL,
 contact_person_id SERIAL NOT NULL
);

ALTER TABLE student_contact_person ADD CONSTRAINT PK_student_contact_person PRIMARY KEY (student_id,contact_person_id);


CREATE TABLE student_siblings (
 student_id SERIAL NOT NULL,
 sibling_to_student_id UNIQUE VARCHAR(20) NOT NULL
);

ALTER TABLE student_siblings ADD CONSTRAINT PK_student_siblings PRIMARY KEY (student_id,sibling_to_student_id UNIQUE);


CREATE TABLE student_skill_information (
 student_id SERIAL NOT NULL,
 skill_information_id SERIAL NOT NULL
);

ALTER TABLE student_skill_information ADD CONSTRAINT PK_student_skill_information PRIMARY KEY (student_id,skill_information_id);


CREATE TABLE time_slot (
 time_slot_id SERIAL NOT NULL,
 start_time TIMESTAMP(4) NOT NULL,
 end_time TIMESTAMP(4) NOT NULL,
 date DATE NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (time_slot_id);


CREATE TABLE email_address (
 email_address  UNIQUE   VARCHAR(100) NOT NULL,
 person_id SERIAL NOT NULL
);

ALTER TABLE email_address ADD CONSTRAINT PK_email_address PRIMARY KEY (email_address  UNIQUE  ,person_id);


CREATE TABLE instructor (
 instructor_id SERIAL NOT NULL,
 person_id SERIAL NOT NULL,
 can_teach_ensemble BOOLEAN
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_availability (
 time_slot_id SERIAL NOT NULL,
 instructor_id SERIAL NOT NULL
);

ALTER TABLE instructor_availability ADD CONSTRAINT PK_instructor_availability PRIMARY KEY (time_slot_id,instructor_id);


CREATE TABLE instrument (
 instrument_id SERIAL NOT NULL,
 instrument_type_id SERIAL NOT NULL,
 instrument_stock_id SERIAL NOT NULL,
 brand VARCHAR(50) NOT NULL,
 rental_fee INT NOT NULL,
 is_rented BOOLEAN
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE lesson (
 lesson_id SERIAL NOT NULL,
 level ENUM NOT NULL,
 time_slot_id SERIAL NOT NULL,
 instructor_id SERIAL NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE pricing_scheme (
 pricing_scheme_id SERIAL NOT NULL,
 lesson_id SERIAL,
 price_for_student FLOAT(500) NOT NULL,
 payroll_for_instructor FLOAT(500) NOT NULL,
 discount FLOAT(500)
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (pricing_scheme_id);


CREATE TABLE rental_of_instrument_records (
 rental_id SERIAL NOT NULL,
 student_id SERIAL NOT NULL,
 instrument_id SERIAL NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL
);

ALTER TABLE rental_of_instrument_records ADD CONSTRAINT PK_rental_of_instrument_records PRIMARY KEY (rental_id);


CREATE TABLE set_of_instrument_types (
 instructor_id SERIAL NOT NULL,
 instrument_type_id SERIAL
);

ALTER TABLE set_of_instrument_types ADD CONSTRAINT PK_set_of_instrument_types PRIMARY KEY (instructor_id);


CREATE TABLE student_lesson (
 student_id SERIAL NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE student_lesson ADD CONSTRAINT PK_student_lesson PRIMARY KEY (student_id,lesson_id);


CREATE TABLE ensemble (
 lesson_id SERIAL NOT NULL,
 genre ENUM NOT NULL,
 minimum_number_of_students INT NOT NULL,
 maximum_number_of_students INT NOT NULL,
 number_of_students_that_has_booked INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (lesson_id);


CREATE TABLE group_lesson (
 lesson_id SERIAL NOT NULL,
 minimum_number_of_students INT,
 maximum_number_of_students INT,
 number_of_students_that_has_booked INT,
 instrument_type_id SERIAL NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE individual_lesson (
 lesson_id SERIAL NOT NULL,
 instrument_type_id SERIAL NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);


CREATE TABLE attending_students (
 student_id CHAR(10) NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE attending_students ADD CONSTRAINT PK_attending_students PRIMARY KEY (student_id,lesson_id);


ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE skill_binded_with_instrument_type_information ADD CONSTRAINT FK_skill_binded_with_instrument_type_information_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_1 FOREIGN KEY (contact_person_id) REFERENCES contact_person (contact_person_id);


ALTER TABLE student_siblings ADD CONSTRAINT FK_student_siblings_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_siblings ADD CONSTRAINT FK_student_siblings_1 FOREIGN KEY (sibling_to_student_id UNIQUE) REFERENCES siblings (sibling_to_student_id UNIQUE);


ALTER TABLE student_skill_information ADD CONSTRAINT FK_student_skill_information_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_skill_information ADD CONSTRAINT FK_student_skill_information_1 FOREIGN KEY (skill_information_id) REFERENCES skill_binded_with_instrument_type_information (skill_information_id);


ALTER TABLE email_address ADD CONSTRAINT FK_email_address_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE instructor_availability ADD CONSTRAINT FK_instructor_availability_0 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id);
ALTER TABLE instructor_availability ADD CONSTRAINT FK_instructor_availability_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE instrument ADD CONSTRAINT FK_instrument_1 FOREIGN KEY (instrument_stock_id) REFERENCES instrument_stock (instrument_stock_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE pricing_scheme ADD CONSTRAINT FK_pricing_scheme_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE rental_of_instrument_records ADD CONSTRAINT FK_rental_of_instrument_records_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE rental_of_instrument_records ADD CONSTRAINT FK_rental_of_instrument_records_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE set_of_instrument_types ADD CONSTRAINT FK_set_of_instrument_types_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE set_of_instrument_types ADD CONSTRAINT FK_set_of_instrument_types_1 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);


ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_1 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);


ALTER TABLE attending_students ADD CONSTRAINT FK_attending_students_0 FOREIGN KEY (lesson_id) REFERENCES group_lesson (lesson_id);
ALTER TABLE attending_students ADD CONSTRAINT FK_attending_students_1 FOREIGN KEY (lesson_id) REFERENCES ensemble (lesson_id);



