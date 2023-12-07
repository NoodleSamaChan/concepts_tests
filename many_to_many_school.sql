-- creation of table for students
CREATE TABLE students (
  id SERIAL UNIQUE PRIMARY KEY,
  name text,
  year_grade text,
  age int
);

-- creation table teachers
CREATE TABLE teachers (
  id SERIAL UNIQUE PRIMARY KEY,
  name text,
  subject text
);

-- creation table of which students have which teachers
CREATE TABLE students_and_teachers (
  id SERIAL UNIQUE PRIMARY KEY,
  teacher text references teachers(id),
  student text references students(id)
);

INSERT INTO students (name, year_grade, age) VALUES ('luna', 'terminal', 14);
INSERT INTO students (name, year_grade, age) VALUES ('tamo', 'cp', 10);
INSERT INTO students (name, year_grade, age) VALUES ('sophie', '5eme', 12);
INSERT INTO students (name, year_grade, age) VALUES ('pampa', 'cm2', 2);

INSERT INTO teachers (name, subject) VALUES ('Sora', 'PE');
INSERT INTO teachers (name, subject) VALUES ('Riku', 'Maths');
INSERT INTO teachers (name, subject) VALUES ('Roxas', 'Geography');
INSERT INTO teachers (name, subject) VALUES ('Ventus', 'History');

INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Sora'), (SELECT id FROM students WHERE name = 'luna'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Roxas'), (SELECT id FROM students WHERE name = 'luna'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Sora'), (SELECT id FROM students WHERE name = 'tamo'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Riku'), (SELECT id FROM students WHERE name = 'tamo'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Sora'), (SELECT id FROM students WHERE name = 'pampa'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Ventus'), (SELECT id FROM students WHERE name = 'pampa'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Sora'), (SELECT id FROM students WHERE name = 'sophie'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Roxas'), (SELECT id FROM students WHERE name = 'sophie'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Ventus'), (SELECT id FROM students WHERE name = 'sophie'));
INSERT INTO students_and_teachers (teacher, student) VALUES ((SELECT id FROM teachers WHERE name = 'Riku'), (SELECT id FROM students WHERE name = 'luna'));



-- SELECT * FROM students

-- SELECT * FROM teachers

-- SELECT * from students_and_teachers

-- find all students that have history lessons
-- SELECT students.name 
--  FROM students
--  JOIN students_and_teachers ON students.id = students_and_teachers.student
--  JOIN teachers ON students_and_teachers.teacher = teachers.id
--   WHERE teachers.subject = 'History'
    
-- find all the grades that Riku teaches
-- SELECT students.year_grade
--  FROM students
--  JOIN students_and_teachers ON students.id = students_and_teachers.student
--  JOIN teachers ON students_and_teachers.teacher = teachers.id
--    WHERE teachers.name = 'Riku'