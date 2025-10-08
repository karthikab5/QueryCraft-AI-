CREATE DATABASE  IF NOT EXISTS `atliq_tshirts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `atliq_tshirts`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: atliq_tshirts
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `t_shirts`
--

DROP TABLE IF EXISTS `t_shirts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_shirts` (
  `t_shirt_id` int NOT NULL AUTO_INCREMENT,
  `brand` enum('Van Huesen','Levi','Nike','Adidas') NOT NULL,
  `color` enum('Red','Blue','Black','White') NOT NULL,
  `size` enum('XS','S','M','L','XL') NOT NULL,
  `price` int DEFAULT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`t_shirt_id`),
  UNIQUE KEY `brand_color_size` (`brand`,`color`,`size`),
  CONSTRAINT `t_shirts_chk_1` CHECK ((`price` between 10 and 50))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_shirts`
--

LOCK TABLES `t_shirts` WRITE;
/*!40000 ALTER TABLE `t_shirts` DISABLE KEYS */;
INSERT INTO `t_shirts` VALUES (1,'Adidas','White','XL',27,26),(2,'Nike','Blue','S',34,88),(3,'Levi','White','XS',40,52),(4,'Van Huesen','White','XS',44,99),(5,'Levi','Red','S',50,27),(6,'Adidas','Blue','L',45,99),(7,'Levi','Black','M',12,13),(8,'Adidas','White','M',36,88),(9,'Levi','Red','XL',43,55),(10,'Van Huesen','Black','XS',36,87),(12,'Nike','Black','S',28,35),(13,'Van Huesen','Black','M',43,70),(14,'Adidas','Red','S',20,33),(15,'Levi','Black','L',26,12),(16,'Adidas','Black','M',46,70),(17,'Nike','Blue','M',24,52),(19,'Van Huesen','Blue','L',28,23),(20,'Levi','Blue','XS',47,53),(21,'Nike','Black','L',36,96),(22,'Adidas','Red','M',40,38),(23,'Levi','White','M',25,66),(25,'Adidas','Black','XS',14,24),(26,'Levi','White','L',40,86),(27,'Adidas','Blue','M',39,16),(28,'Van Huesen','Black','XL',24,17),(29,'Levi','Black','XS',38,13),(30,'Van Huesen','Black','L',30,49),(31,'Nike','Red','L',11,22),(32,'Nike','Red','M',33,59),(33,'Van Huesen','Blue','XS',12,16),(34,'Van Huesen','White','L',46,41),(35,'Van Huesen','Blue','M',27,65),(36,'Adidas','Red','L',11,94),(37,'Nike','White','XS',12,71),(38,'Van Huesen','Red','XS',10,78),(39,'Adidas','Blue','XS',24,34),(40,'Levi','Black','S',30,74),(41,'Van Huesen','Red','XL',37,61),(44,'Van Huesen','White','M',31,87),(45,'Nike','White','XL',23,88),(46,'Levi','White','XL',10,14),(47,'Van Huesen','Red','M',50,70),(49,'Adidas','Red','XS',39,50),(52,'Levi','Blue','XL',12,44),(54,'Nike','Red','S',15,74),(56,'Van Huesen','Red','L',33,91),(57,'Nike','Red','XL',43,22),(60,'Nike','Black','XS',50,88),(61,'Levi','Red','M',47,30),(63,'Adidas','Red','XL',50,33),(68,'Nike','Black','XL',20,74),(75,'Nike','White','S',40,70),(77,'Nike','White','L',10,78),(78,'Nike','Red','XS',26,99),(79,'Nike','Black','M',14,93),(81,'Adidas','White','XS',48,52),(86,'Adidas','White','L',16,57),(93,'Levi','Blue','S',33,35),(94,'Nike','Blue','XS',23,33),(96,'Van Huesen','Blue','S',37,72),(97,'Levi','Red','XS',24,47),(98,'Adidas','Black','L',14,61);
/*!40000 ALTER TABLE `t_shirts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-08 11:47:16
