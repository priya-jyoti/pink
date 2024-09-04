-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.16.34.124    Database: db_exe050
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `deptbl`
--

DROP TABLE IF EXISTS `deptbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptbl` (
  `essn` int NOT NULL,
  `dname` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`essn`,`dname`),
  CONSTRAINT `deptbl_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `emptbl` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptbl`
--

/*!40000 ALTER TABLE `deptbl` DISABLE KEYS */;
INSERT INTO `deptbl` VALUES (110,'Hemma','Feale','2763-03-23','Mother'),(128,'Joker','Male','2763-03-23','Child'),(185,'Ayesha','Female','2763-03-23','Spouse'),(191,'Chandru','Male','2763-03-23','Father');
/*!40000 ALTER TABLE `deptbl` ENABLE KEYS */;

--
-- Table structure for table `deptloc`
--

DROP TABLE IF EXISTS `deptloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptloc` (
  `dno` int NOT NULL,
  `dloc` varchar(255) NOT NULL,
  PRIMARY KEY (`dno`,`dloc`),
  CONSTRAINT `deptloc_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `depttbl` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptloc`
--

/*!40000 ALTER TABLE `deptloc` DISABLE KEYS */;
INSERT INTO `deptloc` VALUES (12,'Bangalore'),(15,'Delhi');
/*!40000 ALTER TABLE `deptloc` ENABLE KEYS */;

--
-- Table structure for table `depttbl`
--

DROP TABLE IF EXISTS `depttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depttbl` (
  `dno` int NOT NULL,
  `dname` varchar(255) DEFAULT NULL,
  `mgrstartdate` date DEFAULT NULL,
  `mgrssn` int DEFAULT NULL,
  PRIMARY KEY (`dno`),
  KEY `mgrssn` (`mgrssn`),
  CONSTRAINT `depttbl_ibfk_1` FOREIGN KEY (`mgrssn`) REFERENCES `emptbl` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depttbl`
--

/*!40000 ALTER TABLE `depttbl` DISABLE KEYS */;
INSERT INTO `depttbl` VALUES (12,'Finance','2012-02-03',121),(15,'R&D','2010-02-03',110);
/*!40000 ALTER TABLE `depttbl` ENABLE KEYS */;

--
-- Table structure for table `emptbl`
--

DROP TABLE IF EXISTS `emptbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emptbl` (
  `ssn` int NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `adr` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `dno` int DEFAULT NULL,
  `supssn` int DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `dno` (`dno`),
  KEY `supssn` (`supssn`),
  CONSTRAINT `emptbl_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `depttbl` (`dno`),
  CONSTRAINT `emptbl_ibfk_2` FOREIGN KEY (`supssn`) REFERENCES `emptbl` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emptbl`
--

/*!40000 ALTER TABLE `emptbl` DISABLE KEYS */;
INSERT INTO `emptbl` VALUES (100,'naruto','uzumaki','Konoha','1997-05-23',32627.26,15,191),(110,'John','Kreinski','NY','1977-12-12',636227.26,15,100),(121,'Karen','Page','NY','1975-11-15',93627.26,12,191),(128,'Sasuke','Uchiha','Konoha','1995-01-25',63627.26,12,100),(141,'Helen','Rougue','Bangalore','1945-12-05',593627.26,15,191),(151,'Luke','Cage','Bangalore','1955-12-05',593627.26,12,100),(185,'Tom','Cruise','NY','1965-11-05',43627.26,15,100),(191,'Ichigo','Kurosaki','Bangalore','1955-12-05',593627.26,12,100);
/*!40000 ALTER TABLE `emptbl` ENABLE KEYS */;

--
-- Table structure for table `prgtbl`
--

DROP TABLE IF EXISTS `prgtbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prgtbl` (
  `pid` int NOT NULL,
  `pname` varchar(255) NOT NULL,
  `dno` int DEFAULT NULL,
  `pstdate` date DEFAULT NULL,
  `pendate` date DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `dno` (`dno`),
  CONSTRAINT `prgtbl_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `depttbl` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prgtbl`
--

/*!40000 ALTER TABLE `prgtbl` DISABLE KEYS */;
INSERT INTO `prgtbl` VALUES (2,'Food Wastage',15,'2022-01-15','2023-10-15',43242.23),(3,'Plastic Wastage',15,'2021-10-15','2022-06-15',244234.43),(4,'Stock Prediction',12,'2019-10-15','2020-06-15',544234.43),(5,'Money Wastage',15,'2022-10-15','2024-02-15',544234.43);
/*!40000 ALTER TABLE `prgtbl` ENABLE KEYS */;

--
-- Table structure for table `proloc`
--

DROP TABLE IF EXISTS `proloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proloc` (
  `pid` int NOT NULL,
  `ploc` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`,`ploc`),
  CONSTRAINT `proloc_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `prgtbl` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proloc`
--

/*!40000 ALTER TABLE `proloc` DISABLE KEYS */;
INSERT INTO `proloc` VALUES (2,'Chennai'),(4,'Bangalore'),(4,'Mumbai'),(4,'Mysore'),(5,'Chennai');
/*!40000 ALTER TABLE `proloc` ENABLE KEYS */;

--
-- Table structure for table `workon`
--

DROP TABLE IF EXISTS `workon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workon` (
  `essn` int NOT NULL,
  `pid` int NOT NULL,
  `hour` int DEFAULT NULL,
  PRIMARY KEY (`essn`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `workon_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `emptbl` (`ssn`),
  CONSTRAINT `workon_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `prgtbl` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workon`
--

/*!40000 ALTER TABLE `workon` DISABLE KEYS */;
INSERT INTO `workon` VALUES (128,3,200),(151,2,200),(151,3,500),(151,5,200),(185,2,500),(185,3,500),(185,5,500),(191,4,500);
/*!40000 ALTER TABLE `workon` ENABLE KEYS */;

--
-- Dumping routines for database 'db_exe050'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-17  9:44:10
