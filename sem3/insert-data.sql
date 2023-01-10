--TEST
--14 persons
-- 10 students (1 - 3 siblings, 2 - 2 siblings)
-- 4 teachers, (3 can teach ensemble)

TRUNCATE addresses,contact_details,contact_person,email,instrument_type,person,phone,sibling_discount,skill_level,
         student, student_instrument_skill_level, time_slot,contact_details_email, contact_details_phone, instructor, instructor_availability, 
         instructor_instrument_type, instrument, pricing_scheme, rental_of_instrument_records, siblings, ensemble, group_lesson, individual_lesson,
         student_ensemble, student_group_lesson, student_individual_lesson RESTART IDENTITY;
-- 14 addresses
INSERT INTO addresses (street_name,city_name,zip_code)
VALUES
  ('Ap #186-2334 Auctor St.','Barranca','45253'),
  ('1564 Neque Street','Minitonas','88131'),
  ('645-2033 Diam. Road','Baguio','24260'),
  ('P.O. Box 777, 3688 Tortor. Rd.','Suncheon','75073'),
  ('Ap #702-5688 At, St.','Bais','08656'),
  ('Ap #115-3802 Luctus. Avenue','Bắc Giang','39638'),
  ('259-902 Lacus. Ave','Ravensburg','14586'),
  ('Ap #839-7010 Enim. St.','Chandannagar','63456'),
  ('2550 Aliquam Rd.','Sierning','96747'),
  ('Ap #992-1041 Interdum Rd.','Kraków','40758'),
  ('Ap #719-4288 Neque. St.','Jeju','22850'),
  ('P.O. Box 883, 7557 Elementum, Road','Mercedes','34132'),
  ('P.O. Box 142, 8426 Nunc Rd.','Värnamo','64509'),
  ('419-4361 Pellentesque Avenue','Máfil','41530');

--- 14 contact_details
INSERT INTO contact_details (addresses_id)
VALUES
  (1),
  (1),
  (2),
  (3),
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10);
-- 10 contact persons
INSERT INTO contact_person (person_name, contact_details_id)
VALUES
  ('Ciara Clarke',1),
  ('Patience Rush',2),
  ('Keiko Mccarthy',3),
  ('Owen Pitts',4),
  ('Rogan Flynn',5),
  ('Katell Patterson',6),
  ('Justina Kim',7),
  ('Molly Booth',8),
  ('Cole Coleman',9),
  ('Macy Kirkland',10);

-- 14 emails
INSERT INTO email (email)
VALUES
  ('velit@yahoo.org'),
  ('est.nunc@google.edu'),
  ('aenean.eget.metus@google.net'),
  ('porttitor.scelerisque.neque@protonmail.org'),
  ('libero.donec@google.edu'),
  ('est@outlook.org'),
  ('ante@outlook.couk'),
  ('nulla.facilisi@google.couk'),
  ('non.luctus@google.net'),
  ('mollis@icloud.edu'),
  ('et.pede@protonmail.edu'),
  ('quis.diam@aol.com'),
  ('curae.donec.tincidunt@protonmail.com'),
  ('porttitor.tellus@aol.com');

-- 4 Instrument types:
INSERT INTO instrument_type (instrument_type_name)
VALUES
  ('drums'),
  ('bass'),
  ('cello'),
  ('guitar');

-- 14 persons
INSERT INTO person (personal_number,name_type,contact_details_id)
VALUES
  ('198143233770','Ira Donovan',1),
  ('199608886066','Fallon Hardy',2),
  ('198613694652','Amir Dorsey',3),
  ('195565263934','Elaine Tate',4),
  ('198913497548','Kaitlin Howard',5),
  ('193838357354','George Hooper',6),
  ('195347656577','Stephanie Davenport',7),
  ('192779833121','Quintessa Church',8),
  ('190372619849','Callum Ramirez',9),
  ('198402674323','Galena Cain',10),
  ('191562684421','Mannix Gibbs',11),
  ('190544051624','Caleb Skinner',12),
  ('194528537727','Kylynn Savage',13),
  ('193927321876','Sydney Wynn',14);

-- 14 phones
INSERT INTO phone (phone_number)
VALUES
  ('070-2475670'),
  ('070-5447268'),
  ('071-4762763'),
  ('071-9595612'),
  ('071-4849652'),
  ('070-4586125'),
  ('076-7360649'),
  ('076-5734336'),
  ('071-6268719'),
  ('076-3067444'),
  ('070-4477187'),
  ('070-7213616'),
  ('071-7711615'),
  ('071-8081222');

INSERT INTO sibling_discount (discount_percentage)
VALUES
  (25);

--- Skill levels:
INSERT INTO skill_level (skill_value)
VALUES
  ('beginner'),
  ('intermediate'),
  ('advanced');

