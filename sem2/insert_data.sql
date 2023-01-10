TRUNCATE addresses,contact_details,contact_person,email,instrument_type,person,phone,sibling_discount,skill_level,
         student, student_instrument_skill_level, time_slot,contact_details_email, contact_details_phone, instructor, instructor_availability, 
         instructor_instrument_type, instrument, pricing_scheme, rental_of_instrument_records, siblings, ensemble, group_lesson, individual_lesson,
         student_ensemble, student_group_lesson, student_individual_lesson RESTART IDENTITY;

-- 34 addresses
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
  ('419-4361 Pellentesque Avenue','Máfil','41530'),
  ('838-4322 Turpis Avenue','Jönköping','78353'),
  ('P.O. Box 650, 4374 Scelerisque Rd.','Tranås','24153'),
  ('2714 Sapien Av.','Märsta','60338'),
  ('P.O. Box 866, 173 Tellus Ave','Jönköping','17149'),
  ('Ap #104-4203 Magnis Road','Boo','71767'),
  ('925-7383 Vel, Ave','Tranås','50958'),
  ('8189 Commodo Ave','Jönköping','68735'),
  ('1824 Et St.','Motala','74448'),
  ('Ap #147-9826 Vitae Road','Linköping','54282'),
  ('929-7765 Senectus Avenue','Ludvika','72058'),
  ('Ap #143-5048 Conubia Rd.','Ludvika','38924'),
  ('Ap #247-7134 Dictum St.','Ludvika','33057'),
  ('Ap #864-3299 Ipsum St.','Borlänge','88335'),
  ('P.O. Box 864, 7868 Sem. Road','Borås','34953'),
  ('685-3741 Mauris Avenue','Nässjö','47194'),
  ('Ap #149-1752 Lorem, Road','Lidingo','15717'),
  ('793-4664 Pharetra. St.','Nässjö','53779'),
  ('607-747 Tellus Av.','Avesta','23772'),
  ('Ap #285-7821 Enim Street','Avesta','71722'),
  ('Ap #649-2255 Erat. St.','Söderhamn','44960');

--- 34 contact_details
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
  (10),
  (11),
  (12),
  (13),
  (14),
  (15),
  (16),
  (17),
  (18),
  (19),
  (20),
  (21),
  (22),
  (23),
  (24),
  (25),
  (26),
  (27),
  (28),
  (29),
  (30);

-- 25 contact persons
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
  ('Macy Kirkland',10),
  ('Xantha Bonner',11),
  ('Quinn Decker',12),
  ('Shellie Ryan',13),
  ('Keegan Trevino',14),
  ('Jana Woods',15),
  ('Anjolie Eaton',16),
  ('Bruce Hughes',17),
  ('Farrah Lane',18),
  ('Valentine Curry',19),
  ('Acton Boone',20),
  ('Ashton Tate',21),
  ('Maxine Cobb',22),
  ('Orlando Huffman',23),
  ('Celeste Berger',24),
  ('Lee Patton',25);

-- 34 emails
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
  ('porttitor.tellus@aol.com'),
  ('nullam@hotmail.couk'),
  ('vel.quam.dignissim@outlook.net'),
  ('tincidunt.nibh@yahoo.com'),
  ('non@google.org'),
  ('vel.mauris.integer@aol.org'),
  ('ligula@yahoo.com'),
  ('dui.nec@outlook.org'),
  ('feugiat.non@yahoo.edu'),
  ('congue.in@yahoo.ca'),
  ('cras@aol.net'),
  ('curabitur@icloud.edu'),
  ('dolor.elit@protonmail.net'),
  ('diam.pellentesque@yahoo.com'),
  ('cras.eget@protonmail.org'),
  ('velit.aliquam.nisl@yahoo.edu'),
  ('sit.amet@yahoo.net'),
  ('et.libero@icloud.ca'),
  ('nunc.sollicitudin@google.edu'),
  ('donec.feugiat.metus@google.couk'),
  ('a.feugiat@hotmail.com');

