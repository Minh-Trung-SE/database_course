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
-- Table structure for table `book_post`
--

DROP TABLE IF EXISTS `book_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_post` (
  `user_phone` varchar(15) NOT NULL,
  `book_title` varchar(150) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_phone`,`book_title`),
  KEY `fk_post_book1_idx` (`book_title`),
  CONSTRAINT `fk_post_book1` FOREIGN KEY (`book_title`) REFERENCES `book_storage` (`book_title`),
  CONSTRAINT `fk_table1_user_post` FOREIGN KEY (`user_phone`) REFERENCES `users` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_post`
--

LOCK TABLES `book_post` WRITE;
/*!40000 ALTER TABLE `book_post` DISABLE KEYS */;
INSERT INTO `book_post` VALUES ('0163512356','Hoá Học 12','2019-03-02 00:00:00'),('0163512356','Vât Lý','2021-01-19 00:00:00'),('0335840115','Giải Tích 1','2021-12-01 00:00:00'),('0335840115','Vật Lý Mega','2020-03-02 00:00:00'),('0984511112','Giải Tích 2','2021-02-01 00:00:00'),('0984511113','Hoá Học 11','2019-12-01 00:00:00');
/*!40000 ALTER TABLE `book_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-07 13:46:14