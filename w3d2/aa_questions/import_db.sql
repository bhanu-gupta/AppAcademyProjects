PRAGMA foreign_keys = ON;
DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('John', 'Smith'),
  ('Jane', 'Doe'),
  ('Oliver', 'MM');

INSERT INTO 
  questions (title, body, user_id)
VALUES
  ('What is the largest prime?', 'Prime numbers are...', 1),
  ('SQLite3 Primary Key', 'What is the starting index for primary key?', 2),
  ('SQLite3 Import DB', 'How to import a database from a sql file', 2);

INSERT INTO 
  question_follows (question_id, user_id)
VALUES
    (1, 2),
    (2, 1),
    (2, 2),
    (3, 1);

INSERT INTO 
  replies (question_id, parent_id, user_id, body)
VALUES
  (1, NULL, 3, '51 is the largest prime number'),
  (1, 1, 2, 'No 51 is not the largest prime number'),
  (2, NULL, 3, 'Primary Key starts with index 1' );


INSERT INTO 
  question_likes (question_id, user_id)
VALUES
    (1, 1),
    (2, 2),
    (2, 1),
    (3, 2);