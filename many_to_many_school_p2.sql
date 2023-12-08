-- creation of table for students
CREATE TABLE students (
  id SERIAL UNIQUE PRIMARY KEY,
  name text,
  age int
);

-- creation table teachers
CREATE TABLE teachers (
  id SERIAL UNIQUE PRIMARY KEY,
  name text
);

-- creation table classes
CREATE TABLE classes (
  id SERIAL UNIQUE PRIMARY KEY,
  name text,
  class_floor int
);

-- creation table subjects
CREATE TABLE subjects (
  id SERIAL UNIQUE PRIMARY KEY,
  name text
);

-- creation table associating students to class
CREATE TABLE students_in_classes (
  id SERIAL UNIQUE PRIMARY KEY,
  class int REFERENCES classes(id),
  student int REFERENCES students(id)
);

-- creation table associating subjects to class
CREATE TABLE subjects_by_classes (
  id SERIAL UNIQUE PRIMARY KEY,
  class int REFERENCES classes(id),
  subject int REFERENCES subjects(id)
);

-- creation table associating teachers to class
CREATE TABLE teacher_by_subject (
  id SERIAL UNIQUE PRIMARY KEY,
  teacher int REFERENCES teachers(id),
  subject int REFERENCES subjects(id)
);

-- adding students
INSERT INTO students (name, age) VALUES ('luna', 14);
INSERT INTO students (name, age) VALUES ('tamo', 10);
INSERT INTO students (name, age) VALUES ('sophie', 12);
INSERT INTO students (name, age) VALUES ('gomez', 12);
INSERT INTO students (name, age) VALUES ('pampa', 2);
INSERT INTO students (name, age) VALUES ('guigui', 14);

-- adding classes
INSERT INTO classes (name, class_floor) VALUES ('6eme A', 3);
INSERT INTO classes (name, class_floor) VALUES ('6eme B', 1);
INSERT INTO classes (name, class_floor) VALUES ('1ere A', 2);
INSERT INTO classes (name, class_floor) VALUES ('1ere B', 3);


-- adding teachers
INSERT INTO teachers (name) VALUES ('sora');
INSERT INTO teachers (name) VALUES ('riku');
INSERT INTO teachers (name) VALUES ('ventus');
INSERT INTO teachers (name) VALUES ('vanitas');
INSERT INTO teachers (name) VALUES ('roxas');
INSERT INTO teachers (name) VALUES ('aqua');

-- adding subjects
INSERT INTO subjects (name) VALUES ('languages');
INSERT INTO subjects (name) VALUES ('chemestry');
INSERT INTO subjects (name) VALUES ('biology');
INSERT INTO subjects (name) VALUES ('geography');
INSERT INTO subjects (name) VALUES ('sport');
INSERT INTO subjects (name) VALUES ('history');

-- associating students to classes
INSERT INTO students_in_classes (class, student) VALUES ((SELECT id FROM classes WHERE name = '1ere A'), (SELECT id FROM students WHERE name = 'luna'));
INSERT INTO students_in_classes (class, student) VALUES ((SELECT id FROM classes WHERE name = '1ere A'), (SELECT id FROM students WHERE name = 'pampa'));
INSERT INTO students_in_classes (class, student) VALUES ((SELECT id FROM classes WHERE name = '1ere B'), (SELECT id FROM students WHERE name = 'gomez'));
INSERT INTO students_in_classes (class, student) VALUES ((SELECT id FROM classes WHERE name = '6eme A'), (SELECT id FROM students WHERE name = 'tamo'));
INSERT INTO students_in_classes (class, student) VALUES ((SELECT id FROM classes WHERE name = '6eme B'), (SELECT id FROM students WHERE name = 'sophie'));
INSERT INTO students_in_classes (class, student) VALUES ((SELECT id FROM classes WHERE name = '6eme A'), (SELECT id FROM students WHERE name = 'guigui'));


-- associating classes to subjects
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '1ere A'), (SELECT id FROM subjects WHERE name = 'history'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '1ere A'), (SELECT id FROM subjects WHERE name = 'geography'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '1ere A'), (SELECT id FROM subjects WHERE name = 'sport'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '1ere B'), (SELECT id FROM subjects WHERE name = 'history'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '1ere B'), (SELECT id FROM subjects WHERE name = 'biology'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '1ere B'), (SELECT id FROM subjects WHERE name = 'languages'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '6eme A'), (SELECT id FROM subjects WHERE name = 'chemestry'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '6eme B'), (SELECT id FROM subjects WHERE name = 'chemestry'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '6eme B'), (SELECT id FROM subjects WHERE name = 'sport'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '6eme A'), (SELECT id FROM subjects WHERE name = 'history'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '6eme B'), (SELECT id FROM subjects WHERE name = 'geography'));
INSERT INTO subjects_by_classes (class, subject) VALUES ((SELECT id FROM classes WHERE name = '6eme A'), (SELECT id FROM subjects WHERE name = 'sport'));

-- associating teachers to subjects
INSERT INTO teacher_by_subject (teacher, subject) VALUES ((SELECT id FROM teachers WHERE name = 'sora'), (SELECT id FROM subjects WHERE name = 'sport'));
INSERT INTO teacher_by_subject (teacher, subject) VALUES ((SELECT id FROM teachers WHERE name = 'riku'), (SELECT id FROM subjects WHERE name = 'geography'));
INSERT INTO teacher_by_subject (teacher, subject) VALUES ((SELECT id FROM teachers WHERE name = 'ventus'), (SELECT id FROM subjects WHERE name = 'languages'));
INSERT INTO teacher_by_subject (teacher, subject) VALUES ((SELECT id FROM teachers WHERE name = 'roxas'), (SELECT id FROM subjects WHERE name = 'biology'));
INSERT INTO teacher_by_subject (teacher, subject) VALUES ((SELECT id FROM teachers WHERE name = 'vanitas'), (SELECT id FROM subjects WHERE name = 'history'));
INSERT INTO teacher_by_subject (teacher, subject) VALUES ((SELECT id FROM teachers WHERE name = 'aqua'), (SELECT id FROM subjects WHERE name = 'chemestry'));


-- checking the ages of the people following Sora's classes
-- SELECT students.age
--  FROM students
--    JOIN students_in_classes ON students_in_classes.student = students.id
--    JOIN subjects_by_classes ON subjects_by_classes.class = students_in_classes.class
--    JOIN teacher_by_subject ON teacher_by_subject.subject = subjects_by_classes.subject
--      WHERE teacher_by_subject.teacher = 'sora'

-- SELECT * FROM students
-- SELECT * FROM students_in_classes
-- SELECT * FROM subjects_by_classes
-- SELECT * FROM teacher_by_subject

-- checking how many people are in 1ereA
SELECT students.name, classes.name FROM students
  JOIN students_in_classes ON students.id = students_in_classes.class
  JOIN classes ON  students_in_classes.class = classes.id
 --   WHERE classes.name = '1ere A'