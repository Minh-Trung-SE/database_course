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
 1 AS `category_name`,
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
-- Temporary view structure for view `register_page`
--

DROP TABLE IF EXISTS `register_page`;
/*!50001 DROP VIEW IF EXISTS `register_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `register_page` AS SELECT 
 1 AS `user_phone`,
 1 AS `user_password`,
 1 AS `user_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `detail_post`
--

DROP TABLE IF EXISTS `detail_post`;
/*!50001 DROP VIEW IF EXISTS `detail_post`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detail_post` AS SELECT 
 1 AS `user_phone`,
 1 AS `link_photo`,
 1 AS `book_title`,
 1 AS `date`,
 1 AS `release_year`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `login_page`
--

DROP TABLE IF EXISTS `login_page`;
/*!50001 DROP VIEW IF EXISTS `login_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `login_page` AS SELECT 
 1 AS `phone`,
 1 AS `password`*/;
SET character_set_client = @saved_cs_client;

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
/*!50001 VIEW `detail_page` AS select `book_storage`.`link_photo` AS `link_photo`,`book_storage`.`book_title` AS `book_title`,`book_storage`.`release_year` AS `release_year`,`book_storage`.`decription` AS `decription`,`book_storage`.`author` AS `author`,`book_storage`.`price` AS `price`,`book_category`.`category_name` AS `category_name`,`users`.`user_phone` AS `user_phone`,`users`.`user_email` AS `user_email` from (((`book_post` join `users` on((`book_post`.`user_phone` = `users`.`user_phone`))) join `book_storage` on((`book_post`.`book_title` = `book_storage`.`book_title`))) join `book_category` on((`book_storage`.`category_id` = `book_category`.`category_id`))) */;
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
-- Final view structure for view `register_page`
--

/*!50001 DROP VIEW IF EXISTS `register_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `register_page` AS select `users`.`user_phone` AS `user_phone`,`users`.`user_password` AS `user_password`,`users`.`user_email` AS `user_email` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detail_post`
--

/*!50001 DROP VIEW IF EXISTS `detail_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detail_post` AS select `users`.`user_phone` AS `user_phone`,`book_storage`.`link_photo` AS `link_photo`,`book_post`.`book_title` AS `book_title`,`book_post`.`date` AS `date`,`book_storage`.`release_year` AS `release_year`,`book_storage`.`price` AS `price` from ((`users` join `book_post` on((`users`.`user_phone` = `book_post`.`user_phone`))) join `book_storage` on((`book_post`.`book_title` = `book_storage`.`book_title`))) */;
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
/*!50001 VIEW `login_page` AS select `users`.`user_phone` AS `phone`,`users`.`user_password` AS `password` from `users` */;
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

-- Dump completed on 2021-03-07 13:46:14
