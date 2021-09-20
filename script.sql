
--Exercice 1
CREATE DATABASE IF NOT EXISTS `stockimages` CHARACTER SET 'utf8';

--Exercice 2
USE `stockimages`;
DROP DATABASE IF EXISTS `stockimages`;
-- Commande "dangereuse" à bien vérifier avant d'executer 

--Exercice 3
CREATE DATABASE IF NOT EXISTS `mediabank` CHARACTER SET 'utf8';

--Exercice 4
CREATE USER 'rene'@'localhost' IDENTIFIED BY 'azerty';
GRANT ALL PRIVILEGES ON * . * TO 'rene'@'localhost';

-- Exemples :
CREATE USER 'nomutilisateur'@'serveur' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON `basededonnees` . `table` TO 'nomutilisateur'@'serveur';
-- Le  % désigne le serveur local ET le distant.
CREATE USER 'nomutilisateur'@'%' IDENTIFIED BY 'password';

-- Correction :
CREATE USER 'rene'@'localhost' IDENTIFIED BY 'azerty';
GRANT ALL PRIVILEGES ON `mediabank` . * TO 'rene'@'localhost';

--Exercice 5
CREATE TABLE `images` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(50),
    `link` VARCHAR(255),
    `width` INT,
    `height` INT,
    `format` VARCHAR(5),
    `description` TEXT,
    `publicationDate` DATE,
    PRIMARY KEY (`id`)
);
-- Une autre façon de l'écrire :
USE `mediabank`;
CREATE TABLE `images` (
    `id` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -- Not null permet de dire que la colonne ne sera jamais nulle (contrainte)
    `name` VARCHAR(50),
    `link` VARCHAR(255),
    `width` INT,
    `height` INT,
    `format` VARCHAR(5),
    `description` TEXT,
    `publicationDate` DATE
    -- (NOM DE COLONNE + LE TYPE + LES CONTRAINTES)
);

CREATE TABLE `videos` (
	`id` INT AUTO_INCREMENT NOT NULL,
	`name` VARCHAR(50),
	`link` VARCHAR(255),
	`duration` TIME,
	`description` TEXT,
	`publicationDate` DATE,
    PRIMARY KEY (`id`)
);

 --Exercice 6
INSERT INTO `images` (`name`, `link`, `width`, `height`, `format`, `description`, `publicationDate`)
VALUES 
('orwellPortrait', 'https://upload.wikimedia.org/wikipedia/commons/7/7e/George_Orwell_press_photo.jpg', 1176, 1596, 'jpg', 'Portrait de l’auteur George Orwell', '2020-05-10'),
('steinbeckPortrait', 'https://live.staticflickr.com/525/18306511889_1c9606e8ea_z.jpg', 640, 476, 'jpg', 'Portrait de l’auteur John Steinbeck', '2020-01-02');

SELECT * FROM `images`;

INSERT INTO `videos` (`name`, `link`, `duration`, `description`, `publicationDate`)
VALUES 
('1984_trailer', 'https://www.youtube.com/watch?v=Z4rBDUJTnNU&t=4s', '00:02:39', 'Bande annonce du film 1984', '2020-05-15'),
('micemen_trailer', 'https://www.youtube.com/watch?v=2QnM6hsXxNE', '00:10:41', 'Bande annonce du film des Souris et des hommes', '2020-01-02');

SELECT * FROM `videos`;

-- Affichage uniquement
SELECT * FROM `images`;
SELECT * FROM `videos`;


 --Exercice 7
UPDATE `images` SET `publicationDate` = '2021-08-30' WHERE `id` = 1;
-- Version où on affiche toutes les colonnes sauf l'ID
SELECT `name` , `link` , `width`, `height` , `format` , `description` , `publicationDate` FROM `images` WHERE `id` = 1;
-- Version où on affiche toutes les colonnes
UPDATE `videos` SET `duration` = '00:01:41' WHERE `id` = 2;
SELECT * FROM `videos` WHERE `id` = 2;

--Exercice 8
DELETE FROM `images`
WHERE `id` = 2;

DELETE FROM `videos`
WHERE `id` = 1;

--Exercice 9
DROP TABLE `videos`;