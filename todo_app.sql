/*
Write a query to delete a user named michael if it exists
Write a query to create a user named michael with an encrypted password stonebreaker
Write a query to drop a database named todo_app if it exists
Write a query to create a database named todo_app
*/

DROP USER IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app;

/*
Connect to the newly created database
Write a query to create a table named tasks using the Initial columns detailed below
Define column id as the table's primary key
*/
\c todo_app;

CREATE TABLE tasks (
  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT DEFAULT NULL,
  created_at TIMESTAMP without time zone NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

/*
8remove the column named completed

add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL.

change the updated_at column to not allow NULL values, and have a default value of now()
create a new task, by only setting values (not defining which columns) id = default value
title = 'Study SQL'
description = 'Complete this exercise'
created_at = now()
updated_at = now()
completed_at = NULL
13
*/
ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP without time zone DEFAULT NULL;


SELECT * FROM tasks;
\c bk;
