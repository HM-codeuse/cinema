-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: mysql-hayiri.alwaysdata.net    Database: hayiri_cinema_bdd
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrateurs`
--

DROP TABLE IF EXISTS `administrateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_cinemas` int(11) NOT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cinemas` (`id_cinemas`),
  CONSTRAINT `administrateurs_ibfk_1` FOREIGN KEY (`id_cinemas`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateurs`
--

LOCK TABLES `administrateurs` WRITE;
/*!40000 ALTER TABLE `administrateurs` DISABLE KEYS */;
INSERT INTO `administrateurs` VALUES (1,'Doe','johndoe@etoile.com',1,NULL),(2,'Dawson','janedawson@culture.com',2,NULL),(3,'Star','johnnystar@star.com',3,NULL),(4,'Spielberg','sarahspielberg@culture.com',4,NULL),(5,'Dupond','pierredupond@culture.com',5,NULL),(6,'Abbott','ashleyabbott@lepalace.com',6,NULL),(7,'Newman','victornewman@action.com',7,NULL),(8,'Newman','victorianewman@action.com',7,NULL),(9,'Newman','nicolasnewman@action.com',7,NULL),(10,'Newman','nickienewman@action.com',7,NULL);
/*!40000 ALTER TABLE `administrateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'Etoile','5 Boulevard Valentine Girardon, 56780 Macon'),(2,'Culture','7 Avenue des Grands Hommes, 91230 Cannes'),(3,'Star','7 Avenue Ahamada Djambae, 91230 Lyon'),(4,'Culture','85 Avenue Salim Hatubou, 91230 Strasbourg'),(5,'Culture','205 Boulevard Jean Dujardin, 91230 Nantes'),(6,'Le Palace','2 rue du Triomphe, 12340 Septemes-les-Vallons'),(7,'Action','6 Avenue Charles DeGaulle, 14520 Clichy');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `realisateur` varchar(255) DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Inception','02:28:00','Christopher Nolan','2010-07-16'),(2,'The Shawshank Redemption','02:22:00','Frank Darabont','1994-09-23'),(3,'Pulp Fiction','02:34:00','Quentin Tarantino','1994-10-14'),(4,'The Godfather','02:55:00','Francis Ford Coppola','1972-03-24'),(5,'Fight Club','02:19:00','David Fincher','1999-10-15'),(6,'Avatar','02:42:00','James Cameron','2009-12-18'),(7,'The Dark Knight','02:32:00','Christopher Nolan','2008-07-18'),(8,'The Matrix','02:16:00','Lana Wachowski','1999-03-31'),(9,'Interstellar','02:49:00','Christopher Nolan','2014-11-07'),(10,'Jurassic Park','02:07:00','Steven Spielberg','1993-06-11');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiements`
--

DROP TABLE IF EXISTS `paiements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paiements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modalite` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiements`
--

LOCK TABLES `paiements` WRITE;
/*!40000 ALTER TABLE `paiements` DISABLE KEYS */;
INSERT INTO `paiements` VALUES (1,'Sur place'),(2,'En ligne');
/*!40000 ALTER TABLE `paiements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paniers`
--

DROP TABLE IF EXISTS `paniers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paniers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombredePlaces` int(11) DEFAULT NULL,
  `id_tarifs` int(11) NOT NULL,
  `montant` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tarifs` (`id_tarifs`),
  CONSTRAINT `paniers_ibfk_1` FOREIGN KEY (`id_tarifs`) REFERENCES `tarifs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paniers`
--

LOCK TABLES `paniers` WRITE;
/*!40000 ALTER TABLE `paniers` DISABLE KEYS */;
INSERT INTO `paniers` VALUES (19,3,1,NULL),(20,2,2,NULL),(21,1,3,NULL),(22,3,1,NULL),(23,2,2,NULL),(24,1,3,NULL);
/*!40000 ALTER TABLE `paniers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numéro` int(11) NOT NULL,
  `nombreDePlaces` int(11) NOT NULL,
  `id_cinemas` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cinemas` (`id_cinemas`),
  CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`id_cinemas`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (1,1,50,1),(2,1,150,2),(3,1,90,3),(4,1,80,4),(5,1,100,5),(6,1,120,6),(7,1,50,7),(8,2,80,1),(9,2,50,3),(10,2,150,4),(11,2,90,5),(12,2,80,6),(13,2,100,7),(14,3,120,1),(15,3,50,2),(16,3,80,3),(17,3,200,4),(18,3,50,5),(19,3,150,6),(20,3,90,7),(21,4,80,1),(22,4,100,2);
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seances`
--

DROP TABLE IF EXISTS `seances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jour` date DEFAULT NULL,
  `heure` datetime DEFAULT NULL,
  `id_salles` int(11) NOT NULL,
  `id_films` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_salles` (`id_salles`),
  KEY `fk_id_films` (`id_films`),
  CONSTRAINT `fk_id_films` FOREIGN KEY (`id_films`) REFERENCES `films` (`id`),
  CONSTRAINT `seances_ibfk_1` FOREIGN KEY (`id_salles`) REFERENCES `salles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seances`
--

LOCK TABLES `seances` WRITE;
/*!40000 ALTER TABLE `seances` DISABLE KEYS */;
INSERT INTO `seances` VALUES (1,'2023-06-20','2023-06-30 17:25:00',1,4),(2,'2023-07-01','2023-06-20 00:54:00',11,8),(3,'2023-07-07','2023-06-28 18:53:00',4,6),(4,'2023-07-04','2023-07-06 07:49:00',4,7),(5,'2023-07-11','2023-06-23 11:02:00',16,6);
/*!40000 ALTER TABLE `seances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(225) DEFAULT NULL,
  `conditions` varchar(255) DEFAULT NULL,
  `prix` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifs`
--

LOCK TABLES `tarifs` WRITE;
/*!40000 ALTER TABLE `tarifs` DISABLE KEYS */;
INSERT INTO `tarifs` VALUES (1,'plein tarif','tarif de base',NULL),(2,'Etudiant','tarif réservé à tout étudiant inscrit dans un établissement d\'études supérieures et ayant une carte étudiant',NULL),(3,'Moins de 14 ans','tarif réservé aux mineurs de moins de 14 ans. La carte didentité pourra être exigée à l\'entrée en salle',NULL),(4,'plein tarif','tarif de base',9.20),(5,'Etudiant','tarif réservé à tout étudiant inscrit dans un établissement d\'études supérieures et ayant une carte étudiant',7.60),(6,'Moins de 14 ans','tarif réservé aux mineurs de moins de 14 ans. La carte didentité pourra être exigée à l\'entrée en salle',5.90),(7,'plein tarif','tarif de base',9.20),(8,'Etudiant','tarif réservé à tout étudiant inscrit dans un établissement d\'études supérieures et ayant une carte étudiant',7.60),(9,'Moins de 14 ans','tarif réservé aux mineurs de moins de 14 ans. La carte didentité pourra être exigée à l\'entrée en salle',5.90);
/*!40000 ALTER TABLE `tarifs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hayiri_cinema_bdd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-26 18:01:29
