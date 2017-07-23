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