-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema iteration 1 part 4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema iteration 1 part 4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `iteration 1 part 4` DEFAULT CHARACTER SET utf8mb3 ;
USE `iteration 1 part 4` ;

-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`Vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`Vehicle` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`Vehicle` (
  `VehicleID` INT NOT NULL,
  `VehicleRating` INT NULL DEFAULT NULL,
  `VehicleSize` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`VehicleID`),
  UNIQUE INDEX `VehicleID_UNIQUE` (`VehicleID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`Delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`Delivery` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `VehicleID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  UNIQUE INDEX `DeliveryID_UNIQUE` (`DeliveryID` ASC) VISIBLE,
  INDEX `FK2_idx` (`VehicleID` ASC) VISIBLE,
  CONSTRAINT `FK2`
    FOREIGN KEY (`VehicleID`)
    REFERENCES `iteration 1 part 4`.`Vehicle` (`VehicleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`Warehouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`Warehouse` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`Warehouse` (
  `WarehouseID` INT NOT NULL,
  `WarehouseName` VARCHAR(20) NOT NULL,
  `WarehouseAddress` VARCHAR(50) NOT NULL,
  `WarehouseCity` VARCHAR(45) NULL,
  PRIMARY KEY (`WarehouseID`),
  UNIQUE INDEX `WarehouseID_UNIQUE` (`WarehouseID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`Manufacturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`Manufacturer` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`Manufacturer` (
  `ManufacturerID` INT NOT NULL,
  `ManufacturerName` VARCHAR(45) NOT NULL,
  `CarbonRating` INT NULL DEFAULT NULL,
  `Address` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ManufacturerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`Products` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `ProductID_UNIQUE` (`ProductID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`MOrder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`MOrder` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`MOrder` (
  `ManuOrderID` INT NOT NULL,
  `WarehouseID` INT NOT NULL,
  `ManufacturerID` INT NOT NULL,
  `ManuOrderCost` FLOAT NOT NULL,
  `ProductID` INT NOT NULL,
  `ProductQty` INT NULL DEFAULT NULL,
  `ExpectedDelivery` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ManuOrderID`),
  INDEX `FK6_idx` (`WarehouseID` ASC) VISIBLE,
  INDEX `FK7_idx` (`ManufacturerID` ASC) VISIBLE,
  INDEX `FK8_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `FK6`
    FOREIGN KEY (`WarehouseID`)
    REFERENCES `iteration 1 part 4`.`Warehouse` (`WarehouseID`),
  CONSTRAINT `FK7`
    FOREIGN KEY (`ManufacturerID`)
    REFERENCES `iteration 1 part 4`.`Manufacturer` (`ManufacturerID`),
  CONSTRAINT `FK8`
    FOREIGN KEY (`ProductID`)
    REFERENCES `iteration 1 part 4`.`Products` (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`ManufacturerProductStock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`ManufacturerProductStock` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`ManufacturerProductStock` (
  `ManufacturerID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `ProductRating` INT NOT NULL,
  `ProductCost` FLOAT NOT NULL,
  PRIMARY KEY (`ManufacturerID`, `ProductID`),
  INDEX `FK13_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `FK12`
    FOREIGN KEY (`ManufacturerID`)
    REFERENCES `iteration 1 part 4`.`Manufacturer` (`ManufacturerID`),
  CONSTRAINT `FK13`
    FOREIGN KEY (`ProductID`)
    REFERENCES `iteration 1 part 4`.`Products` (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`Store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`Store` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`Store` (
  `StoreID` INT NOT NULL,
  `StoreName` VARCHAR(45) NOT NULL,
  `StoreAddress` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`StoreID`),
  UNIQUE INDEX `StoreID_UNIQUE` (`StoreID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `iteration 1 part 4`.`SOrder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iteration 1 part 4`.`SOrder` ;

CREATE TABLE IF NOT EXISTS `iteration 1 part 4`.`SOrder` (
  `StoreOrderID` INT NOT NULL,
  `StoreID` INT NOT NULL,
  `WarehouseID` INT NULL,
  `StoreOrderCost` FLOAT NOT NULL,
  `DeliveryID` INT NULL,
  PRIMARY KEY (`StoreOrderID`),
  UNIQUE INDEX `StoreOrderID_UNIQUE` (`StoreOrderID` ASC) VISIBLE,
  INDEX `FK3_idx` (`StoreID` ASC) VISIBLE,
  INDEX `FK4_idx` (`WarehouseID` ASC) VISIBLE,
  INDEX `FK5_idx` (`DeliveryID` ASC) VISIBLE,
  CONSTRAINT `FK4`
    FOREIGN KEY (`WarehouseID`)
    REFERENCES `iteration 1 part 4`.`Warehouse` (`WarehouseID`),
  CONSTRAINT `FK5`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `iteration 1 part 4`.`Delivery` (`DeliveryID`),
  CONSTRAINT `FK9`
    FOREIGN KEY (`StoreID`)
    REFERENCES `iteration 1 part 4`.`Store` (`StoreID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