-- 4 Instrument types:
INSERT INTO instrument_type (instrument_type_name)
VALUES
  ('drums'),
  ('bass'),
  ('cello'),
  ('guitar');

-- 34 persons
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
  ('193927321876','Sydney Wynn',14),
  ('195839054913','Celeste Barber',15),
  ('191688789915','Rachel Bond',16),
  ('197254756095','Kelsey Cain',17),
  ('199337889836','Logan Burris',18),
  ('197447576181','Lael Garza',19),
  ('197722788375','Norman Jefferson',20),
  ('190650044821','Constance Noel',21),
  ('197872172427','Imogene Andrews',22),
  ('190942411033','Bruno Schmidt',23),
  ('191622844565','Palmer Humphrey',24),
  ('195484358621','Jemima Schwartz',25),
  ('198134752687','Kitra Williamson',26),
  ('195378086140','Akeem Downs',27),
  ('198426059476','Chandler Gillespie',28),
  ('192014102830','Althea Fisher',29),
  ('198333807416','Deacon Allison',30),
  ('194461628034','Bruce Sosa',31),
  ('190924646438','Keith Jarvis',32),
  ('196851676805','Dora Sharpe',33),
  ('198081532636','Jaden Yates',34);

-- 34 phones
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
  ('071-8081222'),
  ('076-5313631'),
  ('076-2214863'),
  ('076-0179265'),
  ('076-6944905'),
  ('076-3035896'),
  ('076-7565828'),
  ('076-9157411'),
  ('076-0316588'),
  ('076-3732331'),
  ('076-8338613'),
  ('076-3576548'),
  ('076-4142325'),
  ('076-5257525'),
  ('076-1588464'),
  ('076-2990543'),
  ('076-0824214'),
  ('076-6521867'),
  ('076-7574524'),
  ('076-3018853'),
  ('076-8222305');
  

INSERT INTO sibling_discount (discount_percentage)
VALUES
  (25);

--- Skill levels:
INSERT INTO skill_level (skill_value)
VALUES
  ('beginner'),
  ('intermediate'),
  ('advanced');

-- 25 students
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
  (10,10),
  (11,11),
  (12,12),
  (13,13),
  (14,14),
  (15,15),
  (16,16),
  (17,17),
  (18,18),
  (19,19),
  (20,20),
  (21,21),
  (22,22),
  (23,23),
  (24,24),
  (25,25);

INSERT INTO student_instrument_skill_level (student_id, instrument_type_id, skill_level_id)
VALUES
  (1,1,1),
  (1,2,1),
  (1,3,1),
  (1,4,1),
  (2,1,2),
  (2,2,2),
  (2,3,2),
  (2,4,2),
  (3,1,3),
  (3,2,3),
  (3,3,3),
  (3,4,3),
  (4,3,3),
  (5,2,2),
  (6,1,1),
  (7,3,2),
  (8,4,3),
  (9,2,2),
  (10,4,2),
  (11,2,2),
  (12,2,2),
  (13,3,2),
  (14,3,3),
  (15,2,2),
  (16,1,1),
  (17,3,2),
  (18,4,3),
  (19,2,2),
  (20,4,2),
  (21,2,2),
  (22,2,2),
  (23,3,2),
  (24,3,3),
  (25,2,2);
  
