Table: Students
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+--------------+---------+
Table: Subjects
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
Table: Examinations
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
Write a solution to find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.
  MYSQL CODE:
      SELECT s.student_id, s.student_name, sub.subject_name,
      COUNT(e.student_id) AS attended_exams
      FROM Students AS s
     JOIN Subjects AS sub LEFT JOIN Examinations AS e
     ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
    GROUP BY s.student_id,s.student_name, sub.subject_name
   ORDER BY  s.student_id, sub.subject_name;
