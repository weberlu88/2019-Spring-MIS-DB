-- MySQL Script generated by MySQL Workbench
-- Fri Jun  7 22:43:01 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_forClass
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_forClass
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_forClass` DEFAULT CHARACTER SET utf8 ;
USE `db_forClass` ;

-- -----------------------------------------------------
-- Table `db_forClass`.`tblUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_forClass`.`tblUser` (
  `idtblUser` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(200) CHARACTER SET 'utf8' NOT NULL,
  `FirstName` VARCHAR(100) NOT NULL,
  `LastName` VARCHAR(100) NOT NULL,
  `FullName` VARCHAR(201) GENERATED ALWAYS AS (CONCAT(FirstName,' ',LastName)) STORED,
  `Dob` DATE NOT NULL,
  `Salt` CHAR(64) NOT NULL,
  `UUID` CHAR(32) NOT NULL,
  `RegisterDateTime` DATETIME NOT NULL,
  PRIMARY KEY (`idtblUser`),
  UNIQUE INDEX `email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Salt_UNIQUE` (`Salt` ASC) VISIBLE,
  UNIQUE INDEX `UUID_UNIQUE` (`UUID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_forClass`.`tblUserCredential`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_forClass`.`tblUserCredential` (
  `idtblUserCredential` INT NOT NULL AUTO_INCREMENT,
  `HashedPwd` VARCHAR(512) NOT NULL,
  `CreateDateTime` DATETIME NULL,
  `UserID` INT NOT NULL,
  PRIMARY KEY (`idtblUserCredential`, `UserID`),
  UNIQUE INDEX `HashedPwd_UNIQUE` (`HashedPwd` ASC) VISIBLE,
  INDEX `fkUserID_idx` (`UserID` ASC) VISIBLE,
  CONSTRAINT `fkUserID`
    FOREIGN KEY (`UserID`)
    REFERENCES `db_forClass`.`tblUser` (`idtblUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_forClass`.`tlbOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_forClass`.`tlbOrder` (
  `idtlbOrder` INT NOT NULL AUTO_INCREMENT,
  `createDateTime` DATETIME NOT NULL,
  `OrderTotal` MEDIUMINT(6) UNSIGNED NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`idtlbOrder`),
  INDEX `fkUserID_OrderID_idx` (`userID` ASC) VISIBLE,
  CONSTRAINT `fkUserID_OrderID`
    FOREIGN KEY (`userID`)
    REFERENCES `db_forClass`.`tblUser` (`idtblUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_forClass`.`tlbItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_forClass`.`tlbItem` (
  `idtlbItem` INT NOT NULL AUTO_INCREMENT,
  `itemName` VARCHAR(512) NULL,
  `price` MEDIUMINT(6) UNSIGNED NOT NULL,
  `description` TINYTEXT NULL,
  PRIMARY KEY (`idtlbItem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_forClass`.`tlbOrder_has_tlbItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_forClass`.`tlbOrder_has_tlbItem` (
  `tlbOrder_idtlbOrder` INT NOT NULL,
  `tlbItem_idtlbItem` INT NOT NULL,
  `itemQuanity` INT(4) UNSIGNED NOT NULL,
  INDEX `fk_tlbOrder_has_tlbItem_tlbItem1_idx` (`tlbItem_idtlbItem` ASC) VISIBLE,
  INDEX `fk_tlbOrder_has_tlbItem_tlbOrder1_idx` (`tlbOrder_idtlbOrder` ASC) VISIBLE,
  CONSTRAINT `fk_tlbOrder_has_tlbItem_tlbOrder1`
    FOREIGN KEY (`tlbOrder_idtlbOrder`)
    REFERENCES `db_forClass`.`tlbOrder` (`idtlbOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tlbOrder_has_tlbItem_tlbItem1`
    FOREIGN KEY (`tlbItem_idtlbItem`)
    REFERENCES `db_forClass`.`tlbItem` (`idtlbItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