-- 1-22  jan 2023
-- 23-33 feb 2023
-- 34-39 feb 2024
INSERT INTO time_slot (start_time, end_time)
VALUES
  ('2023-01-09 8:00:00', '2023-01-09 12:00:00'),
  ('2023-01-09 13:00:00', '2023-01-09 17:00:00'),
  ('2023-01-10 8:00:00', '2023-01-10 12:00:00'),
  ('2023-01-10 13:00:00', '2023-01-10 17:00:00'),
  ('2023-01-11 8:00:00', '2023-01-11 12:00:00'),
  ('2023-01-11 13:00:00', '2023-01-11 17:00:00'),
  ('2023-01-12 8:00:00', '2023-01-12 12:00:00'),
  ('2023-01-12 13:00:00', '2023-01-12 17:00:00'),
  ('2023-01-13 8:00:00', '2023-01-13 12:00:00'),
  ('2023-01-13 13:00:00', '2023-01-13 17:00:00'),
  ('2023-01-16 8:00:00', '2023-01-16 12:00:00'),
  ('2023-01-16 13:00:00', '2023-01-16 17:00:00'),
  ('2023-01-17 8:00:00', '2023-01-17 12:00:00'),
  ('2023-01-17 13:00:00', '2023-01-17 17:00:00'),
  ('2023-01-18 8:00:00', '2023-01-18 12:00:00'),
  ('2023-01-18 13:00:00', '2023-01-18 17:00:00'),
  ('2023-01-25 8:00:00', '2023-01-25 12:00:00'),
  ('2023-01-25 13:00:00', '2023-01-25 17:00:00'),
  ('2023-01-26 8:00:00', '2023-01-26 12:00:00'),
  ('2023-01-26 13:00:00', '2023-01-26 17:00:00'),
  ('2023-01-27 8:00:00', '2023-01-27 12:00:00'),
  ('2023-01-27 13:00:00', '2023-01-27 17:00:00'),

  ('2023-02-06 8:00:00', '2023-02-06 12:00:00'),
  ('2023-02-06 13:00:00', '2023-02-06 17:00:00'),
  ('2023-02-07 8:00:00', '2023-02-07 12:00:00'),
  ('2023-02-07 13:00:00', '2023-02-07 17:00:00'),
  ('2023-02-08 8:00:00', '2023-02-08 12:00:00'),
  ('2023-02-08 13:00:00', '2023-02-08 17:00:00'),
  ('2023-02-09 8:00:00', '2023-02-09 12:00:00'),
  ('2023-02-09 13:00:00', '2023-02-09 17:00:00'),
  ('2023-02-10 8:00:00', '2023-02-10 12:00:00'),
  ('2023-02-10 13:00:00', '2023-02-10 17:00:00'),

  ('2024-02-06 8:00:00', '2023-02-06 12:00:00'),
  ('2024-02-06 13:00:00', '2023-02-06 17:00:00'),
  ('2024-02-07 8:00:00', '2023-02-07 12:00:00'),
  ('2024-02-07 13:00:00', '2023-02-07 17:00:00'),
  ('2024-02-08 8:00:00', '2023-02-08 12:00:00'),
  ('2024-02-08 13:00:00', '2023-02-08 17:00:00');

-- 34 contact details email:
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
  (14,14),
  (15,15),
  (16,16),
  (17,17),
  (18,18),
  (19,19),
  (20,20),
  (21,21),
  (22,22),
  (23,23),
  (24,24),
  (25,25),
  (26,26),
  (27,27),
  (28,28),
  (29,29),
  (30,30),
  (31,31),
  (32,32),
  (33,33),
  (34,34);

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
  (14,14),
  (15,15),
  (16,16),
  (17,17),
  (18,18),
  (19,19),
  (20,20),
  (21,21),
  (22,22),
  (23,23),
  (24,24),
  (25,25),
  (26,26),
  (27,27),
  (28,28),
  (29,29),
  (30,30),
  (31,31),
  (32,32),
  (33,33),
  (34,34);

-- 9 instructors:
INSERT INTO instructor (can_teach_ensemble, person_id)
VALUES
  ('1',26),
  ('1',27),
  ('1',28),
  ('1',29),
  ('1',30),
  ('1',31),
  ('0',32),
  ('0',33),
  ('0',34);


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
  (4,4),
  (2,5),
  (3,6),
  (2,7),
  (2,8),
  (4,9);

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
  (1, 1, '2023-01-9 8:00:00', '2023-05-9 12:00:00'),
  (2, 5, '2023-01-9 8:00:00', '2023-05-9 12:00:00');

