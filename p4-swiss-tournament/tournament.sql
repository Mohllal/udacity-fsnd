-- Table definitions for the tournament project.

DROP DATABASE IF EXISTS tournamentdb;

CREATE DATABASE tournamentdb;
\c tournamentdb;

DROP TABLE IF EXISTS tournament;
CREATE TABLE tournament (
  name VARCHAR NOT NULL UNIQUE,
  endDate DATE NOT NULL,
  startDate DATE NOT NULL DEFAULT current_date,
  id SERIAL NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS player;
CREATE TABLE player(
  name VARCHAR NOT NULL,
  birthDate DATE NOT NULL,
  tournamentId SERIAL REFERENCES tournament (id) ON UPDATE CASCADE ON DELETE CASCADE,
  id SERIAL NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS match;
CREATE TABLE match(
  tournamentId SERIAL REFERENCES tournament (id) ON UPDATE CASCADE ON DELETE CASCADE,
  winnerId SERIAL REFERENCES player (id) ON UPDATE CASCADE ON DELETE CASCADE,
  loserId SERIAL REFERENCES player (id) ON UPDATE CASCADE ON DELETE CASCADE,
  id SERIAL NOT NULL PRIMARY KEY
);