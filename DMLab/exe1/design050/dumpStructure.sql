-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: empdb
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB-0+deb11u2

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
  `ssn` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`ssn`,`name`),
  CONSTRAINT `deptbl_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `emptbl` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptbl`
--

LOCK TABLES `deptbl` WRITE;
/*!40000 ALTER TABLE `deptbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `deptbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptloc`
--

DROP TABLE IF EXISTS `deptloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptloc` (
  `dno` int(11) NOT NULL,
  `dloc` varchar(50) NOT NULL,
  PRIMARY KEY (`dno`,`dloc`),
  CONSTRAINT `deptloc_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `depttbl` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptloc`
--

LOCK TABLES `deptloc` WRITE;
/*!40000 ALTER TABLE `deptloc` DISABLE KEYS */;
/*!40000 ALTER TABLE `deptloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depttbl`
--

DROP TABLE IF EXISTS `depttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depttbl` (
  `dno` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ssn` int(11) DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  PRIMARY KEY (`dno`),
  KEY `ssn` (`ssn`),
  CONSTRAINT `depttbl_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `emptbl` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depttbl`
--

LOCK TABLES `depttbl` WRITE;
/*!40000 ALTER TABLE `depttbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `depttbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emptbl`
--

DROP TABLE IF EXISTS `emptbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emptbl` (
  `ssn` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  `supssn` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `dno` (`dno`),
  KEY `supssn` (`supssn`),
  CONSTRAINT `emptbl_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `depttbl` (`dno`),
  CONSTRAINT `emptbl_ibfk_2` FOREIGN KEY (`supssn`) REFERENCES `emptbl` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emptbl`
--

LOCK TABLES `emptbl` WRITE;
/*!40000 ALTER TABLE `emptbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `emptbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prgloc`
--

DROP TABLE IF EXISTS `prgloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prgloc` (
  `pid` int(11) NOT NULL,
  `ploc` varchar(50) NOT NULL,
  PRIMARY KEY (`pid`,`ploc`),
  CONSTRAINT `prgloc_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `prgtbl` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prgloc`
--

LOCK TABLES `prgloc` WRITE;
/*!40000 ALTER TABLE `prgloc` DISABLE KEYS */;
/*!40000 ALTER TABLE `prgloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prgtbl`
--

DROP TABLE IF EXISTS `prgtbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prgtbl` (
  `pid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  `stdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `dno` (`dno`),
  CONSTRAINT `prgtbl_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `depttbl` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prgtbl`
--

LOCK TABLES `prgtbl` WRITE;
/*!40000 ALTER TABLE `prgtbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `prgtbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workon`
--

DROP TABLE IF EXISTS `workon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workon` (
  `ssn` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `hour` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssn`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `workon_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `emptbl` (`ssn`),
  CONSTRAINT `workon_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `prgtbl` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workon`
--

LOCK TABLES `workon` WRITE;
/*!40000 ALTER TABLE `workon` DISABLE KEYS */;
/*!40000 ALTER TABLE `workon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-28 20:52:48
