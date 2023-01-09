CREATE TYPE ensemble_genre AS ENUM ('Rock', 'Punk','Gospel');

-- Address
--DROP TABLE IF EXISTS address CASCADE;
CREATE TABLE address (
address_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
street_name VARCHAR(100) NOT NULL,
city_name VARCHAR(50) NOT NULL,
zip_code VARCHAR(5) NOT NULL
);

ALTER TABLE address ADD CONSTRAINT PK_address PRIMARY KEY (address_id);

-- Contact details
--DROP TABLE IF EXISTS contact_details CASCADE;
CREATE TABLE contact_details (
 contact_details_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 address_id INT
);

ALTER TABLE contact_details ADD CONSTRAINT PK_contact_details PRIMARY KEY (contact_details_id);

-- Contact person
--DROP TABLE IF EXISTS contact_person CASCADE;
CREATE TABLE contact_person (
 contact_person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 name VARCHAR(100) NOT NULL,
 relation_to_student VARCHAR(50),
 contact_details_id INT NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (contact_person_id);

-- Email
--DROP TABLE IF EXISTS email CASCADE;
CREATE TABLE email (
 email_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email VARCHAR(100) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email_id);
ALTER TABLE email ADD CONSTRAINT UNIQUE_email UNIQUE (email);


-- Instrument type
--DROP TABLE IF EXISTS instrument_type CASCADE;
CREATE TABLE instrument_type (
 instrument_type_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type_name VARCHAR(50) NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instrument_type_id);
ALTER TABLE instrument_type ADD CONSTRAINT UNIQUE_instrument_type_name UNIQUE (instrument_type_name);

-- Person
--DROP TABLE IF EXISTS person CASCADE;
CREATE TABLE person (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 personal_number VARCHAR(12) NOT NULL,
 name VARCHAR(100) NOT NULL,
 contact_details_id INT NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);
ALTER TABLE person ADD CONSTRAINT UNIQUE_personal_number UNIQUE (personal_number);

-- Phone
--DROP TABLE IF EXISTS phone CASCADE;
CREATE TABLE phone (
 phone_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_number VARCHAR(10) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (phone_id);
ALTER TABLE phone ADD CONSTRAINT UNIQUE_phone_number UNIQUE (phone_number);

-- Sibling discount
--DROP TABLE IF EXISTS sibling_discount CASCADE;
CREATE TABLE sibling_discount (
 sibling_discount_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 discount_percentage INT NOT NULL
);

ALTER TABLE sibling_discount ADD CONSTRAINT PK_sibling_discount PRIMARY KEY (sibling_discount_id);

-- Skill level
--DROP TABLE IF EXISTS skill_level CASCADE;
CREATE TABLE skill_level (
 skill_level_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_value VARCHAR(50) NOT NULL
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (skill_level_id);
ALTER TABLE skill_level ADD CONSTRAINT UNIQUE_skill_value UNIQUE (skill_value);

-- Student
--DROP TABLE IF EXISTS student CASCADE;
CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 contact_person_id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);

-- Student instrument skill level
--DROP TABLE IF EXISTS student_instrument_skill_level CASCADE;
CREATE TABLE student_instrument_skill_level (
 instrument_type_id INT NOT NULL,
 skill_level_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_instrument_skill_level ADD CONSTRAINT PK_student_instrument_skill_level PRIMARY KEY (instrument_type_id,skill_level_id,student_id);

-- Time slot
--DROP TABLE IF EXISTS time_slot CASCADE;
CREATE TABLE time_slot (
 time_slot_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_time TIMESTAMP(6) NOT NULL,
 end_time TIMESTAMP(6) NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (time_slot_id);

-- Contact details email cross reference table
--DROP TABLE IF EXISTS contact_details_email CASCADE;
CREATE TABLE contact_details_email (
 contact_details_id INT NOT NULL,
 email_id INT NOT NULL
);

ALTER TABLE contact_details_email ADD CONSTRAINT PK_contact_details_email PRIMARY KEY (contact_details_id,email_id);

-- Contact details phone cross reference table
--DROP TABLE IF EXISTS contact_details_phone CASCADE;
CREATE TABLE contact_details_phone (
 contact_details_id INT NOT NULL,
 phone_id INT NOT NULL
);

ALTER TABLE contact_details_phone ADD CONSTRAINT PK_contact_details_phone PRIMARY KEY (contact_details_id,phone_id);

-- Instructor
--DROP TABLE IF EXISTS instructor CASCADE;
CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 can_teach_ensemble BIT(1),
 person_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);

-- Instructor availabilty
--DROP TABLE IF EXISTS instructor_availability CASCADE;
CREATE TABLE instructor_availability (
 time_slot_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_availability ADD CONSTRAINT PK_instructor_availability PRIMARY KEY (time_slot_id,instructor_id);

-- Instructor instrument type cross reference table
--DROP TABLE IF EXISTS instructor_instrument_type CASCADE;
CREATE TABLE instructor_instrument_type (
 instrument_type_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_instrument_type ADD CONSTRAINT PK_instructor_instrument_type PRIMARY KEY (instrument_type_id,instructor_id);

-- Instrument
--DROP TABLE IF EXISTS instrument CASCADE;
CREATE TABLE instrument (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type_id INT NOT NULL,
 brand VARCHAR(50) NOT NULL,
 rental_fee INT NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);

-- Pricing scheme
--DROP TABLE IF EXISTS pricing_scheme CASCADE;
CREATE TABLE pricing_scheme (
 pricing_scheme_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level_id INT,
 lesson_type VARCHAR(100) NOT NULL,
 student_price INT NOT NULL,
 instructor_payment INT NOT NULL

);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (pricing_scheme_id);

-- Rental of instruments records
--DROP TABLE IF EXISTS rental_of_instrument_records CASCADE;
CREATE TABLE rental_of_instrument_records (
 rental_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT NOT NULL,
 student_id INT NOT NULL
 start_time TIMESTAMP(6) NOT NULL,
 end_time TIMESTAMP(6) NOT NULL,
);

ALTER TABLE rental_of_instrument_records ADD CONSTRAINT PK_rental_of_instrument_records PRIMARY KEY (rental_id);

-- Siblings
--DROP TABLE IF EXISTS siblings CASCADE;
CREATE TABLE siblings (
 student_id INT NOT NULL,
 sibling_student_id INT NOT NULL
);

ALTER TABLE siblings ADD CONSTRAINT PK_siblings PRIMARY KEY (student_id,sibling_student_id);

-- Ensemble
--DROP TABLE IF EXISTS ensemble CASCADE;
CREATE TABLE ensemble (
 ensemble_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 time_slot_id INT NOT NULL,
 instructor_id INT NOT NULL,
 genre ensemble_genre,
 minimum_number_of_students INT,
 maximum_number_of_students INT
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (ensemble_id);

-- Group lesson
--DROP TABLE IF EXISTS group_lesson CASCADE;
CREATE TABLE group_lesson (
 group_lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 time_slot_id INT NOT NULL,
 instructor_id INT NOT NULL,
 skill_level_id INT NOT NULL,
 instrument_type_id INT NOT NULL,
 minimum_number_of_students INT,
 maximum_number_of_students INT
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);

-- Individual lesson
--DROP TABLE IF EXISTS individual_lesson CASCADE;
CREATE TABLE individual_lesson (
 individual_lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 time_slot_id INT NOT NULL,
 instructor_id INT NOT NULL,
 skill_level_id INT NOT NULL,
 instrument_type_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_lesson_id);

-- Student_ensemble cross reference table
--DROP TABLE IF EXISTS student_ensemble CASCADE;
CREATE TABLE student_ensemble (
 student_id INT NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE student_ensemble ADD CONSTRAINT PK_student_ensemble PRIMARY KEY (student_id,ensemble_id);

-- Student group lesson cross reference table
--DROP TABLE IF EXISTS student_group_lesson CASCADE;
CREATE TABLE student_group_lesson (
 student_id INT NOT NULL,
 group_lesson_id INT NOT NULL
);

ALTER TABLE student_group_lesson ADD CONSTRAINT PK_student_group_lesson PRIMARY KEY (student_id,group_lesson_id);

-- Student individual lesson cross reference table
--DROP TABLE IF EXISTS student_individual_lesson CASCADE;
CREATE TABLE student_individual_lesson (
 student_id INT NOT NULL,
 individual_lesson_id INT NOT NULL
);

ALTER TABLE student_individual_lesson ADD CONSTRAINT PK_student_individual_lesson PRIMARY KEY (student_id,individual_lesson_id);


-- Foreign keys
ALTER TABLE contact_details ADD CONSTRAINT FK_contact_details_0 FOREIGN KEY (address_id) REFERENCES address (address_id);
ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (contact_details_id) REFERENCES contact_details (contact_details_id);

ALTER TABLE person ADD CONSTRAINT FK_person_0 FOREIGN KEY (contact_details_id) REFERENCES contact_details (contact_details_id);

ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (contact_person_id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (person_id) REFERENCES person (person_id);

ALTER TABLE student_instrument_skill_level ADD CONSTRAINT FK_student_instrument_skill_level_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE student_instrument_skill_level ADD CONSTRAINT FK_student_instrument_skill_level_1 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id);
ALTER TABLE student_instrument_skill_level ADD CONSTRAINT FK_student_instrument_skill_level_2 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;

ALTER TABLE contact_details_email ADD CONSTRAINT FK_contact_details_email_0 FOREIGN KEY (contact_details_id) REFERENCES contact_details (contact_details_id) ON DELETE CASCADE;
ALTER TABLE contact_details_email ADD CONSTRAINT FK_contact_details_email_1 FOREIGN KEY (email_id) REFERENCES email (email_id);

ALTER TABLE contact_details_phone ADD CONSTRAINT FK_contact_details_phone_0 FOREIGN KEY (contact_details_id) REFERENCES contact_details (contact_details_id) ON DELETE CASCADE;
ALTER TABLE contact_details_phone ADD CONSTRAINT FK_contact_details_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (phone_id);

ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (person_id);

ALTER TABLE instructor_availability ADD CONSTRAINT FK_instructor_availability_0 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id);
ALTER TABLE instructor_availability ADD CONSTRAINT FK_instructor_availability_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;

ALTER TABLE instructor_instrument_type ADD CONSTRAINT FK_instructor_instrument_type_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id) ON DELETE CASCADE;
ALTER TABLE instructor_instrument_type ADD CONSTRAINT FK_instructor_instrument_type_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;

ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);

ALTER TABLE pricing_scheme ADD CONSTRAINT FK_pricing_scheme_0 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id) ON DELETE CASCADE;

ALTER TABLE rental_of_instrument_records ADD CONSTRAINT FK_rental_of_instrument_records_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE rental_of_instrument_records ADD CONSTRAINT FK_rental_of_instrument_records_1 FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE siblings ADD CONSTRAINT FK_siblings_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE siblings ADD CONSTRAINT FK_siblings_1 FOREIGN KEY (sibling_student_id) REFERENCES student (student_id) ON DELETE CASCADE;

ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);

ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_3 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id);

ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (instrument_type_id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_3 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id);

ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id) ON DELETE CASCADE;

ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id) ON DELETE CASCADE;

ALTER TABLE student_individual_lesson ADD CONSTRAINT FK_student_individual_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE student_individual_lesson ADD CONSTRAINT FK_student_individual_lesson_1 FOREIGN KEY (individual_lesson_id) REFERENCES individual_lesson (individual_lesson_id) ON DELETE CASCADE;

