-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: portale_cinema
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_utente` int NOT NULL,
  `id_spettacolo` int NOT NULL,
  `data_acquisto` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_utente` (`id_utente`),
  KEY `id_spettacolo` (`id_spettacolo`),
  CONSTRAINT `acquisto_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acquisto_ibfk_2` FOREIGN KEY (`id_spettacolo`) REFERENCES `spettacolo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titolo` varchar(100) NOT NULL,
  `descrizione` text,
  `link_trailer` varchar(255) DEFAULT NULL,
  `durata` int NOT NULL,
  `data_uscita` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giudizio`
--

DROP TABLE IF EXISTS `giudizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giudizio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_utente` int NOT NULL,
  `id_film` int DEFAULT NULL,
  `stelle` int DEFAULT NULL,
  `commento` text,
  `data_giudizio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_utente` (`id_utente`,`id_film`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `giudizio_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE,
  CONSTRAINT `giudizio_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE SET NULL,
  CONSTRAINT `giudizio_chk_1` CHECK ((`stelle` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giudizio`
--

LOCK TABLES `giudizio` WRITE;
/*!40000 ALTER TABLE `giudizio` DISABLE KEYS */;
/*!40000 ALTER TABLE `giudizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oggetto` varchar(100) NOT NULL,
  `messaggio` text NOT NULL,
  `data_invio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto`
--

DROP TABLE IF EXISTS `posto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `id_sala` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`,`id_sala`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `posto_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto`
--

LOCK TABLES `posto` WRITE;
/*!40000 ALTER TABLE `posto` DISABLE KEYS */;
/*!40000 ALTER TABLE `posto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto_acquistato`
--

DROP TABLE IF EXISTS `posto_acquistato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto_acquistato` (
  `id_acquisto` int NOT NULL,
  `id_posto` int NOT NULL,
  PRIMARY KEY (`id_acquisto`,`id_posto`),
  KEY `id_posto` (`id_posto`),
  CONSTRAINT `posto_acquistato_ibfk_1` FOREIGN KEY (`id_acquisto`) REFERENCES `acquisto` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posto_acquistato_ibfk_2` FOREIGN KEY (`id_posto`) REFERENCES `posto` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto_acquistato`
--

LOCK TABLES `posto_acquistato` WRITE;
/*!40000 ALTER TABLE `posto_acquistato` DISABLE KEYS */;
/*!40000 ALTER TABLE `posto_acquistato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spettacolo`
--

DROP TABLE IF EXISTS `spettacolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spettacolo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_sala` int NOT NULL,
  `data` date NOT NULL,
  `orario` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_film` (`id_film`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `spettacolo_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `spettacolo_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spettacolo`
--

LOCK TABLES `spettacolo` WRITE;
/*!40000 ALTER TABLE `spettacolo` DISABLE KEYS */;
/*!40000 ALTER TABLE `spettacolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `consenso_newsletter` tinyint(1) DEFAULT '0',
  `data_registrazione` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
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

-- Dump completed on 2025-03-24 11:01:22
