DROP TABLE IF EXISTS paiements;
DROP TABLE IF EXISTS administrateurs;
DROP TABLE IF EXISTS seances; 
DROP TABLE IF EXISTS salles;
DROP TABLE IF EXISTS cinemas;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS tarifs;

CREATE TABLE paiements(
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	modalite varchar(255)NOT NULL
	);

CREATE TABLE cinemas (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nom varchar(255)NOT NULL,
	adresse varchar(255)NOT NULL
	);

CREATE TABLE administrateurs (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nom varchar(255)NOT NULL,
	email varchar(255)NOT NULL,
	id_cinemas int NOT NULL,
	FOREIGN KEY (id_cinemas)
		REFERENCES cinemas (id));
		
CREATE TABLE salles (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	numéro int NOT NULL,
	nombreDePlaces int NOT NULL,
	id_cinemas int NOT NULL,
	FOREIGN KEY (id_cinemas)
		REFERENCES cinemas (id));
	
CREATE TABLE films (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nom varchar(255),
	duree time,
	realisateur varchar(255),
	date_sortie date
	);

CREATE TABLE tarifs (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nom varchar(225),
	prix DECIMAL (6, 2),
	conditions varchar(255));
 
CREATE TABLE seances (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	film varchar(255),
	jour date,
	heure datetime, 
	id_salles int NOT NULL,
	FOREIGN KEY (id_salles)
		REFERENCES salles (id));
	
ALTER TABLE administrateurs 
ADD COLUMN mot_de_passe VARCHAR(255);
	

INSERT INTO paiements (modalite) VALUES 
('Sur place'),
('En ligne');

INSERT INTO cinemas (nom, adresse) VALUES 
('Etoile' , '5 Boulevard Valentine Girardon, 56780 Macon'), 
('Culture' , '7 Avenue des Grands Hommes, 91230 Cannes'), 
('Star' , '7 Avenue Ahamada Djambae, 91230 Lyon'), 
('Culture' , '85 Avenue Salim Hatubou, 91230 Strasbourg'),
('Culture' , '205 Boulevard Jean Dujardin, 91230 Nantes'),
('Le Palace', '2 rue du Triomphe, 12340 Septemes-les-Vallons'),
('Action' , '6 Avenue Charles DeGaulle, 14520 Clichy');


INSERT INTO administrateurs (nom, email, id_cinemas) VALUES 
('Doe', 'johndoe@etoile.com', 1),
('Dawson', 'janedawson@culture.com', 2),
('Star', 'johnystar@etoile.com', 3),
('Spielberg', 'sarahspielberg@culture.com', 4),
('Dupond', 'pierredupond@culture.com',5 ),
('Abbott', 'ashleyabbott@lepalace.com', 6),
('Newman', 'victornewman@action.com', 7),
('Newman', 'victorianewman@action.com', 7),
('Newman', 'nicolasnewman@action.com', 7),
('Newman', 'nickienewman@action.com', 7);


SELECT * FROM administrateurs a ;
UPDATE administrateurs 
SET email = 'johnnystar@star.com'
WHERE id = 3;


INSERT INTO salles (numéro, nombreDePlaces , id_cinemas) VALUES 
(1, 50, 1),
(1, 150, 2),
(1, 90, 3),
(1, 80, 4),
(1, 100, 5),
(1, 120, 6),
(1, 50, 7),
(2, 80, 1),
(2, 50, 3),
(2, 150, 4),
(2, 90, 5),
(2, 80, 6),
(2, 100, 7),
(3, 120, 1),
(3, 50, 2),
(3, 80, 3),
(3, 200, 4),
(3, 50, 5),
(3, 150, 6),
(3, 90, 7),
(4, 80, 1),
(4, 100, 2);

SELECT * FROM salles;

INSERT INTO films (nom, duree, realisateur, date_sortie) VALUES
('Inception', '02:28:00', 'Christopher Nolan', '2010-07-16'),
('The Shawshank Redemption', '02:22:00', 'Frank Darabont', '1994-09-23'),
('Pulp Fiction', '02:34:00', 'Quentin Tarantino', '1994-10-14'),
('The Godfather', '02:55:00', 'Francis Ford Coppola', '1972-03-24'),
('Fight Club', '02:19:00', 'David Fincher', '1999-10-15');

INSERT INTO films (nom, duree, realisateur, date_sortie) VALUES
('Avatar', '02:42:00', 'James Cameron', '2009-12-18'),
('The Dark Knight', '02:32:00', 'Christopher Nolan', '2008-07-18'),
('The Matrix', '02:16:00', 'Lana Wachowski', '1999-03-31'),
('Interstellar', '02:49:00', 'Christopher Nolan', '2014-11-07'),
('Jurassic Park', '02:07:00', 'Steven Spielberg', '1993-06-11');

SELECT * FROM films f ;

INSERT INTO tarifs (nom, prix, conditions) VALUES 
('plein tarif', 9.20, 'tarif de base'),
('Etudiant', 7.60, 'tarif réservé à tout étudiant inscrit dans un établissement d\'études supérieures et ayant une carte étudiant'),
('Moins de 14 ans', 5.90, 'tarif réservé aux mineurs de moins de 14 ans. La carte d\identité pourra être exigée à l\'entrée en salle');


ALTER TABLE seances  DROP COLUMN film;
ALTER TABLE seances  ADD COLUMN id_films int;
ALTER TABLE seances  ADD CONSTRAINT fk_id_films FOREIGN KEY (id_films)REFERENCES films(id);


INSERT INTO seances (id_films, jour, heure, id_salles)
SELECT
    FLOOR(RAND() * 10) + 1, -- Film aléatoire entre 1 et 10
    DATE_ADD(CURDATE(), INTERVAL (FLOOR(RAND() * 30) + 1) DAY), -- Date aléatoire dans les 30 prochains jours
    TIMESTAMP(DATE_ADD(CURDATE(), INTERVAL (FLOOR(RAND() * 30) + 1) DAY), MAKETIME(FLOOR(RAND() * 24), FLOOR(RAND() * 60), 0)), -- Date et heure aléatoires
    FLOOR(RAND() * 22) + 1 -- Salle aléatoire entre 1 et 22
FROM
    (SELECT 1 AS dummy UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS numbers -- Générer 5 séances par film
ORDER BY
    RAND()
LIMIT 100;


SELECT * FROM seances;

DROP TABLE paniers;
CREATE TABLE paniers(
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombredePlaces int,
	montant DECIMAL(6,2)
	id_tarifs int NOT NULL,
	FOREIGN KEY (id_tarifs)
		REFERENCES tarifs (id)
	);


DELETE FROM paniers;
DELETE FROM tarifs; 

INSERT INTO paniers (nombredePlaces, id_tarifs)VALUES 
(3, 1),
(2, 2),
(1, 3);

INSERT INTO paniers (nombredePlaces, id_tarifs, montant)
SELECT p.nombredePlaces, p.id_tarifs, p.nombredePlaces * t.prix
FROM paniers p
INNER JOIN tarifs t
ON p.id_tarifs = t.id ;

SELECT * FROM paniers p  ;