INSERT INTO siblings (student_id, sibling_student_id)
VALUES
  (1,2),
  (1,5),
  (2,5),
  (3,6),
  (4,7);
-- Time_slot:
-- ID    
-- 1-22  jan 2023
-- 23-33 feb 2023
-- 34-38 feb 2024
-- instructor 1-6 can teach ensemble

--6 ensembles, 3 this month, 2 next month, 1 next year
INSERT INTO ensemble (time_slot_id, instructor_id, genre, minimum_number_of_students, maximum_number_of_students)
VALUES
  (2,  1, 'Rock',   5, 7),
  (3,  2, 'Punk',   3, 5),
  (14, 1, 'Gospel', 8, 15), -- next week
  (15, 1, 'Gospel', 8, 15), -- next week
  (16, 1, 'Gospel', 2, 5), -- next week
  (16, 1, 'Rock',   5, 7), -- next week
  (23, 6, 'Rock',   5, 7),
  (23, 4, 'Rock',   5, 7),
  (38, 1, 'Punk',   5, 7);

--12 group lessons, 7 this month, 5 next month, 2 next year
INSERT INTO group_lesson (time_slot_id, instructor_id, skill_level_id, instrument_type_id, minimum_number_of_students, maximum_number_of_students)
VALUES
  (2, 3, 1, 2, 3, 10),
  (4, 4, 3, 4, 3, 10),
  (7,7,1,1,3,10),
  (11,7,2,3,3,10),
  (15,8,2,3,3,10),
  (19,4,1,1,3,10),
  (21,9,3,1,3,10),
  (26,9,3,2,3,10),
  (30,7,2,3,3,10),
  (32,2,1,3,3,10),
  (32,9,3,2,3,10),
  (33,6,3,1,3,10),
  (34,9,1,2,3,10),
  (35,9,3,2,3,10);
  
-- 12 indv-lessons, 9 this month, 2 nest month, 1 next year
INSERT INTO individual_lesson (time_slot_id, instructor_id, skill_level_id, instrument_type_id)
VALUES
  (3, 1, 2, 2),
  (3,2,2,2),
  (4,1,2,1),
  (7,8,2,1),
  (9, 2, 1, 2),
  (13,7,1,3),
  (14,3,2,1),
  (17,6,2,4),
  (18,7,3,2),
  (23,7,1,3),
  (24,5,3,2),
  (34,8,1,3);
  
INSERT INTO student_ensemble (student_id, ensemble_id)
VALUES
  (22,4),
  (1,3),
  (2,4),
  (15,4),
  (7,6),
  (5,2),
  (25,6),
  (23,4),
  (20,3),
  (7,4),
  (1,6),
  (2,6),
  (3,6),
  (4,6),
  (1,5),
  (2,5),
  (3,5),
  (4,5),
  (5,5);




INSERT INTO student_group_lesson (student_id, group_lesson_id)
VALUES
  (22,1),
  (19,6),
  (2,4),
  (15,8),
  (2,2),
  (1,11),
  (25,3),
  (1,5),
  (21,3),
  (25,5),
  (7,3),
  (3,1),
  (5,4),
  (1,9),
  (16,11),
  (5,11),
  (23,5),
  (2,6),
  (14,1),
  (20,1);

INSERT INTO student_individual_lesson (student_id, individual_lesson_id)
VALUES
  (21,3),
  (7,1),
  (3,4),
  (3,9),
  (16,11),
  (5,11),
  (23,5),
  (3,6),
  (14,1),
  (20,1),
  (22,1),
  (1,6),
  (2,4),
  (15,8),
  (2,2),
  (8,11),
  (25,3),
  (9,5),
  (10,3),
  (11,5);
