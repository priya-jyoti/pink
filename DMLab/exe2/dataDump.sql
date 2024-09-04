-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.16.34.124    Database: db_exe2_050
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2



--
-- Table structure for table `vendor`
--
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `tin` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact` int DEFAULT NULL,
  PRIMARY KEY (`tin`)
)
INSERT INTO `vendor` VALUES (1,'John','Bengalore',4738294),(2,'Wick','Mysore',4738294),(3,'Alex','Bengalore',4738294),(4,'Graham','Bengalore',4738294),(5,'Bell','Mangalore',4738294),(6,'Cell','Mangalore',4738294);




--
-- Table structure for table `user`
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `hno` int NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hno`)
)
INSERT INTO `user` VALUES (1,'Mangalore'),(2,'Bangalore'),(3,'Bangalore'),(4,'Mangalore'),(5,'Mysore'),(6,'Mangalore');





--
-- Table structure for table `panel`
--
DROP TABLE IF EXISTS `panel`;
CREATE TABLE `panel` (
  `pvm` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `hno` int DEFAULT NULL,
  `tin` int DEFAULT NULL,
  PRIMARY KEY (`pvm`),
  KEY `tin` (`tin`),
  KEY `hno` (`hno`),
  CONSTRAINT `panel_ibfk_1` FOREIGN KEY (`tin`) REFERENCES `vendor` (`tin`),
  CONSTRAINT `panel_ibfk_2` FOREIGN KEY (`hno`) REFERENCES `user` (`hno`)
)
INSERT INTO `panel` VALUES (1,'m',40000.00,5,2),(2,'p',60000.00,4,5),(3,'m',40000.00,1,5),(4,'p',60000.00,2,3),(5,'m',40000.00,3,1),(6,'m',44000.00,3,1);


--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `hno` int NOT NULL,
  `pvm` int NOT NULL,
  PRIMARY KEY (`pvm`,`hno`),
  KEY `hno` (`hno`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`hno`) REFERENCES `user` (`hno`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`pvm`) REFERENCES `panel` (`pvm`)
)
INSERT INTO `purchase` VALUES (3,5),(4,2),(5,1);





--
-- Table structure for table `dist`
--
DROP TABLE IF EXISTS `dist`;
CREATE TABLE `dist` (
  `pvm` int NOT NULL,
  `tin` int NOT NULL,
  PRIMARY KEY (`tin`,`pvm`),
  KEY `pvm` (`pvm`),
  CONSTRAINT `dist_ibfk_1` FOREIGN KEY (`tin`) REFERENCES `vendor` (`tin`),
  CONSTRAINT `dist_ibfk_2` FOREIGN KEY (`pvm`) REFERENCES `panel` (`pvm`)
) 
INSERT INTO `dist` VALUES (1,2),(2,5),(3,5),(4,3),(5,1);


--
-- Table structure for table `install`
--
DROP TABLE IF EXISTS `install`;
CREATE TABLE `install` (
  `tin` int NOT NULL,
  `pvm` int NOT NULL,
  `hno` int NOT NULL,
  `cap` int DEFAULT NULL,
  `usg` varchar(50) DEFAULT NULL,
  `warr` date DEFAULT NULL,
  `insdate` date DEFAULT NULL,
  PRIMARY KEY (`tin`,`pvm`,`hno`),
  KEY `hno` (`hno`),
  KEY `pvm` (`pvm`),
  CONSTRAINT `install_ibfk_1` FOREIGN KEY (`tin`) REFERENCES `vendor` (`tin`),
  CONSTRAINT `install_ibfk_2` FOREIGN KEY (`hno`) REFERENCES `user` (`hno`),
  CONSTRAINT `install_ibfk_3` FOREIGN KEY (`pvm`) REFERENCES `panel` (`pvm`)
)
INSERT INTO `install` VALUES (1,5,3,100,'Com','2021-12-24','2010-06-14'),(2,1,5,3,'Dom','2025-12-24','2009-06-14'),(3,4,2,9,'Dom','2027-12-24','2009-06-14'),(5,2,4,100,'Com','2024-12-24','2016-06-14'),(5,3,1,15,'Dom','2023-12-24','2014-06-14'),(5,3,6,4,'Dom','2024-12-24','2011-06-14'),(6,3,6,4,'Com','2023-12-24','2011-06-14'),(6,6,6,4,'Com','2023-12-24','2011-06-14');




