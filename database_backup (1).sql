-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: football_transfer_market
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `club_name` varchar(50) NOT NULL,
  `founding_year` int NOT NULL,
  `stadium_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `comp_id` int DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT '0.00',
  `expendable_budget` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`club_id`),
  KEY `comp_id` (`comp_id`),
  CONSTRAINT `club_ibfk_3` FOREIGN KEY (`comp_id`) REFERENCES `competition` (`comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'Example Club',1950,'Example Stadium','Example Country',1,10000000.00,8000000.00),(2,'barcelona',1886,'Camp Nou','Spain',NULL,0.00,0.00),(3,'Third Club',1980,'Third Stadium','Third Country',3,12000000.00,9600000.00),(7,'Another Club',1965,'Another Stadium','Another Country',2,15000000.00,12000000.00),(8,'FC Barcelona',1899,'Camp Nou','Spain',NULL,0.00,0.00),(9,'Real Madrid',1902,'Santiago Bernabeu','Spain',NULL,0.00,0.00),(10,'Paris Saint-Germain',1970,'Parc des Princes','France',NULL,0.00,0.00);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `club_before_insert_trigger` BEFORE INSERT ON `club` FOR EACH ROW BEGIN
    DECLARE new_expendable_budget DECIMAL(10, 2);

    
    SET new_expendable_budget = NEW.budget * 0.8;

    
    SET NEW.expendable_budget = new_expendable_budget;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competition` (
  `comp_id` int NOT NULL AUTO_INCREMENT,
  `competition_name` varchar(50) NOT NULL,
  `competition_ld` varchar(50) NOT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition`
--

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
INSERT INTO `competition` VALUES (1,'La Liga','Spanish'),(2,'Premier League','English'),(3,'Serie A','Italian');
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `contract_start_date` date NOT NULL,
  `contract_end_date` date NOT NULL,
  `ffp` int NOT NULL,
  `comp_id` int NOT NULL,
  `transfer_id` int DEFAULT NULL,
  `club_id` int DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `comp_id` (`comp_id`),
  KEY `contract_ibfk_transfer` (`transfer_id`),
  KEY `contract_ibfk_club` (`club_id`),
  CONSTRAINT `contract_ibfk_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`),
  CONSTRAINT `contract_ibfk_transfer` FOREIGN KEY (`transfer_id`) REFERENCES `transfer` (`transfer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (4,'2023-08-30','2025-06-30',1,1,1,NULL),(5,'2023-09-15','2025-06-30',2,2,2,NULL),(6,'2023-08-20','2025-06-30',3,3,3,NULL);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `club_id` int DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Pep','Guardiola','1971-01-18','Spain',NULL),(2,'Jurgen','Klopp','1967-06-16','Germany',NULL),(3,'Zinedine','Zidane','1972-06-23','France',NULL);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `club_id` int DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (2,'koushal','kaarthiek','2003-11-05','Indian','Goalkeeper',NULL),(3,'New First Name','New Last Name','1987-06-24','New Nationality','New Position',NULL),(4,'Cristiano','Ronaldo','1985-02-05','Portugal','Forward',NULL),(5,'Neymar','da Silva','1992-02-05','Brazil','Forward',NULL),(6,'Lionel','Messi','1987-06-24','Argentina','Forward',NULL),(7,'Cristiano','Ronaldo','1985-02-05','Portugal','Forward',NULL),(8,'Neymar','da Silva','1992-02-05','Brazil','Forward',NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `transfer_fee` int NOT NULL,
  `transfer_date` date NOT NULL,
  `f_cid` int NOT NULL,
  `pid` int DEFAULT NULL,
  `mid` int DEFAULT NULL,
  `club_id` int DEFAULT NULL,
  PRIMARY KEY (`transfer_id`),
  KEY `new_transfer_ibfk_f_cid` (`f_cid`),
  KEY `transfer_pid_fk` (`pid`),
  KEY `transfer_mid_fk` (`mid`),
  CONSTRAINT `new_transfer_ibfk_f_cid` FOREIGN KEY (`f_cid`) REFERENCES `club` (`club_id`),
  CONSTRAINT `transfer_mid_fk` FOREIGN KEY (`mid`) REFERENCES `manager` (`mid`),
  CONSTRAINT `transfer_pid_fk` FOREIGN KEY (`pid`) REFERENCES `player` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (1,120000000,'2023-08-30',2,NULL,NULL,2),(2,100000000,'2023-09-15',8,NULL,NULL,8),(3,200000000,'2023-08-20',9,NULL,NULL,9),(4,20,'2023-04-05',10,NULL,3,NULL);
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 16:19:24
