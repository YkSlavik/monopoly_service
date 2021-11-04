DROP TABLE IF EXISTS SavedPlayerGame;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Game(GameID, time)
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

-- Player(PlayerID, email, name)
CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

-- PlayerGame(GameID, PlayerID, score)
CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	score integer
);

-- Property(name, house, hotel, location)
CREATE TABLE Property (
	name varchar(50) PRIMARY KEY,
	house integer,
	hotel integer,
	location integer
	);

-- SavedPlayerGame(GameID, PlayerID, cash, property)
CREATE TABLE SavedPlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	cash integer,
	property varchar(50) REFERENCES Property(name)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON SavedPlayerGame TO PUBLIC;


-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player VALUES (1, 'me@calvin.edu', 'new name');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'DogBark');
INSERT INTO Player VALUES (4, 'cat@gmail.edu', 'Catfish');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);

INSERT INTO Property(name, house, hotel, location) VALUES ('Moscow', 3, 1, 10);
INSERT INTO Property VALUES ('London', 2, 2, 10);

INSERT INTO SavedPlayerGame VALUES (1, 1, 150, 'Moscow');
INSERT INTO SavedPlayerGame VALUES (2, 2, 200, 'London');
