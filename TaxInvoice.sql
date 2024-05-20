-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: Tax_Invoice
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `Category_Based_Discount`
--

DROP TABLE IF EXISTS `Category_Based_Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category_Based_Discount` (
  `prod_category_id` int NOT NULL,
  `prod_category` varchar(20) DEFAULT NULL,
  `discount` varchar(4) DEFAULT NULL,
  `taxable_amount` decimal(7,3) DEFAULT NULL,
  `total_amt` decimal(7,3) DEFAULT NULL,
  PRIMARY KEY (`prod_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category_Based_Discount`
--

LOCK TABLES `Category_Based_Discount` WRITE;
/*!40000 ALTER TABLE `Category_Based_Discount` DISABLE KEYS */;
INSERT INTO `Category_Based_Discount` VALUES (1,'Diary','25%',5597.500,4198.125),(2,'Stationary','17%',2836.931,2354.653),(3,'Cosmetics','12%',1068.236,940.048),(4,'Snacks','9%',1994.199,1814.721),(5,'Toys','30%',6239.200,4367.440);
/*!40000 ALTER TABLE `Category_Based_Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category_Based_GST`
--

DROP TABLE IF EXISTS `Category_Based_GST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category_Based_GST` (
  `GST_IND` int NOT NULL,
  `Taxable_Amount` decimal(7,3) DEFAULT NULL,
  `CGST_SGST_Percent` varchar(7) DEFAULT NULL,
  `Total_Amount` decimal(7,3) DEFAULT NULL,
  PRIMARY KEY (`GST_IND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category_Based_GST`
--

LOCK TABLES `Category_Based_GST` WRITE;
/*!40000 ALTER TABLE `Category_Based_GST` DISABLE KEYS */;
INSERT INTO `Category_Based_GST` VALUES (1,4198.125,'0.00%',4198.125),(2,2242.527,'5.00%',2354.653),(3,839.328,'12.00%',940.048),(4,1664.882,'18.00%',1814.721),(5,3359.560,'10.00%',4367.440);
/*!40000 ALTER TABLE `Category_Based_GST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `cust_id` int NOT NULL,
  `cust_name` varchar(20) DEFAULT NULL,
  `cust_DOB` date DEFAULT NULL,
  `cust_email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (101,'Kanna','2004-04-23','kanna23@gmail.com'),(102,'Radha','2016-10-02','radha10@gmail.com'),(103,'Madhav','2004-03-10','madhav03@gmail.com'),(104,'Yadhav','1976-07-05','yadhav75@gmail.com'),(105,'Draupathi','1990-03-21','draupathi21@gmail.com'),(106,'Arjuna','1980-07-12','arjun12@gmail.com');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `cust_id` int DEFAULT NULL,
  `prod_id` int DEFAULT NULL,
  `GST_IND` int DEFAULT NULL,
  `qty` varchar(6) DEFAULT NULL,
  `value` decimal(10,4) DEFAULT NULL,
  KEY `cust_id` (`cust_id`),
  KEY `prod_id` (`prod_id`),
  KEY `GST_IND` (`GST_IND`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `Customers` (`cust_id`) ON DELETE SET NULL,
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `Products` (`prod_id`) ON DELETE SET NULL,
  CONSTRAINT `Orders_ibfk_3` FOREIGN KEY (`GST_IND`) REFERENCES `Category_Based_GST` (`GST_IND`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (102,1001,1,'150g',112.5000),(105,1002,1,'5.3l',3577.5000),(103,1003,2,'7',57.9540),(102,1004,5,'1',153.2300),(101,1005,1,'2.5l',84.3750),(104,1006,2,'56',24.4020),(103,1007,4,'2',118.1180),(101,1008,5,'1',207.9000),(105,1009,3,'2',333.9040),(104,1010,2,'3',201.3160),(102,1011,3,'1',44.3520),(102,1012,4,'2',128.8560),(101,1013,2,'1',304.1500),(105,1014,4,'30g',128.8560),(101,1015,3,'1',344.9600),(104,1014,4,'25g',53.6900),(101,1007,4,'12',450.9960),(105,1001,1,'1.5l',56.2500),(106,1014,4,'3',934.2050),(106,1005,1,'320g',120.0000),(102,1016,5,'2',722.2600),(101,1017,2,'11',115.0380),(103,1004,5,'1',153.2300),(105,1002,1,'110g',247.5000),(106,1016,5,'7',1864.9400),(103,1008,5,'3',1265.8800),(102,1010,2,'100',87.1500),(104,1017,2,'1',10.4580),(106,1003,2,'500',653.6250),(105,1013,2,'3',900.5600),(101,1011,3,'2',216.8320);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(30) DEFAULT NULL,
  `prod_category_id` int DEFAULT NULL,
  `per_price` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `prod_category_id` (`prod_category_id`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`prod_category_id`) REFERENCES `Category_Based_Discount` (`prod_category_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1001,'Cheese',1,0.7500),(1002,'Ghee',1,675.0000),(1003,'Pen',2,8.2790),(1004,'Barbie Kit',5,153.2300),(1005,'Milk',1,33.7500),(1006,'Paper',2,0.4350),(1007,'Trail Mix',4,59.0590),(1008,'Dancing Rabbit',5,207.9000),(1009,'Lip Stick',3,116.9500),(1010,'Pen Cups',2,67.1050),(1011,'Blush',3,44.3520),(1012,'Popcorn',4,64.4280),(1013,'Bhagavat-Gita Book',2,304.1500),(1014,'Mango Chips',4,0.4290),(1015,'SunsScreen',3,344.9600),(1016,'SwimmingFish',5,361.1300),(1017,'Stick',2,10.4580);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-13 16:42:21
