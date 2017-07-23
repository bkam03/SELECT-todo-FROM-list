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

\c todo_app;

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
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

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks values(
  DEFAULT,
  'Study SQL',
  'Complete this exercise',
  NOW(),
  NOW(),
  NULL
);

INSERT INTO tasks ( title, description )
  values( 'Study PostgreSQL', 'Read all the documentation' );

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = NOW() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks( title, description )
  values( 'mistake 1', 'a test entry' );

INSERT INTO tasks( title, description )
  values( 'mistake 2', 'another test entry' );

INSERT INTO tasks( title, description )
  values( 'mistake 3', 'another test entry' );

SELECT title FROM tasks WHERE title LIKE '%mistake%';

--SELECT * FROM tasks;
\c bk;
