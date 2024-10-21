
drop database school;
create database school;
use school;

create table Students(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);


create table Teachers(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table Competencies(
	id int primary key auto_increment,
    title varchar(128) not null
);

create table Teachers2Competencies(
	id int primary key auto_increment,
    teacher_id int,
    competencies_id int
);

create table Courses(
	id int primary key auto_increment,
    teacher_id int,
    title varchar(128) not null,
    headman_id int
);

create table Students2Courses(
	id int primary key auto_increment,
    student_id int,
    course_id int
);

insert into students (name, age) values ('Anatolii', 29);
insert into students (name, age) values ('Oleg', 25);
insert into students (name, age) values ('Semen', 27);
insert into students (name, age) values ('Olesia', 28);
insert into students (name, age) values ('Olga', 31);
insert into students (name, age) values ('Ivan', 22);

insert into teachers (name, age) values ('Peter', 39);
insert into teachers (name, age) values ('Maxim', 35);
insert into teachers (name, age) values ('Anton', 37);
insert into teachers (name, age) values ('Vselovod', 38);
insert into teachers (name, age) values ('Egor', 41);
insert into teachers (name, age) values ('Svetlana', 32);

insert into Competencies (title) values ('Mathematics');
insert into Competencies (title) values ('Informatics');
insert into Competencies (title) values ('Programming');
insert into Competencies (title) values ('Graphics');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title, headman_id) values (1, 'Algebra of logic', 2);
insert into courses (teacher_id, title, headman_id) values (2, 'Mathematical Statistics', 3);
insert into courses (teacher_id, title, headman_id) values (4, 'Higher mathematics', 5);
insert into courses (teacher_id, title, headman_id) values (5, 'Javascript', 1);
insert into courses (teacher_id, title, headman_id) values (5, 'Basic Python', 1);

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);

select * from students;
select * from teachers;
select * from courses;
select * from competencies;
select * from students2courses;
select * from teachers2competencies;

-- 1) Вывести имена студентов и курсы, которые они проходят
select t1.name, t3.title
from students t1
join students2courses t2
on t1.id = t2.student_id
join courses t3
on t2.course_id = t3.id;

-- 2) Вывести имена всех преподавателей с их компетенциями
select t1.name, t3.title
from teachers t1
join teachers2competencies t2
on t1.id = t2.teacher_id
join competencies t3
on t2.competencies_id = t3.id;

-- 3) Вывести имена всех преподавателей и курсы, которые они ведут.
select t1.name, t2.title
from teachers t1
join courses t2
on t1.id = t2.teacher_id;

-- 4) Вывести имена всех всех студентов, курсы которые они проходят и имена преподаваелей, которые ведут эти курсы.
select t1.name as student_name, t3.title, t4.name as teacher_name
from students t1
join students2courses t2
on t1.id = t2.student_id
join courses t3
on t2.course_id = t3.id
join teachers t4
on t3.teacher_id = t4.id;

select * from competencies;
select * from courses;
select * from students;
select * from student2courses;
select * from teachers;
select * from teachers2competencies;

-- OUTER JOIN - LEFT JOIN, RIGHT JOIN

-- zum Beispiel

-- select column1,, column2,...
-- from table1
-- left/right join table2
-- on table1.column = table2.column;

-- Задача. Повторение. Вывести имена студентов и курсы, которые они проходят.

select t1.name, t2.course_id;
from students t1
join students2courses t2
on t1.id = t2.student_id;

-- Вывести имена студентов и ID курсов если студент проходит курс, если нет вывести null

select t1.name, t2.course_id
from students t1
left join students2courses t2
on t1.id = t2.student_id;

-- Вывести имена тех студентов которые не проходят ни один курс.

select name
from students t1
left join students2courses t2
on t1.id = t2.student_id
where course_id is null;

select t1.name, t2.id, t2.student_id, t2.course_id
from students t1
left join students2courses t2
on t1.id = t2.student_id
where t2.id is null;

select t1.name, t2.id, t2.student_id, t2.course_id
from students t1
left join students2courses t2
on t1.id != t2.student_id;

-- Найти курсы которые не посещает ни один студент

select title
from courses t1
left join students2courses t2
on t1.id = t2.course_id
where t2.id is null;

-- Вывести имена всех преподавателей и ID их компетенции если они есть если нет вывести null
select t1.name, t2.competencies_id
from teachers t1
left join teachers2competencies t2
on t1.id = t2.teachers_id;

-- Вывести преподавателя у которого нет компетенций
select t1.name
from teachers t1
left join teachers2competencies t2
on t1.id = t2.teacher_id
where t2.competencies_id is null;

-- Найти компетенции которых нет ни у одного преподавателя(right join)

select t2.title
from teatchers2competencies t1
right join competencies t2
on t1.competencies_id = t2.id
where t1.teacher_id is null;




























