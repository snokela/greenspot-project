-- MySQL Script generated by MySQL Workbench
-- Sun Jan 28 19:30:30 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema greenspot
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema greenspot
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `greenspot` ;
USE `greenspot` ;

-- -----------------------------------------------------
-- Table `greenspot`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspot`.`items` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greenspot`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspot`.`purchases` (
  `id` INT NOT NULL,
  `vendor` VARCHAR(50) NOT NULL,
  `date` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `cost` DECIMAL(6,2) NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `item_id_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `greenspot`.`items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greenspot`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greenspot`.`sales` (
  `id` INT NOT NULL,
  `customer` VARCHAR(10) NOT NULL,
  `date` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `item_id_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `greenspot`.`items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
