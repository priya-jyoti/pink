-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 172.16.34.124    Database: db_prg1_mca018
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
-- Table structure for table `DEPARTMENT`
--

DROP TABLE IF EXISTS `DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPARTMENT` (
  `dname` varchar(20) DEFAULT NULL,
  `dnumber` int NOT NULL,
  `mgr_ssn` int DEFAULT NULL,
  `mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`dnumber`),
  KEY `mgr_ssn` (`mgr_ssn`),
  CONSTRAINT `DEPARTMENT_ibfk_1` FOREIGN KEY (`mgr_ssn`) REFERENCES `EMPLOYEE` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `DEPARTMENT` VALUES ('RnD',101,1,'2010-03-03'),('finance',102,2,'2010-03-03'),('operations',103,3,'2019-04-12'),('sales',104,4,'2020-05-22');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;

--
-- Table structure for table `DEPENDENT`
--

DROP TABLE IF EXISTS `DEPENDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPENDENT` (
  `essn` int NOT NULL,
  `dependent_name` varchar(10) NOT NULL,
  `sex` char(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `relationship` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`essn`,`dependent_name`),
  CONSTRAINT `DEPENDENT_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `EMPLOYEE` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDENT`
--

/*!40000 ALTER TABLE `DEPENDENT` DISABLE KEYS */;
INSERT INTO `DEPENDENT` VALUES (1,'ch1','M','2012-12-02','son'),(1,'ch2','F','2010-09-02','daughter'),(1,'wi1','F','1999-04-22','wife'),(2,'child1','M','2002-02-14','son'),(3,'child','M','2020-07-12','son');
/*!40000 ALTER TABLE `DEPENDENT` ENABLE KEYS */;

--
-- Table structure for table `DEPT_LOCATION`
--

DROP TABLE IF EXISTS `DEPT_LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPT_LOCATION` (
  `dnumber` int NOT NULL,
  `dlocation` varchar(30) NOT NULL,
  PRIMARY KEY (`dnumber`,`dlocation`),
  CONSTRAINT `DEPT_LOCATION_ibfk_1` FOREIGN KEY (`dnumber`) REFERENCES `DEPARTMENT` (`dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATION`
--

/*!40000 ALTER TABLE `DEPT_LOCATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEPT_LOCATION` ENABLE KEYS */;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `ssn` int NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `sex` char(10) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `super_ssn` int DEFAULT NULL,
  `dnumber` int DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `super_ssn` (`super_ssn`),
  KEY `dnumber` (`dnumber`),
  CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`super_ssn`) REFERENCES `EMPLOYEE` (`ssn`),
  CONSTRAINT `EMPLOYEE_ibfk_2` FOREIGN KEY (`dnumber`) REFERENCES `DEPARTMENT` (`dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('john','Doe',1,'1999-12-02','from bangalore','M',100500.00,2,101),('tom','jerry',2,'1997-02-02','from mangalore','M',20000.00,5,102),('hello','world',3,'2000-02-20','from kerala','F',550000.00,2,102),('hii','hello',4,'1997-04-18','from chennai','F',50000.00,2,103),('spider','man',5,'1980-12-12','from hydrabad','M',750000.00,2,101);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT` (
  `pname` varchar(20) DEFAULT NULL,
  `pnumber` int NOT NULL,
  `plocation` varchar(20) DEFAULT NULL,
  `dnumber` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `cost` decimal(20,2) DEFAULT NULL,
  `date_of_completion` date DEFAULT NULL,
  PRIMARY KEY (`pnumber`),
  KEY `dnumber` (`dnumber`),
  CONSTRAINT `PROJECT_ibfk_1` FOREIGN KEY (`dnumber`) REFERENCES `DEPARTMENT` (`dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES ('project_A',1001,'bangalore',101,'ongoing',200000.00,'2023-05-21'),('project_B',1002,'chennai',101,'ongoing',500000.00,'2023-08-22'),('project_C',1003,'kerala',101,'ongoing',150000.00,'2025-02-10'),('project_D',1004,'nepal',103,'completed',1000050.00,'2020-01-01'),('project_E',1005,'bangalore',101,'completed',730000.00,'2027-11-11'),('project_F',1006,'us',102,'ongoing',420000.00,'2017-09-09');
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;

--
-- Table structure for table `PROJECT_LOCATION`
--

DROP TABLE IF EXISTS `PROJECT_LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT_LOCATION` (
  `pnumber` int DEFAULT NULL,
  `plocation` varchar(20) DEFAULT NULL,
  `dnumber` int DEFAULT NULL,
  KEY `pnumber` (`pnumber`),
  KEY `dnumber` (`dnumber`),
  CONSTRAINT `PROJECT_LOCATION_ibfk_1` FOREIGN KEY (`pnumber`) REFERENCES `PROJECT` (`pnumber`),
  CONSTRAINT `PROJECT_LOCATION_ibfk_2` FOREIGN KEY (`dnumber`) REFERENCES `DEPARTMENT` (`dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT_LOCATION`
--

/*!40000 ALTER TABLE `PROJECT_LOCATION` DISABLE KEYS */;
INSERT INTO `PROJECT_LOCATION` VALUES (1001,'bangalore',101),(1002,'chennai',101),(1001,'mysore',101),(1003,'kerala',101),(1004,'nepal',103),(1005,'hubli',101),(1006,'US',102);
/*!40000 ALTER TABLE `PROJECT_LOCATION` ENABLE KEYS */;

--
-- Table structure for table `WORKS_ON`
--

DROP TABLE IF EXISTS `WORKS_ON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKS_ON` (
  `essn` int NOT NULL,
  `pnumber` int NOT NULL,
  `hours` int NOT NULL,
  PRIMARY KEY (`essn`,`pnumber`,`hours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `WORKS_ON` VALUES (1,1004,120),(2,1002,50),(3,1001,100),(3,1002,120),(3,1003,200),(3,1005,300),(4,1004,50),(4,1005,300),(4,1006,100),(5,1004,120),(5,1005,300);
/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dname` varchar(20) NOT NULL,
  `dnumber` int NOT NULL AUTO_INCREMENT,
  `mgr_ssn` int DEFAULT NULL,
  `mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`dnumber`),
  UNIQUE KEY `dname` (`dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

--
-- Dumping routines for database 'db_prg1_mca018'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-14  0:40:18
