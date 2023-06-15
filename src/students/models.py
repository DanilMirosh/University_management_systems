from pydantic import BaseModel


#  Модель данных для Студента
class Student(BaseModel):
    first_name: str
    last_name: str
    date_of_birth: str
    group_id: int


# Модель данных для Преподавателя
class Teacher(BaseModel):
    first_name: str
    last_name: str
    department_id: int


# Модель данных для Курса
class Course(BaseModel):
    name: str
    teacher_id: int


# Модель данных для оценки
class Grade(BaseModel):
    student_id: int
    course_id: int
    grade: int
