-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema reservation_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `reservation_db` ;

-- -----------------------------------------------------
-- Schema reservation_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reservation_db` DEFAULT CHARACTER SET utf8 ;
USE `reservation_db` ;

-- -----------------------------------------------------
-- Table `reservation_db`.`Cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Cities` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Cities` (
  `city_name` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `City Name_UNIQUE` (`city_name` ASC),
  PRIMARY KEY (`city_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Theaters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Theaters` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Theaters` (
  `theater_code` INT NOT NULL AUTO_INCREMENT,
  `theater_name` VARCHAR(45) NOT NULL,
  `theater_address` VARCHAR(45) NOT NULL,
  `theater_phone` VARCHAR(45) NULL,
  `website` VARCHAR(45) NULL,
  `city_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`theater_code`),
  INDEX `fk_Theaters_Cities1_idx` (`city_name` ASC),
  CONSTRAINT `fk_Theaters_Cities1`
    FOREIGN KEY (`city_name`)
    REFERENCES `reservation_db`.`Cities` (`city_name`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Show_Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Show_Category` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Show_Category` (
  `category_name` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Name_UNIQUE` (`category_name` ASC),
  PRIMARY KEY (`category_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Shows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Shows` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Shows` (
  `show_code` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  `show_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(1023) NULL DEFAULT 'No Description',
  `year_produced` VARCHAR(4) NULL,
  `show_length` VARCHAR(5) NULL,
  PRIMARY KEY (`show_code`),
  INDEX `fk_Shows_Show_Category1_idx` (`category_name` ASC),
  CONSTRAINT `fk_Shows_Show_Category1`
    FOREIGN KEY (`category_name`)
    REFERENCES `reservation_db`.`Show_Category` (`category_name`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Events` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Events` (
  `event_code` INT NOT NULL AUTO_INCREMENT,
  `event_date` DATE NOT NULL,
  `event_time` TIME(5) NOT NULL,
  `show_code` INT NOT NULL,
  `theater_code` INT NOT NULL,
  PRIMARY KEY (`event_code`),
  INDEX `fk_Events_Shows1_idx` (`show_code` ASC),
  INDEX `fk_Events_Theaters1_idx` (`theater_code` ASC),
  CONSTRAINT `fk_Events_Shows1`
    FOREIGN KEY (`show_code`)
    REFERENCES `reservation_db`.`Shows` (`show_code`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Events_Theaters1`
    FOREIGN KEY (`theater_code`)
    REFERENCES `reservation_db`.`Theaters` (`theater_code`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Users` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Users` (
  `user_id` VARCHAR(40) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL DEFAULT '',
  `permission` ENUM('user', 'admin') NOT NULL DEFAULT 'user',
  `email` VARCHAR(45) NULL DEFAULT '',
  `user_address` VARCHAR(45) NULL DEFAULT '',
  `user_phone` VARCHAR(45) NULL DEFAULT '',
  `city_name` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_Users_Cities1_idx` (`city_name` ASC),
  CONSTRAINT `fk_Users_Cities1`
    FOREIGN KEY (`city_name`)
    REFERENCES `reservation_db`.`Cities` (`city_name`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Seats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Seats` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Seats` (
  `seat_id` INT NOT NULL AUTO_INCREMENT,
  `theater_code` INT NOT NULL,
  `row` INT NOT NULL,
  `seat` INT NOT NULL,
  PRIMARY KEY (`seat_id`),
  INDEX `fk_Seats_Theaters1_idx` (`theater_code` ASC),
  CONSTRAINT `fk_Seats_Theaters1`
    FOREIGN KEY (`theater_code`)
    REFERENCES `reservation_db`.`Theaters` (`theater_code`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Tickets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Tickets` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Tickets` (
  `ticket_no` INT NOT NULL AUTO_INCREMENT,
  `event_code` INT NOT NULL,
  `user_id` VARCHAR(40) NULL DEFAULT NULL,
  `assigned` ENUM('yes', 'no') NOT NULL DEFAULT 'no',
  `seat_id` INT NULL DEFAULT NULL,
  `price` DECIMAL(15,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_no`),
  INDEX `fk_Tickets_Users1_idx` (`user_id` ASC),
  INDEX `fk_Tickets_Events1_idx` (`event_code` ASC),
  INDEX `fk_Tickets_Seats1_idx` (`seat_id` ASC),
  CONSTRAINT `fk_Tickets_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `reservation_db`.`Users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tickets_Events1`
    FOREIGN KEY (`event_code`)
    REFERENCES `reservation_db`.`Events` (`event_code`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tickets_Seats1`
    FOREIGN KEY (`seat_id`)
    REFERENCES `reservation_db`.`Seats` (`seat_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Pictures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Pictures` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Pictures` (
  `pic_id` INT NOT NULL AUTO_INCREMENT,
  `show_code` INT NOT NULL,
  `pic` VARCHAR(1024) NOT NULL,
  `user_id` VARCHAR(45) NULL,
  PRIMARY KEY (`pic_id`),
  INDEX `fk_Pictures_Shows1_idx` (`show_code` ASC),
  INDEX `fk_Pictures_Users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Pictures_Shows1`
    FOREIGN KEY (`show_code`)
    REFERENCES `reservation_db`.`Shows` (`show_code`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pictures_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `reservation_db`.`Users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation_db`.`Reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation_db`.`Reviews` ;

CREATE TABLE IF NOT EXISTS `reservation_db`.`Reviews` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `show_code` INT NOT NULL,
  `review` VARCHAR(1023) NOT NULL,
  `user_id` VARCHAR(45) NULL,
  PRIMARY KEY (`review_id`),
  INDEX `fk_Reviews_Shows1_idx` (`show_code` ASC),
  INDEX `fk_Reviews_Users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Reviews_Shows1`
    FOREIGN KEY (`show_code`)
    REFERENCES `reservation_db`.`Shows` (`show_code`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `reservation_db`.`Users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
