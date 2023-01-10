-- 1. Show the number of lessons given per month during a specified year.

SELECT *, number_of_individual_lessons+number_of_group_lessons+number_ensembles as tot FROM
(SELECT nr, month,  COUNT(*) as number_ensembles
FROM ensemble_start_and_end_time AS e
WHERE EXTRACT(year FROM e.start_time) = extract(year FROM CURRENT_TIMESTAMP)
GROUP BY nr, month
ORDER BY e.nr) tbl1
NATURAL JOIN
(SELECT nr,month, COUNT(*) as number_of_individual_lessons
FROM individual_lesson_start_and_end_time AS il
WHERE EXTRACT(year FROM il.start_time) = extract(year FROM CURRENT_TIMESTAMP)
GROUP BY nr, month
ORDER BY il.nr) tbl2
NATURAL JOIN
(SELECT nr, month, COUNT(*) as number_of_group_lessons
FROM group_lesson_start_and_end_time AS gl
WHERE EXTRACT(year FROM gl.start_time) = extract(year FROM CURRENT_TIMESTAMP)
GROUP BY nr, month
ORDER BY gl.nr) tbl3;


---------------------------------------------------------------------------------------------
-- 2. List the number of students that has 0, 1 and 2 siblings inlisted at the school
select number_of_siblings, count(*)number_of_students
from (select student_id,(select (select count(*) 
	  from siblings s where s.student_id = st.student_id)+ 
	 (select count(*) from siblings s where s.sibling_student_id = st.student_id)
     ) as number_of_siblings
    from student st) x
group by number_of_siblings;


--------------------------------------------------------------------------------------------------
-- 3. List all instructors that has more then 2 lessons this month
		  
select instructor_id, COUNT (instructor_id) total_lessons_this_month from 
all_intructor_lessons_listed_this_month
GROUP BY instructor_id
HAVING COUNT(*) > 2
order by instructor_id;

-------------------------------------------------------------------------------------------------------------
-- 4. List all ensembles taking place next week, ordered by weekdat and genre
SELECT e.ensemble_id, e.genre, to_char(t.start_time, 'Day') as weekday,
	CASE
		WHEN(SELECT maximum_number_of_students - COUNT(*) FROM student_ensemble
	    WHERE ensemble_id = e.ensemble_id) = 0 THEN 'Full'
	    WHEN(SELECT maximum_number_of_students - COUNT(*) FROM student_ensemble
	    WHERE ensemble_id = e.ensemble_id) = 1 THEN 'one seat left'
		WHEN(SELECT maximum_number_of_students - COUNT(*) FROM student_ensemble
	    WHERE ensemble_id = e.ensemble_id) = 2 THEN 'two seats left'
	    ELSE 'more seats left'
	END AS space_left
FROM ensemble e
natural join time_slot t
WHERE  DATE_PART('week',start_time) = DATE_PART('week',CURRENT_TIMESTAMP)+1;


----------------------------------------------------------------------------------------------

