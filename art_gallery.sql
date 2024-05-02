-- Art Gallery 
-- Project by Francesca Mancuso
-- Course: Introduction to Databases and SQL by Code First Girls
-- April-May 2024

-- ---------------------------------------------------------------- CREATE ----------------------------------------------------------------

-- DROP database art_gallery;

CREATE database art_gallery;

USE art_gallery;

CREATE TABLE categories(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE countries(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    phone_code VARCHAR(5)    
);

CREATE TABLE artists(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    dob DATE,
    phone VARCHAR(20),
    email VARCHAR(255),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE artworks(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    year YEAR,
    price DECIMAL(9,2)    
);

CREATE TABLE artwork_artist(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artwork_id INT,
    artist_id INT,
    FOREIGN KEY (artwork_id) REFERENCES artworks(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE catalog(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category_id INT,
	artwork_artist_id INT,
	FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (artwork_artist_id) REFERENCES artwork_artist(id)
);

-- this is only for the event
CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW()
);

-- ---------------------------------------------------------------- POPULATE ----------------------------------------------------------------

INSERT INTO countries (name, phone_code)
VALUES
	('Australia', '+61'),
	('Canada', '+1'),
	('China', '+86'),
	('Denmark', '+45'),
	('Finland', '+358'),
	('France', '+33'),
	('Germany', '+49'),
	('Greece', '+30'),
	('Italy', '+39'),
	('Japan', '+81'),
	('Netherlands', '+31'),
	('South Korea', '+82'),
	('Spain', '+34'),
	('Sweden', '+46'),
	('United Kingdom', '+44'),
	('USA', '+1');
 
INSERT INTO categories (name)
VALUES
    ('AI Art'),
    ('Architecture'),
    ('Ceramics'),
    ('Comics'),
    ('Design'),
    ('Digital Art'),
    ('Drawing'),
    ('Ink'),
    ('Installation Art'),
    ('Mixed Media'),
    ('Painting'),
    ('Photography'),
    ('Print'),
    ('Sculpture'),
    ('Textile Art'),
    ('Video');
    
INSERT INTO artists (first_name, surname, dob, phone, email, country_id)
VALUES
    ('Alice', 'Smith', '1990-10-15', '686-643-1234', 'alice_artist@example.com', (SELECT id FROM countries WHERE name = 'Australia')),
    ('Bob', 'Johnson', '1988-05-20', '416-555-7890', 'bob_artist@example.com', (SELECT id FROM countries WHERE name = 'Canada')),
    ('Charlie', 'Wang', '1992-03-12', '86-10-12345678', 'charlie_artist@example.com', (SELECT id FROM countries WHERE name = 'China')),
    ('Jenny', 'Lee', '1930-03-19', '86-10-10085678', 'charlie_artist@example.com', (SELECT id FROM countries WHERE name = 'China')),
    ('David', 'Larsen', '1985-09-05', '45-20-987654', 'david_artist@example.com', (SELECT id FROM countries WHERE name = 'Denmark')),
    ('Eva', 'Korhonen', '1987-11-25', '358-40-1234567', 'eva_artist@example.com', (SELECT id FROM countries WHERE name = 'Finland')),
    ('Frank', 'Dupont', '1993-07-18', '33-1-23456789', 'frank_artist@example.com', (SELECT id FROM countries WHERE name = 'France')),
    ('Marie', 'Dupont', '1998-12-08', '33-1-89056789', 'marie_artist@example.com', (SELECT id FROM countries WHERE name = 'France')),
    ('Grace', 'Müller', '1989-04-30', '49-30-98765432', 'grace_artist@example.com', (SELECT id FROM countries WHERE name = 'Germany')),
    ('Hannah', 'Papadopoulos', '1991-12-08', '30-210-5555555', 'hannah_artist@example.com', (SELECT id FROM countries WHERE name = 'Greece')),
    ('Isaac', 'Rossi', '1986-08-03', '39-02-12345678', 'isaac_artist@example.com', (SELECT id FROM countries WHERE name = 'Italy')),
    ('Francesca', 'Verdi', '1960-11-19', '39-02-12345678', 'francesca_artist@example.com', (SELECT id FROM countries WHERE name = 'Italy')),
    ('Julia', 'Tanaka', '1994-02-22', '81-3-9876-5432', 'julia_artist@example.com', (SELECT id FROM countries WHERE name = 'Japan')),
    ('Masaru', 'Kato', '1949-02-18', '81-3-9876-5782', 'julia_artist@example.com', (SELECT id FROM countries WHERE name = 'Japan')),
    ('Kevin', 'De Vries', '1990-06-10', '31-20-9876543', 'kevin_artist@example.com', (SELECT id FROM countries WHERE name = 'Netherlands')),
    ('Lena', 'Kim', '1984-07-29', '82-2-123-4567', 'lena_artist@example.com', (SELECT id FROM countries WHERE name = 'South Korea')),
    ('Roy', 'Kim', '1978-07-11', '82-2-123-5930', 'roy_artist@example.com', (SELECT id FROM countries WHERE name = 'South Korea')),
    ('Michael', 'García', '1983-01-05', '34-91-9876543', 'michael_artist@example.com', (SELECT id FROM countries WHERE name = 'Spain')),
    ('Nina', 'Lindberg', '1988-11-15', '46-8-1234567', 'nina_artist@example.com', (SELECT id FROM countries WHERE name = 'Sweden')),
    ('Oliver', 'Smith', '1962-06-28', '44-20-7654321', 'oliver_artist@example.com', (SELECT id FROM countries WHERE name = 'United Kingdom')),
    ('Jenny', 'Carter', '1977-07-22', '1-212-555-1234', 'pamela_artist@example.com', (SELECT id FROM countries WHERE name = 'USA')),
    ('Pamela', 'Johnson', '1981-04-17', '1-212-555-1234', 'pamela_artist@example.com', (SELECT id FROM countries WHERE name = 'USA'));
    
INSERT INTO artworks (title, description, year, price)
VALUES
	('Dreamscape', 'Futuristic digital creation using artificial intelligence', 2020, 10000.50), -- AI Art
	('Ethereal Towers', 'Architectural masterpiece capturing form and function', 2015, 50000.75), -- Architecture
	('Clay Whispers', 'Handcrafted ceramic sculpture with intricate details', 2018, 2500.25), -- Ceramics
	('Comic Quest', 'Illustrated comic strip exploring humor and storytelling', 2010, 1500.00), -- Comics
	('Design Fusion', 'Functional and aesthetically pleasing product design', 2019, 8000.00), -- Design
	('Digital Odyssey', 'Immersive digital artwork blending colors and shapes', 2021, 12000.99), -- Digital Art
	('Pencil Reverie', 'Detailed pencil sketch capturing realism or abstraction', 2017, 3500.50), -- Drawing
	('Ink Enigma', 'Bold ink work with expressive lines and contrast', 2016, 1800.75), -- Ink
	('Spatial Mirage', 'Interactive and site-specific art installation', 2014, 60000.25), -- Installation Art
	('Fusion Canvas', 'Collage of various materials creating visual layers', 2013, 4500.00), -- Mixed Media
	('Chromatic Symphony', 'Canvas painting exploring color, texture, and emotion', 2012, 7000.00), -- Painting
	('Lens Reverie', 'Captured moments frozen in time through the lens', 2011, 5500.99), -- Photography
	('Printed Echo', 'Limited edition print of an original artwork', 2009, 3000.50), -- Print
	('Stone Serenity', 'Three-dimensional form carved or molded from materials', 2008, 20000.75), -- Sculpture
	('Fabric Whispers', 'Fabric-based art incorporating weaving or embroidery', 2007, 4000.25), -- Textile Art
	('Temporal Frames', 'Moving image or animation conveying a narrative', 2006, 15000.00), -- Video
    ('Whimsical Code', 'A playful digital artwork combining code snippets and abstract shapes', 2019, 7500.25), -- Digital Art
    ('Crystal Ascent', 'A ceramic sculpture resembling crystalline growth and organic forms', 2016, 3200.50), -- Ceramics
    ('Urban Rhapsody', 'An ink illustration capturing the energy and chaos of a bustling cityscape', 2014, 1800.75), -- Drawing
    ('Luminous Threads', 'An installation art piece using fiber optics to create an otherworldly glow', 2017, 55000.99), -- Installation Art
    ('Echoes of Time', 'A mixed media artwork combining vintage photographs, acrylic paint, and collage elements', 2015, 4200.00); -- Mixed Media  

INSERT INTO artwork_artist (artwork_id, artist_id)
-- some artworks were made by more than one artist
-- some artists made more than one artwork
VALUES
	(1,8),
    (2,9),
    (3,18),    
    (3,22),
    (4,10),
    (5,19),
    (6,2),
    (7,4),   
    (8,9),
    (8,5),
    (9,13),
    (10,14),
    (11,3),
    (12,20),
    (13,11),
    (14,12),
    (15,1),
    (16,17),
    (17,7),
    (18,21),
    (19,15),
    (20,6),
    (21,8),
    (21,16);

INSERT INTO catalog (category_id, artwork_artist_id)
VALUES
	(1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5),
    (6,6),
    (7,7),
    (8,8),
    (9,9),
    (10,10),
    (11,11),
    (12,12),
    (13,13),
    (14,14),
    (15,15),
    (16,16),
    -- some categories have more than one work
    (6,17),
    (3,18),
    (7,19),
    (9,20),
    (10,21),
    -- some works belong to more than one category
    (10,9),
    (9,17);
    -- some works may be present in artworks and artwork_artist tables but not in catalog
    
-- --------------------------------------------------------------------- QUERIES -------------------------------------------------------------------------
	
    USE art_gallery;
    SELECT * from countries;
    SELECT * from categories;
    SELECT * from artists;
    SELECT * from artworks;
    SELECT * from artwork_artist;   
    SELECT * from catalog;
    
-- ---------------------------------------------------------------- JOIN ------------------------------------------------------------------------------------

-- Show entries in catalog as artist's name, artist's surname, artist's country, artwork title, artwork price, category
-- Ordered by artist's surname
-- Also there are JOIN queries in artworks_in_catalog function and one of the queries using GROUP BY

SELECT
    c.id AS catalog_id,
    ar.first_name AS artist_name,
    ar.surname AS artist_surname,
    co.name AS artist_country,
    aw.title AS artwork_title,    
    aw.price AS artwork_price,
    cat.name AS artwork_category
FROM catalog AS c
JOIN artwork_artist AS aa ON c.artwork_artist_id = aa.id
JOIN artists AS ar ON aa.artist_id = ar.id
JOIN countries AS co ON ar.country_id = co.id
JOIN artworks AS aw ON aa.artwork_id = aw.id
JOIN categories AS cat ON c.category_id = cat.id
ORDER BY artist_surname ASC;

-- ---------------------------------------------------------------- SUBQUERIES -----------------------------------------------------------------------------------

-- Select name and surname of artists in artwork_artist whose work cost less than 3000
-- NB this doesn't necessarily mean they are in the catalog

SELECT a.first_name, a.surname
FROM artists AS a 
WHERE a.id IN (
	SELECT aa.artist_id 
	FROM artwork_artist AS aa 
	WHERE aa.artwork_id IN (
		SELECT w.id 
		FROM artworks AS w
		WHERE w.price < 3000
		)
);

-- Select name and surname of artists in artwork_artist who make mixed media art
-- NB this doesn't necessarily mean they are in the catalog

SELECT a.id, a.first_name, a.surname, a.email
FROM artists AS a 
WHERE a.id IN (
	SELECT aa.artist_id 
	FROM artwork_artist AS aa 
	WHERE aa.id IN (
		SELECT c.artwork_artist_id 
		FROM catalog AS c
		WHERE c.category_id = 10
		)
);
    
-- ---------------------------------------------------------------- FUNCTION -----------------------------------------------------------------------------------

-- tell me how many artworks from the same artist are in artwork_artist -----------------------------------------------------
-- NB this doesn't mean that they are in catalog

DELIMITER //
CREATE FUNCTION n_artworks_by_artist (
	artist_id INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE n_artworks INT;
	SET n_artworks = 	(
						SELECT COUNT(aa.artwork_id) 
						FROM artwork_artist AS aa
						WHERE aa.artist_id = artist_id
						);
	RETURN n_artworks;
END //
DELIMITER ;

SELECT a.id, a.first_name, a.surname, n_artworks_by_artist(a.id)
FROM artists AS a
ORDER BY a.surname;

-- tell me how many artist per artwork are in artwork_artist -----------------------------------------------------
-- NB this doesn't mean that they are in catalog

DELIMITER //
CREATE FUNCTION n_artists_per_artwork (
	artwork_id INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE n_artists INT;
	SET n_artists = 	(
						SELECT COUNT(artwork_artist.artist_id) 
						FROM artwork_artist
						WHERE artwork_artist.artwork_id = artwork_id
						);
	RETURN n_artists;
END //
DELIMITER ;

SELECT w.title, n_artists_per_artwork(w.id)
FROM artworks AS w
ORDER BY w.title;

-- tell me how many artworks are in the catalog -----------------------------------------------------
-- some artworks may not be in catalog even if they exists in artworks and artwork_artist tables

DELIMITER //
CREATE FUNCTION artworks_in_catalog ()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE n_artworks INT;
    SET n_artworks = (
		SELECT COUNT(DISTINCT a.id) 
		FROM catalog AS c
		JOIN artwork_artist AS aa ON c.artwork_artist_id = aa.id
		JOIN artworks AS a ON aa.artwork_id = a.id
	);	 	
	RETURN n_artworks;
END //
DELIMITER ;  

SELECT artworks_in_catalog();
SELECT id, title FROM artworks;
SELECT id, artwork_id FROM artwork_artist;
SELECT id, artwork_artist_id FROM catalog;


-- ---------------------------------------------------------------- STORED PROCEDURES ------------------------------------------------------------------------------

-- Add a new country to the countries table -----------------------------------------------------

DELIMITER //
CREATE PROCEDURE add_country (
	country_name VARCHAR(255),
    calling_code VARCHAR(5)
)
BEGIN
	INSERT INTO countries (name, phone_code)
    VALUES
    (country_name, calling_code);
END //
DELIMITER ;

CALL add_country('Switzerland', '+41');
SELECT * from countries;

-- Remove all entries from a certain category in catalog -----------------------------------------------------

DELIMITER //
CREATE PROCEDURE remove_category_from_catalog (	
    category_id_to_remove INT
)
BEGIN
	DELETE FROM catalog 
    WHERE category_id = category_id_to_remove;
END //
DELIMITER ;

SELECT * from catalog WHERE category_id = 10;
CALL remove_category_from_catalog(10);

-- ---------------------------------------------------------------- TRIGGER -----------------------------------------------------------------------------------

-- capitalise the first letter of name and surname when adding new values or updating them

CREATE TRIGGER upper_name_insert 
    BEFORE INSERT ON artists 
    FOR EACH ROW
    SET new.first_name = CONCAT(UPPER(SUBSTRING(new.first_name, 1, 1)), LOWER(SUBSTRING(new.first_name, 2))),
    new.surname = CONCAT(UPPER(SUBSTRING(new.surname, 1, 1)), LOWER(SUBSTRING(new.surname, 2)));

CREATE TRIGGER upper_name_update
    BEFORE UPDATE ON artists 
    FOR EACH ROW
    SET new.first_name = CONCAT(UPPER(SUBSTRING(new.first_name, 1, 1)), LOWER(SUBSTRING(new.first_name, 2))),
    new.surname = CONCAT(UPPER(SUBSTRING(new.surname, 1, 1)), LOWER(SUBSTRING(new.surname, 2)));

INSERT INTO artists (first_name, surname, dob, phone, email, country_id)
VALUES
    ('DONNA', 'robertS', '1976-11-09', '6786-773-7309', 'donna_artist@example.com', (SELECT id FROM countries WHERE name = 'Australia'));    
SELECT * FROM artists WHERE first_name = 'Donna';    

--  disable safe update mode for your current session
SET SQL_SAFE_UPDATES = 0;

UPDATE artists
SET first_name = 'MaRiNa', email = 'marina_artist@example.com'
WHERE first_name = 'Donna';    

--  reset safe update mode to 1
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM artists WHERE first_name = 'Donna';
SELECT * FROM artists WHERE first_name = 'Marina';

-- ----------------------------------------------------------------EVENT -----------------------------------------------------------------------------------

-- count number of artworks in the catalog every minute
-- deletes records older than 15 minutes

DELIMITER //
CREATE EVENT counting_artworks
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
DO 
BEGIN
   INSERT INTO logs(message)
   VALUES(CONCAT('There are ', artworks_in_catalog(), ' artworks in catalog at ' , NOW()));
   --  disable safe update mode for your current session
   SET SQL_SAFE_UPDATES = 0;
   DELETE FROM logs
   WHERE created_at < NOW() - INTERVAL 15 MINUTE;
   --  reset safe update mode to 1
   SET SQL_SAFE_UPDATES = 1;
END//
DELIMITER ; 

SELECT * FROM logs;
SELECT COUNT(*) FROM logs; 

-- ----------------------------------------------------------------VIEW USING 3-4 TABLES AT LEAST -----------------------------------------------------------

-- reusing the join query because it's useful

CREATE VIEW full_catalog_view
AS 
	SELECT
    c.id AS catalog_id,
    ar.first_name AS artist_name,
    ar.surname AS artist_surname,
    co.name AS artist_country,
    aw.title AS artwork_title,    
    aw.price AS artwork_price,
    cat.name AS artwork_category
	FROM catalog AS c
	JOIN artwork_artist AS aa ON c.artwork_artist_id = aa.id
	JOIN artists AS ar ON aa.artist_id = ar.id
	JOIN countries AS co ON ar.country_id = co.id
	JOIN artworks AS aw ON aa.artwork_id = aw.id
	JOIN categories AS cat ON c.category_id = cat.id
	ORDER BY artist_surname ASC;

SELECT * from full_catalog_view;

-- ----------------------------------------------------------------QUERY WITH GROUP BY  ----------------------------------------------------------------------

-- Some artworks have more than one author, so show list of artworks in artwork_artist, group by title
-- NB this doesn't mean that they are in catalog
    
SELECT aw.title, COUNT(aa.artist_id) AS num_artists
FROM artwork_artist AS aa
JOIN artworks AS aw ON aa.artwork_id = aw.id
GROUP BY aw.title
ORDER BY num_artists DESC;

-- Show number of artworks for category in catalog, using the view created above

SELECT fc.artwork_category, COUNT(DISTINCT fc.artwork_title) 
FROM full_catalog_view as fc
GROUP BY fc.artwork_category
ORDER BY COUNT(DISTINCT fc.artwork_title) DESC;
