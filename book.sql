-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema book
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema book
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `book` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `book` ;

-- -----------------------------------------------------
-- Table `book`.`book_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_category` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name_UNIQUE` (`category_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `book`.`book_storage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_storage` (
  `book_title` VARCHAR(150) NOT NULL,
  `category_id` INT NOT NULL,
  `link_photo` VARCHAR(45) NOT NULL,
  `release_year` VARCHAR(4) NOT NULL,
  `decription` TEXT NULL DEFAULT NULL,
  `author` VARCHAR(45) NULL DEFAULT NULL,
  `price` VARCHAR(6) NULL DEFAULT NULL,
  PRIMARY KEY (`book_title`, `category_id`),
  INDEX `fk_book_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `book`.`book_category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `book`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`users` (
  `user_phone` VARCHAR(15) NOT NULL,
  `user_name` VARCHAR(100) NULL DEFAULT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`user_phone`),
  UNIQUE INDEX `email_UNIQUE` (`user_email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `book`.`book_favourite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_favourite` (
  `user_phone` VARCHAR(45) NOT NULL,
  `book_title` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`user_phone`, `book_title`),
  INDEX `fk_favourite_book1_idx` (`book_title` ASC) VISIBLE,
  CONSTRAINT `fk_favourite_book1`
    FOREIGN KEY (`book_title`)
    REFERENCES `book`.`book_storage` (`book_title`),
  CONSTRAINT `fk_favourite_user_post1`
    FOREIGN KEY (`user_phone`)
    REFERENCES `book`.`users` (`user_phone`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `book`.`book_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`book_post` (
  `user_phone` VARCHAR(15) NOT NULL,
  `book_title` VARCHAR(150) NOT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`user_phone`, `book_title`),
  INDEX `fk_post_book1_idx` (`book_title` ASC) VISIBLE,
  CONSTRAINT `fk_post_book1`
    FOREIGN KEY (`book_title`)
    REFERENCES `book`.`book_storage` (`book_title`),
  CONSTRAINT `fk_table1_user_post`
    FOREIGN KEY (`user_phone`)
    REFERENCES `book`.`users` (`user_phone`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `book` ;

-- -----------------------------------------------------
-- Placeholder table for view `book`.`detail_page`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`detail_page` (`link_photo` INT, `book_title` INT, `release_year` INT, `decription` INT, `author` INT, `price` INT, `category_name` INT, `user_phone` INT, `user_email` INT);

-- -----------------------------------------------------
-- Placeholder table for view `book`.`detail_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`detail_post` (`user_phone` INT, `link_photo` INT, `book_title` INT, `date` INT, `release_year` INT, `price` INT);

-- -----------------------------------------------------
-- Placeholder table for view `book`.`home_page`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`home_page` (`category_name` INT, `book_title` INT);

-- -----------------------------------------------------
-- Placeholder table for view `book`.`login_page`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`login_page` (`phone` INT, `password` INT);

-- -----------------------------------------------------
-- Placeholder table for view `book`.`register_page`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book`.`register_page` (`user_phone` INT, `user_password` INT, `user_email` INT);

-- -----------------------------------------------------
-- View `book`.`detail_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book`.`detail_page`;
USE `book`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book`.`detail_page` AS select `book`.`book_storage`.`link_photo` AS `link_photo`,`book`.`book_storage`.`book_title` AS `book_title`,`book`.`book_storage`.`release_year` AS `release_year`,`book`.`book_storage`.`decription` AS `decription`,`book`.`book_storage`.`author` AS `author`,`book`.`book_storage`.`price` AS `price`,`book`.`book_category`.`category_name` AS `category_name`,`book`.`users`.`user_phone` AS `user_phone`,`book`.`users`.`user_email` AS `user_email` from (((`book`.`book_post` join `book`.`users` on((`book`.`book_post`.`user_phone` = `book`.`users`.`user_phone`))) join `book`.`book_storage` on((`book`.`book_post`.`book_title` = `book`.`book_storage`.`book_title`))) join `book`.`book_category` on((`book`.`book_storage`.`category_id` = `book`.`book_category`.`category_id`)));

-- -----------------------------------------------------
-- View `book`.`detail_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book`.`detail_post`;
USE `book`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book`.`detail_post` AS select `book`.`users`.`user_phone` AS `user_phone`,`book`.`book_storage`.`link_photo` AS `link_photo`,`book`.`book_post`.`book_title` AS `book_title`,`book`.`book_post`.`date` AS `date`,`book`.`book_storage`.`release_year` AS `release_year`,`book`.`book_storage`.`price` AS `price` from ((`book`.`users` join `book`.`book_post` on((`book`.`users`.`user_phone` = `book`.`book_post`.`user_phone`))) join `book`.`book_storage` on((`book`.`book_post`.`book_title` = `book`.`book_storage`.`book_title`)));

-- -----------------------------------------------------
-- View `book`.`home_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book`.`home_page`;
USE `book`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book`.`home_page` AS select `book`.`book_category`.`category_name` AS `category_name`,`book`.`book_storage`.`book_title` AS `book_title` from (`book`.`book_category` join `book`.`book_storage` on((`book`.`book_category`.`category_id` = `book`.`book_storage`.`category_id`)));

-- -----------------------------------------------------
-- View `book`.`login_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book`.`login_page`;
USE `book`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book`.`login_page` AS select `book`.`users`.`user_phone` AS `phone`,`book`.`users`.`user_password` AS `password` from `book`.`users`;

-- -----------------------------------------------------
-- View `book`.`register_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book`.`register_page`;
USE `book`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book`.`register_page` AS select `book`.`users`.`user_phone` AS `user_phone`,`book`.`users`.`user_password` AS `user_password`,`book`.`users`.`user_email` AS `user_email` from `book`.`users`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
