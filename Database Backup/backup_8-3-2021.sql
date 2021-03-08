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
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_category` (
  `category_id` int NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (3,'Hoá Học'),(1,'Toán Học'),(2,'Vật Lý');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_favourite`
--

DROP TABLE IF EXISTS `book_favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_favourite` (
  `user_phone` varchar(45) NOT NULL,
  `book_id` varchar(20) NOT NULL,
  `date_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_phone`,`book_id`),
  KEY `fk_book_favourite_book_storage1_idx` (`book_id`),
  CONSTRAINT `fk_book_favourite_book_storage1` FOREIGN KEY (`book_id`) REFERENCES `book_storage` (`book_id`),
  CONSTRAINT `fk_favourite_user_post1` FOREIGN KEY (`user_phone`) REFERENCES `users` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_favourite`
--

LOCK TABLES `book_favourite` WRITE;
/*!40000 ALTER TABLE `book_favourite` DISABLE KEYS */;
INSERT INTO `book_favourite` VALUES ('0335840115','B6','2021-03-08 21:50:28');
/*!40000 ALTER TABLE `book_favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_post`
--

DROP TABLE IF EXISTS `book_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_post` (
  `user_phone` varchar(15) NOT NULL,
  `book_id` varchar(20) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_phone`,`book_id`),
  KEY `fk_book_post_book_storage1_idx` (`book_id`),
  CONSTRAINT `fk_book_post_book_storage1` FOREIGN KEY (`book_id`) REFERENCES `book_storage` (`book_id`),
  CONSTRAINT `fk_table1_user_post` FOREIGN KEY (`user_phone`) REFERENCES `users` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_post`
--

LOCK TABLES `book_post` WRITE;
/*!40000 ALTER TABLE `book_post` DISABLE KEYS */;
INSERT INTO `book_post` VALUES ('0123454321','B3','2021-03-08 14:44:10'),('0123454321','B4','2021-03-08 14:44:10'),('0123456789','B2','2021-03-08 14:44:10'),('0123456789','B5','2021-03-08 14:44:10'),('0335840115','B1','2021-01-01 00:00:00'),('0984500746','B6','2021-06-12 17:20:01');
/*!40000 ALTER TABLE `book_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_storage`
--

DROP TABLE IF EXISTS `book_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_storage` (
  `book_id` varchar(20) NOT NULL,
  `book_title` varchar(150) DEFAULT NULL,
  `category_id` int NOT NULL,
  `link_photo` varchar(45) NOT NULL,
  `release_year` varchar(4) NOT NULL,
  `decription` text,
  `author` varchar(45) DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`book_id`,`category_id`),
  UNIQUE KEY `book_id_UNIQUE` (`book_id`),
  KEY `fk_book_category1_idx` (`category_id`),
  CONSTRAINT `fk_book_storage_book_category1` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_storage`
--

