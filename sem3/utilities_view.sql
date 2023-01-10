DROP VIEW IF EXISTS individual_lesson_start_and_end_time CASCADE;
CREATE VIEW individual_lesson_start_and_end_time
as
select individual_lesson_id, ts.time_slot_id,EXTRACT(month FROM ts.start_time) as nr, (SELECT TO_CHAR(ts.start_time, 'Month') AS month), ts.start_time, ts.end_time
from individual_lesson il
join time_slot ts on ts.time_slot_id = il.time_slot_id;

DROP VIEW IF EXISTS group_lesson_start_and_end_time CASCADE;
CREATE VIEW group_lesson_start_and_end_time
as
select group_lesson_id, ts.time_slot_id,EXTRACT(month FROM ts.start_time) as nr, (SELECT TO_CHAR(ts.start_time, 'Month') AS month), ts.start_time, ts.end_time
from group_lesson gl
join time_slot ts on ts.time_slot_id = gl.time_slot_id;

DROP VIEW IF EXISTS ensemble_start_and_end_time CASCADE;
CREATE VIEW ensemble_start_and_end_time
as
select ensemble_id, ts.time_slot_id, EXTRACT(month FROM ts.start_time) as nr,(SELECT TO_CHAR(ts.start_time, 'Month') AS month), ts.start_time, ts.end_time
from ensemble e
join time_slot ts on ts.time_slot_id = e.time_slot_id;

DROP VIEW IF EXISTS all_intructor_lessons_listed_this_month;
CREATE VIEW all_intructor_lessons_listed_this_month as
SELECT instructor_id, tbl.time_slot_id, ts.start_time FROM
(
	select instructor_id, time_slot_id  from ensemble
	UNION ALL
	select instructor_id, time_slot_id  from group_lesson
	UNION ALL
	select instructor_id, time_slot_id  from individual_lesson) tbl
	JOIN time_slot ts on ts.time_slot_id=tbl.time_slot_id
	WHERE EXTRACT(MONTH from ts.start_time) = EXTRACT(MONTH from CURRENT_DATE) AND
		  EXTRACT(YEAR from ts.start_time) = EXTRACT(YEAR from CURRENT_DATE);

DROP VIEW IF EXISTS all_instructor_lessons_information;
CREATE VIEW all_instructor_lessons_information as
SELECT instructor_id, tbl.time_slot_id, ts.start_time FROM
(
	select instructor_id, time_slot_id  from ensemble
	UNION ALL
	select instructor_id, time_slot_id  from group_lesson
	UNION ALL
	select instructor_id, time_slot_id  from individual_lesson) tbl
	JOIN time_slot ts on ts.time_slot_id=tbl.time_slot_id
	

DROP VIEW IF EXISTS get_tot_number_of_students_individual_lessons;
CREATE VIEW get_tot_number_of_students_individual_lessons AS
SELECT individual_lesson_id,
	   COUNT (student_id) total_students FROM student_individual_lesson sil
GROUP BY individual_lesson_id
ORDER BY individual_lesson_id