-- 10 students
INSERT INTO student (contact_person_id, person_id)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8),
  (9,9),
  (10,10);

-- 12 student instrument skills
INSERT INTO student_instrument_skill_level (student_id, instrument_type_id, skill_level_id)
VALUES
  (1, 1, 1),
  (1, 4, 1),
  (2, 1, 2),
  (3, 4, 1),
  (4, 3, 3),
  (5, 1, 1),
  (6, 2, 2),
  (7, 3, 2),
  (8, 2, 3),
  (9, 3, 1),
  (10, 2, 2),
  (10, 3, 3);

-- 10 Time slots
INSERT INTO time_slot (start_time, end_time)
VALUES
  ('2023-01-9 8:00:00', '2023-01-9 12:00:00'),
  ('2023-01-9 13:00:00', '2023-01-9 17:00:00'),
  ('2023-01-10 8:00:00', '2023-01-10 12:00:00'),
  ('2023-01-10 13:00:00', '2023-01-10 17:00:00'),
  ('2023-01-11 8:00:00', '2023-01-11 12:00:00'),
  ('2023-01-11 13:00:00', '2023-01-11 17:00:00'),
  ('2023-01-12 8:00:00', '2023-01-12 12:00:00'),
  ('2023-01-12 13:00:00', '2023-01-12 17:00:00'),
  ('2023-02-9 8:00:00', '2023-02-9 12:00:00'),
  ('2023-02-9 13:00:00', '2023-02-9 17:00:00');

-- 14 contact details email:
INSERT INTO contact_details_email (contact_details_id, email_id)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8),
  (9,9),
  (10,10),
  (11,11),
  (12,12),
  (13,13),
  (14,14);

-- 14 contact details phone:
INSERT INTO contact_details_phone (contact_details_id, phone_id)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8),
  (9,9),
  (10,10),
  (11,11),
  (12,12),
  (13,13),
  (14,14);

-- 4 instructors:
INSERT INTO instructor (can_teach_ensemble, person_id)
VALUES
  ('1',11),
  ('1',12),
  ('0',13),
  ('0',14);


INSERT INTO instructor_availability (time_slot_id,instructor_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (1,4),
  (2,2);

INSERT INTO instructor_instrument_type (instrument_type_id, instructor_id)
VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,1),
  (2,2),
  (3,3),
  (4,4);

--12 INSTRUMENTS
INSERT INTO instrument (instrument_type_id, brand, rental_fee)
VALUES
  (1, '#1Drums', 400),
  (1, '#2Drums', 450),
  (1, '#3Drums', 500),
  (2, '#1Bass', 200),
  (2, '#2Bass', 200),
  (2, '#3Bass', 250),
  (3, '#1cello', 350),
  (3, '#2cello', 350),
  (3, '#3cello', 350),
  (4, '#1guitar', 250),
  (4, '#2guitar', 250),
  (4, '#3guitar', 300);

INSERT INTO pricing_scheme (skill_level_id, lesson_type, student_price, instructor_payment)
VALUES
  (1, 'individual lesson', 300, 450),
  (2, 'individual lesson', 300, 450),
  (3, 'individual lesson', 450, 600),
  (1, 'group_lesson', 150, 550),
  (2, 'group_lesson',150, 550),
  (3, 'group_lesson',300, 700),
  (NULL, 'ensemble', 300, 600);

INSERT INTO rental_of_instrument_records (instrument_id, student_id, start_time, end_time)
VALUES
  (1, 1, '2023-01-9 8:00:00', '2023-01-9 12:00:00'),
  (2, 5, '2023-01-9 8:00:00', '2023-01-9 12:00:00');

INSERT INTO siblings (student_id, sibling_student_id)
VALUES
  (1,2),
  (1,5),
  (3,6),
  (4,7);

INSERT INTO ensemble (time_slot_id, instructor_id, genre, minimum_number_of_students, maximum_number_of_students)
VALUES
  (2, 1, 'Rock', 3, 5),
  (3, 2, 'Punk', 3, 5);

INSERT INTO group_lesson (time_slot_id, instructor_id, skill_level_id, instrument_type_id, minimum_number_of_students, maximum_number_of_students)
VALUES
  (2, 3, 1, 2, 3, 10),
  (4, 4, 3, 4, 3, 10);

INSERT INTO individual_lesson (time_slot_id, instructor_id, skill_level_id, instrument_type_id)
VALUES
  (3, 1, 2, 2),
  (9, 2, 1, 2);

INSERT INTO student_ensemble (student_id, ensemble_id)
VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,2),
  (5,2),
  (6,2),
  (7,2);


INSERT INTO student_group_lesson (student_id, group_lesson_id)
VALUES
  (7,1),
  (9,1),
  (1,2),
  (8,2);  

INSERT INTO student_individual_lesson (student_id, individual_lesson_id)
VALUES
  (10,1),
  (1,1);
