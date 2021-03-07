-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `book_storage`
--

DROP TABLE IF EXISTS `book_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_storage` (
  `book_title` varchar(150) NOT NULL,
  `category_id` int NOT NULL,
  `link_photo` varchar(45) NOT NULL,
  `release_year` varchar(4) NOT NULL,
  `decription` text,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`book_title`,`category_id`),
  KEY `fk_book_category1_idx` (`category_id`),
  CONSTRAINT `fk_book_category1` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_storage`
--

LOCK TABLES `book_storage` WRITE;
/*!40000 ALTER TABLE `book_storage` DISABLE KEYS */;
INSERT INTO `book_storage` VALUES ('Giải Tích 1',1,'www.photo1.com','2019','Bassic level','Nhà Xuất Bản Hà Nội','20000'),('Giải Tích 2',1,'www.photo2.com','2020','Bassic level','Nhà Xuất Bản Hải Phòng','30000'),('Hoá Học 11',3,'www.photo3.com','2020','Bassic level','Nhà Xuất Bản HCM','80000'),('Hoá Học 12',3,'www.photo4.com','2019','Bassic level','Nhà Xuất Bản Vũng Tàu','20000'),('Vật Lý',2,'www.photo5.com','2021','Bassic level','Nhà Xuất Bản Hải Dương','50000'),('Vật Lý Mega',2,'www.photo6.com','2019','Bassic level','Nhà Xuất Bản Điện Biên','80000');
/*!40000 ALTER TABLE `book_storage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-07 13:46:13
