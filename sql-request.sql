-- Выбрать всех студентов, обучающихся на курсе "Математика".

SELECT s.*
FROM Students s
         JOIN Groups g ON s.group_id = g.id
         JOIN Courses c ON g.id = c.id
WHERE c.name = 'Математика';


-- Обновить оценку студента по курсу.

UPDATE Grades
SET grade = 10
WHERE student_id = 1
  AND course_id = 1;

-- Выбрать всех преподавателей, которые преподают в здании №3.

SELECT t.*
FROM Teachers t
         JOIN Courses c ON t.id = c.teacher_id
         JOIN Schedule s ON c.id = s.course_id
         JOIN Classrooms cl ON s.classroom_id = cl.id
         JOIN Buildings b ON cl.building_id = b.id
WHERE b.name = 'Здание №3';

-- Удалить задание для самостоятельной работы, которое было создано более года назад.

DELETE
FROM Homeworks
WHERE created_date < NOW() - INTERVAL '1 year';


-- Добавить новый семестр в учебный год.

INSERT INTO Semesters (name, academic_year)
VALUES ('Осенний семестр', '2023-2024')