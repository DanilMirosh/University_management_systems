-- Создание таблицы Faculties
CREATE TABLE Faculties (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Создание таблицы Departments
CREATE TABLE Departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    faculty_id INT NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES Faculties (id)
);

-- Создание таблицы Groups
CREATE TABLE Groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments (id)
);

-- Создание таблицы Buildings
CREATE TABLE Buildings (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Создание таблицы Classrooms
CREATE TABLE Classrooms (
    id SERIAL PRIMARY KEY,
    building_id INT NOT NULL,
    room_number VARCHAR(10) NOT NULL,
    FOREIGN KEY (building_id) REFERENCES Buildings (id)
);

-- Создание таблицы Students
CREATE TABLE Students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    group_id INT NOT NULL,
    FOREIGN KEY (group_id) REFERENCES Groups (id)
);

-- Создание таблицы Teachers
CREATE TABLE Teachers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments (id)
);

-- Создание таблицы Courses
CREATE TABLE Courses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES Teachers (id)
);

-- Создание таблицы Grades
CREATE TABLE Grades (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students (id),
    FOREIGN KEY (course_id) REFERENCES Courses (id)
);

-- Создание таблицы Schedule
CREATE TABLE Schedule (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    group_id INT NOT NULL,
    classroom_id INT NOT NULL,
    day_of_week INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses (id),
    FOREIGN KEY (group_id) REFERENCES Groups (id),
    FOREIGN KEY (classroom_id) REFERENCES Classrooms (id)
);

-- Создание таблицы Semesters
CREATE TABLE Semesters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    academic_year VARCHAR(10) NOT NULL
);

-- Создание таблицы Exams
CREATE TABLE Exams (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    exam_date DATE NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses (id),
    FOREIGN KEY (semester_id) REFERENCES Semesters (id)
);

-- Создание таблицы Homeworks
CREATE TABLE Homeworks (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    created_date DATE NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses (id)
);

-- Создание таблицы CoursePrograms
CREATE TABLE CoursePrograms (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    program TEXT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses (id)
);

-- Создание таблицы StudyPlans
CREATE TABLE StudyPlans (
    id SERIAL PRIMARY KEY,
    department_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments (id),
    FOREIGN KEY (course_id) REFERENCES Courses (id),
    FOREIGN KEY (semester_id) REFERENCES Semesters (id)
);
