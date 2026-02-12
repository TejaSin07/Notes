CREATE DATABASE association_demo;
USE association_demo;

-- Contrainst Writing-- 
CREATE TABLE constTable (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,

    CONSTRAINT uk_users_email UNIQUE (email)
);

select*from constTable;

ALTER TABLE constTable DROP COLUMN email;


-- below query will not work to drop constraint-- 

ALTER TABLE constTable
DROP uk_users_email;     

-- correct way to drop unique constraint-- 

ALTER TABLE constTable
DROP INDEX uk_users_email;

drop table constTable;


-- composit primary key  ??????  --

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO order_items VALUES (1, 101, 2);
INSERT INTO order_items VALUES (1, 102, 1);
INSERT INTO order_items VALUES (2, 101, 5);
INSERT INTO order_items VALUES (1, 101, 3);

Select * from order_items;

SELECT *
FROM order_items
WHERE order_id = 1
  AND product_id = 101;

-- ✅ Correct
-- ❌ fetching data Using only one column is not safe



-- ONE TO ONE
 
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE user_profile (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    phone VARCHAR(15),

    user_id INT UNIQUE,    -- 🔥 UNIQUE enforces ONE-TO-ONE

    CONSTRAINT fk_user_profile_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        
);

UPDATE user_profile SET user_id = 10 WHERE user_id = 1;


INSERT INTO users (username, email)
VALUES 
('tejas', 'tejas@gmail.com'),
('rahul', 'rahul@gmail.com');


INSERT INTO user_profile (full_name, phone, user_id)
VALUES 
('Tejas Sinkar', '9999999999', 1),
('Rahul Patil', '8888888888', 2);

select* from users;
select * from user_profile;


 drop table users;
 drop table user_profile;


CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL
);


-- one to many --

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,

    user_id INT NOT NULL,   -- FK (many orders → one user)

    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);


-- Insert users
INSERT INTO users (username) VALUES
('tejas'),
('rahul');

-- Insert orders
INSERT INTO orders (order_date, amount, user_id) VALUES
('2026-01-01', 1200.50, 1),
('2026-01-05', 300.00, 1),
('2026-01-10', 999.99, 2);

select * from users;

select * from orders;

-- Get user details + their orders
SELECT 
*
FROM users u
right JOIN orders o
ON u.user_id = o.user_id;


drop table users;
drop table orders;



-- many to many --


CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL
);


CREATE TABLE student_course (
    student_id INT NOT NULL,
    course_id INT NOT NULL,

    PRIMARY KEY (student_id, course_id),   -- composite PK

    CONSTRAINT fk_sc_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_sc_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
        ON DELETE CASCADE
);

-- Students
INSERT INTO students (name) VALUES
('Tejas'),
('Rahul');

-- Courses
INSERT INTO courses (course_name) VALUES
('Java'),
('Spring Boot'),
('SQL');

-- Student-Course mapping
INSERT INTO student_course (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);


select * from students;

-- auto commit -- 

set autocommit = 0;  -- default 1 

INSERT INTO students (name) VALUES
('India');


rollback;

INSERT INTO students (name) VALUES
('Prajwal');

commit ;

set autocommit = 1;

select * from courses;

select * from student_course;

SELECT 
    s.student_id,
    s.name AS student_name,
    c.course_name
FROM students s
JOIN student_course sc
    ON s.student_id = sc.student_id
JOIN courses c
    ON sc.course_id = c.course_id
WHERE s.student_id = 1;

drop table students;
drop table courses;
drop table student_course;




