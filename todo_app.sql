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

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;

\c bk;
