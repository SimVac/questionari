-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: questionario
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `compila`
--

DROP TABLE IF EXISTS `compila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compila` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risposta` int(11) NOT NULL,
  `idUtente` int(11) NOT NULL,
  `idDomanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compila_domanda_id_fk` (`idDomanda`),
  KEY `compila_utente_id_fk` (`idUtente`),
  CONSTRAINT `compila_domanda_id_fk` FOREIGN KEY (`idDomanda`) REFERENCES `domanda` (`id`),
  CONSTRAINT `compila_utente_id_fk` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compila`
--

LOCK TABLES `compila` WRITE;
/*!40000 ALTER TABLE `compila` DISABLE KEYS */;
INSERT INTO `compila` VALUES (4,5,5,12),(5,7,5,13),(6,2,5,14),(7,7,5,15),(8,1,5,16);
/*!40000 ALTER TABLE `compila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domanda`
--

DROP TABLE IF EXISTS `domanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domanda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordine` int(11) NOT NULL,
  `testo` text DEFAULT NULL,
  `idQuestionario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domanda_questionario_id_fk` (`idQuestionario`),
  CONSTRAINT `domanda_questionario_id_fk` FOREIGN KEY (`idQuestionario`) REFERENCES `questionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domanda`
--

LOCK TABLES `domanda` WRITE;
/*!40000 ALTER TABLE `domanda` DISABLE KEYS */;
INSERT INTO `domanda` VALUES (12,0,'How important do you believe it is to protect the environment?',8),(13,1,'How concerned are you about the impact of climate change on the planet?',8),(14,2,'How effective do you think recycling is in reducing environmental damage?',8),(15,3,'How willing are you to change your lifestyle to reduce your environmental impact?',8),(16,4,'How much do you support government policies aimed at environmental protection?',8),(17,0,'How would you rate the overall quality of education in Italy?',9),(18,1,'How competent do you think the teachers are in Italian schools?',9),(19,2,'How relevant do you find the current curriculum to modern job market needs?',9),(20,3,'How would you rate the quality of educational facilities (e.g., classrooms, libraries, labs) in Italian schools?',9),(21,4,'How effective are student support services (e.g., counseling, career guidance) in Italian schools?',9),(22,5,'How important do you think parental involvement is in the Italian educational system?',9);
/*!40000 ALTER TABLE `domanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionario`
--

DROP TABLE IF EXISTS `questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` text DEFAULT NULL,
  `descrizione` text DEFAULT NULL,
  `data` date NOT NULL,
  `idAutore` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario_utente_id_fk` (`idAutore`),
  CONSTRAINT `questionario_utente_id_fk` FOREIGN KEY (`idAutore`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionario`
--

LOCK TABLES `questionario` WRITE;
/*!40000 ALTER TABLE `questionario` DISABLE KEYS */;
INSERT INTO `questionario` VALUES (8,'Survey on Environmental Awareness and Attitudes','We invite you to participate in a brief survey about your views on environmental issues.','2024-05-23',5),(9,'Italian Educational System','We invite you to share your thoughts on the Italian educational system. Your responses will help us understand public perceptions and identify areas for improvement.','2024-05-23',5);
/*!40000 ALTER TABLE `questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruolo`
--

DROP TABLE IF EXISTS `ruolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruolo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruolo`
--

LOCK TABLES `ruolo` WRITE;
/*!40000 ALTER TABLE `ruolo` DISABLE KEYS */;
INSERT INTO `ruolo` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `ruolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `idRuolo` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `subscriptionDate` date NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `utente_pk` (`mail`),
  KEY `utente_ruolo_id_fk` (`idRuolo`),
  CONSTRAINT `utente_ruolo_id_fk` FOREIGN KEY (`idRuolo`) REFERENCES `ruolo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'pangiorgio.x@gmail.com','$2y$10$dsDWvT7dYu2LnoJupf8CROeZa2eLN4haWTfIfz3D/fLmTnxmPkte6',1,'Simone','Vacca','2024-05-21','2024-05-21','Male','Brescia','I like femboys'),(5,'andrea.scarsato@gmail.com','$2y$10$VS3SI7DDtV/dRMU8xeCH0.NL/I3fNpJYh8HHAokbv0KO8bmZY0FIW',1,'Andrea','Scarsato','2024-05-23','2005-08-06','Male','Brescia','Football (the real one not the american version) enjoyer');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 22:51:05
