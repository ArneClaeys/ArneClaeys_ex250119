-- MySQL Script generated by MySQL Workbench
-- Fri 25 Jan 2019 15:25:42 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exam250119
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exam250119
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exam250119` ;
USE `Exam250119` ;

-- -----------------------------------------------------
-- Table `Exam250119`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exam250119`.`Gene` (
  `Gene_ID` INT UNSIGNED NOT NULL,
  `Gene_name` VARCHAR(45) NULL,
  `Start` INT UNSIGNED NULL,
  `End` INT UNSIGNED NULL,
  `Chromosome` VARCHAR(45) NULL,
  `Gene_description` TEXT(1000) NULL,
  PRIMARY KEY (`Gene_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exam250119`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exam250119`.`Syndrome` (
  `Syndrome_ID` INT UNSIGNED NOT NULL,
  `Gene_ID` INT UNSIGNED NULL,
  `Patient_ID` INT UNSIGNED NULL,
  `Syndrome_description` VARCHAR(45) NULL,
  PRIMARY KEY (`Syndrome_ID`),
  INDEX `Gene_ID_idx` (`Gene_ID` ASC) VISIBLE,
  CONSTRAINT `Gene_ID`
    FOREIGN KEY (`Gene_ID`)
    REFERENCES `Exam250119`.`Gene` (`Gene_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exam250119`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exam250119`.`Patient` (
  `Patient_ID` INT UNSIGNED NOT NULL,
  `Patient_name` VARCHAR(100) NULL,
  `Patient_age` VARCHAR(100) NULL,
  `Patient_gender` ENUM('M', 'V') NULL,
  `Patient_syndrome` VARCHAR(45) NULL,
  `Syndrome_ID` INT UNSIGNED NULL,
  PRIMARY KEY (`Patient_ID`),
  INDEX `Syndrome_ID_idx` (`Syndrome_ID` ASC) VISIBLE,
  CONSTRAINT `Syndrome_ID`
    FOREIGN KEY (`Syndrome_ID`)
    REFERENCES `Exam250119`.`Syndrome` (`Syndrome_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
