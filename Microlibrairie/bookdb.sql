-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 02 avr. 2019 à 18:55
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bookdb`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `BookAddorEdit`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookAddorEdit` (`_id` INT, `_nom` VARCHAR(45), `_auteur` VARCHAR(45), `_description` VARCHAR(250))  BEGIN
	If _id = 0 THEN
    INSERT INTO Book (nom,auteur,descriptions)
    Value(_nom,_auteur,_description);
    else
		Update book
        SET 
			nom = _nom,
            auteur=_auteur,
            descriptions =_description
		WHERE id = _id;
        END if;
END$$

DROP PROCEDURE IF EXISTS `BookDeleteID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookDeleteID` (`_id` INT)  BEGIN
	DELETE FROM book where id = _id;
END$$

DROP PROCEDURE IF EXISTS `BookSearchByValue`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookSearchByValue` (`_SearchValue` VARCHAR(45))  BEGIN
SELECT * from book where nom like CONCAT('%',_SearchValue,'%')||auteur like CONCAT('%',_SearchValue,'%') ;
END$$

DROP PROCEDURE IF EXISTS `BookViewAll`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookViewAll` ()  BEGIN
	SELECT * from book;
END$$

DROP PROCEDURE IF EXISTS `BookViewByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookViewByID` (`_id` INT)  BEGIN
	Select * from book where id = _id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `auteur` varchar(45) NOT NULL,
  `descriptions` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id`, `nom`, `auteur`, `descriptions`) VALUES
(1, '50 nuances de Victor', 'Florient', 'Victor adore se faire masser son prepuce'),
(2, 'Sodomise moi sous la pluie', 'Patrick', 'merci de ne pas preter attention au titre, c\'est une histoire pour enfant'),
(3, 'Blanche neige et les 7 ....', 'Le prince charmant', 'Récit romantique, d\'une femme vivant plusieurs jours chez des nains seul');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
