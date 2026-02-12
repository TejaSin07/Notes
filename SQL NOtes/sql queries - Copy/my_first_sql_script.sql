CREATE DATABASE IF NOT EXISTS startersql;
USE startersql;

create table users (

	id INT auto_increment primary key,
    name varchar(100) not null,
    email varchar(100) unique not null,
    gender enum('Male','female','other'),
    date_of_birth Date,
    created_at TIMESTAMP default current_timestamp
    
    );