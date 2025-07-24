CREATE DATABASE activities;


CREATE TABLE IF NOT EXISTS game (id VARCHAR(10) PRIMARY KEY, vendor INT NOT NULL, name CHAR(20) NOT NULL, price DECIMAL(6,2) NOT NULL);

INSERT INTO game (id, vendor, name, price) VALUES ('371/2209', 1, 'Scrabble', 14.50);
INSERT INTO game (id, vendor, name, price) VALUES ('373/2296', 2, 'Jenga', 6.99);
INSERT INTO game (id, vendor, name, price) VALUES ('303/1199', 22, 'D&D', 26.99);

INSERT INTO game (id, vendor, name, price) VALUES ('360/9659', 1, 'Uno', 11.99), ('373/5372', 3, 'Connect', 5.99), ('370/9470', 3, 'Bingo', 8.99);

CREATE TABLE IF NOT EXISTS vendor (id INT PRIMARY KEY, name CHAR(20) NOT NULL, location CHAR(20) NOT NULL);

INSERT INTO vendor (id, name, location)
VALUES (1, 'Mattel Inc', 'El Segundo, Ca, USA'),
(2, 'Hasbro Inc', 'Pawtucket, RI, USA'),
(3, 'J.W.Spear Plc', 'Enfield, Middx, UK'),
(4, 'Hornby', 'Sandwich, Kent, UK');

SELECT game.id AS ProductCode,
game.name AS Game,
vendor.name AS Vendor,
game.price AS Price
FROM game, vendor;

SELECT game.id AS "Product Code",
game.name AS "Game",
vendor.name AS "Vendor",
game.price AS Price
FROM game, vendor
WHERE vendor.id = game.vendor;

CREATE TABLE game (id VARCHAR(10) PRIMARY KEY, vendor INT NOT NULL REFERENCES vendor(id), name CHAR(20) NOT NULL, price DECIMAL(6,2) NOT NULL);
-- We've already droped both the game and vendor tables and now we're creating the game table back again
-- and it will throw an error because the the vendor table doesn't exist (We've created game table with a
-- foreign key constraint referencing vendor table which will fail)

CREATE TABLE vendor (id INT PRIMARY KEY, name CHAR(20) NOT NULL, location CHAR(20) NOT NULL);

INSERT INTO vendor (id, name, location)
VALUES (1, 'Mattel Inc', 'El Segundo, Ca, USA'),
(2, 'Hasbro Inc', 'Pawtucket, RI, USA'),
(3, 'J.W.Spear Plc', 'Enfield, Middx, UK'),
(4, 'Hornby', 'Sandwich, Kent, UK');

INSERT INTO game (id, vendor, name, price)
VALUES ('371/2209', 1, 'Scrabble', 14.50), ('373/2296', 2,
'Jenga', 6.99),('360/9659', 1, 'Uno', 11.99), ('373/5372', 3,
'Connect', 5.99), ('370/9470', 3, 'Bingo', 8.99), ('303/1199', 22,
'D&D', 26.99);

CREATE TABLE game (
id VARCHAR(10) PRIMARY KEY,
vendor INT NOT NULL REFERENCES vendor(id),
name CHAR(20) NOT NULL,
price DECIMAL(6,2) NOT NULL
);

INSERT INTO game (id, vendor, name, price)
VALUES ('371/2209', 1, 'Scrabble', 14.50), ('373/2296', 2,
'Jenga', 6.99),('360/9659', 1, 'Uno', 11.99), ('373/5372', 3,
'Connect', 5.99), ('370/9470', 3, 'Bingo', 8.99), ('303/1199', 22,
'D&D', 26.99);

SELECT game.id AS ProductCode,
game.name AS Game,
vendor.name AS Vendor,
game.price AS Price
FROM game, vendor;

SELECT game.id AS "Product Code",
game.name AS "Game",
vendor.name AS "Vendor",
game.price AS "Price"
FROM game, vendor
WHERE vendor.id = game.vendor;