LOCK TABLES `book_storage` WRITE;
/*!40000 ALTER TABLE `book_storage` DISABLE KEYS */;
INSERT INTO `book_storage` VALUES ('B1','Toán Cao Cấp',1,'www.toancaocap.com','2021','Fix for student in university','Ngô Bảo Châu',200000,3),('B2','Toán Rời Rạc',1,'www.toanroirac.com','2019','Fix for everyone','Tô Trọng Tín',30000,1),('B3','Tổ Hợp Sắc Xuất',1,'www.sacxuatbook.com','2016','Beginer','Cao Văn Kiên',50000,6),('B4','Cảm Ứng Từ',2,'www.photo1.com','2020','Bassic level','Hoàng Văn Sinh',60000,4),('B5','Định Luật Bảo Toàn Năng Lượng',2,'www.vatly.com','2019','Medium','Trương Văn Kiên',52000,1),('B6','Hợp Chất Kim Loại',3,'www.hocmai.com','2020','High-School','Vũ Khắc Ngọc',70000,2);
/*!40000 ALTER TABLE `book_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `detail_page`
--

DROP TABLE IF EXISTS `detail_page`;
/*!50001 DROP VIEW IF EXISTS `detail_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detail_page` AS SELECT 
 1 AS `link_photo`,
 1 AS `book_title`,
 1 AS `release_year`,
 1 AS `decription`,
 1 AS `author`,
 1 AS `price`,
 1 AS `Generic`,
 1 AS `user_phone`,
 1 AS `user_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `home_page`
--

DROP TABLE IF EXISTS `home_page`;
/*!50001 DROP VIEW IF EXISTS `home_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `home_page` AS SELECT 
 1 AS `category_name`,
 1 AS `book_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `login_page`
--

DROP TABLE IF EXISTS `login_page`;
/*!50001 DROP VIEW IF EXISTS `login_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `login_page` AS SELECT 
 1 AS `user_phone`,
 1 AS `user_password`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `post_book_page`
--

DROP TABLE IF EXISTS `post_book_page`;
/*!50001 DROP VIEW IF EXISTS `post_book_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `post_book_page` AS SELECT 
 1 AS `Title`,
 1 AS `Generic`,
 1 AS `Link photo`,
 1 AS `Price`,
 1 AS `Release year`,
 1 AS `Decription`,
 1 AS `Date`,
 1 AS `Author`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_page_1`
--

DROP TABLE IF EXISTS `user_page_1`;
/*!50001 DROP VIEW IF EXISTS `user_page_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_page_1` AS SELECT 
 1 AS `user_phone`,
 1 AS `user_email`,
 1 AS `user_password`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_page_2`
--

DROP TABLE IF EXISTS `user_page_2`;
/*!50001 DROP VIEW IF EXISTS `user_page_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_page_2` AS SELECT 
 1 AS `Link photo`,
 1 AS `Book title`,
 1 AS `Date post`,
 1 AS `Release year`,
 1 AS `Price`,
 1 AS `Amount`,
 1 AS `Phone user post`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_page_3`
--

DROP TABLE IF EXISTS `user_page_3`;
/*!50001 DROP VIEW IF EXISTS `user_page_3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_page_3` AS SELECT 
 1 AS `Link photo`,
 1 AS `Book title`,
 1 AS `Phone user post`,
 1 AS `Release year`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_phone` varchar(15) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  PRIMARY KEY (`user_phone`),
  UNIQUE KEY `email_UNIQUE` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0123454321','vietkt','vietkt123`','vietkt@gmail.com'),('0123456789','tronglg','trong1234','trong123@gmail.com'),('0335840115','trungnm','minhtrung','nguyenminhtrung1772kk1@gmail.com'),('0984500746','khanhlg','khanh2001','khanh2001@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `detail_page`
--

/*!50001 DROP VIEW IF EXISTS `detail_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detail_page` AS select `book_storage`.`link_photo` AS `link_photo`,`book_storage`.`book_title` AS `book_title`,`book_storage`.`release_year` AS `release_year`,`book_storage`.`decription` AS `decription`,`book_storage`.`author` AS `author`,`book_storage`.`price` AS `price`,`book_category`.`category_name` AS `Generic`,`users`.`user_phone` AS `user_phone`,`users`.`user_email` AS `user_email` from (((`book_storage` join `book_post` on((`book_storage`.`book_id` = `book_post`.`book_id`))) join `users` on((`book_post`.`user_phone` = `users`.`user_phone`))) join `book_category` on((`book_storage`.`category_id` = `book_category`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `home_page`
--

/*!50001 DROP VIEW IF EXISTS `home_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `home_page` AS select `book_category`.`category_name` AS `category_name`,`book_storage`.`book_title` AS `book_title` from (`book_category` join `book_storage` on((`book_category`.`category_id` = `book_storage`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `login_page`
--

/*!50001 DROP VIEW IF EXISTS `login_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `login_page` AS select `users`.`user_phone` AS `user_phone`,`users`.`user_password` AS `user_password` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `post_book_page`
--

/*!50001 DROP VIEW IF EXISTS `post_book_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `post_book_page` AS select `book_storage`.`book_title` AS `Title`,`book_category`.`category_name` AS `Generic`,`book_storage`.`link_photo` AS `Link photo`,`book_storage`.`price` AS `Price`,`book_storage`.`release_year` AS `Release year`,`book_storage`.`decription` AS `Decription`,`book_post`.`date` AS `Date`,`book_storage`.`author` AS `Author` from ((`book_storage` join `book_category` on((`book_storage`.`category_id` = `book_category`.`category_id`))) join `book_post` on((`book_storage`.`book_id` = `book_post`.`book_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_page_1`
--

/*!50001 DROP VIEW IF EXISTS `user_page_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_page_1` AS select `users`.`user_phone` AS `user_phone`,`users`.`user_email` AS `user_email`,`users`.`user_password` AS `user_password` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_page_2`
--

/*!50001 DROP VIEW IF EXISTS `user_page_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_page_2` AS select `book_storage`.`link_photo` AS `Link photo`,`book_storage`.`book_title` AS `Book title`,`book_post`.`date` AS `Date post`,`book_storage`.`release_year` AS `Release year`,`book_storage`.`price` AS `Price`,`book_storage`.`amount` AS `Amount`,`users`.`user_phone` AS `Phone user post` from ((`book_post` join `users` on((`book_post`.`user_phone` = `users`.`user_phone`))) join `book_storage` on((`book_post`.`book_id` = `book_storage`.`book_id`))) where (`book_post`.`user_phone` = 123456789) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_page_3`
--

/*!50001 DROP VIEW IF EXISTS `user_page_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_page_3` AS select `book_storage`.`link_photo` AS `Link photo`,`book_storage`.`book_title` AS `Book title`,`users`.`user_phone` AS `Phone user post`,`book_storage`.`release_year` AS `Release year`,`book_storage`.`price` AS `Price` from ((`book_favourite` join `book_storage` on((`book_favourite`.`book_id` = `book_storage`.`book_id`))) join `users` on((`book_favourite`.`user_phone` = `users`.`user_phone`))) where (`book_favourite`.`user_phone` = 335840115) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08 22:05:09
