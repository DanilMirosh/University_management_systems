CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    enrollment_date DATE
);

CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE StudentGroup (
    group_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Grade (
    grade_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    value INT,
    FOREIGN KEY (student_id) REFERENCES Student (student_id),
    FOREIGN KEY (course_id) REFERENCES Course (course_id)
);

CREATE TABLE Timetable (
    timetable_id INT PRIMARY KEY,
    course_id INT,
    group_id INT,
    FOREIGN KEY (course_id) REFERENCES Course (course_id),
    FOREIGN KEY (group_id) REFERENCES StudentGroup (group_id)
);

CREATE TABLE Building (
    building_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    building_id INT,
    room_number VARCHAR(255),
    FOREIGN KEY (building_id) REFERENCES Building (building_id)
);

CREATE TABLE Semester (
    semester_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Exam (
    exam_id INT PRIMARY KEY,
    course_id INT,
    semester_id INT,
    FOREIGN KEY (course_id) REFERENCES Course (course_id),
    FOREIGN KEY (semester_id) REFERENCES Semester (semester_id)
);

CREATE TABLE CourseProgram (
    program_id INT PRIMARY KEY,
    course_id INT,
    description VARCHAR(255),
    FOREIGN KEY (course_id) REFERENCES Course (course_id)
);

CREATE TABLE StudyPlan (
    plan_id INT PRIMARY KEY,
    course_id INT,
    department_id INT,
    FOREIGN KEY (course_id) REFERENCES Course (course_id),
    FOREIGN KEY (department_id) REFERENCES Department (department_id)
);

CREATE TABLE Curriculum (
    curriculum_id INT PRIMARY KEY,
    name VARCHAR(255)
);
