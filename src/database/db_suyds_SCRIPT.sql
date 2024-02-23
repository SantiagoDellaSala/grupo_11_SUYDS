-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_suyds
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_suyds
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_suyds` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_suyds` ;

-- -----------------------------------------------------
-- Table `db_suyds`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`categories` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`materials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`materials` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`origins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`origins` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`qualities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`qualities` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `description` TEXT NOT NULL,
  `discount` INT NULL DEFAULT '0',
  `mainImage` VARCHAR(255) NOT NULL,
  `categoryId` INT NOT NULL,
  `materialId` INT NOT NULL,
  `originId` INT NOT NULL,
  `imageId` INT NOT NULL,
  `qualityId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_qualities_idx` (`qualityId` ASC) VISIBLE,
  INDEX `fk_products_images_idx` (`imageId` ASC) VISIBLE,
  INDEX `fk_products_origins_idx` (`originId` ASC) VISIBLE,
  INDEX `fk_products_materials_idx` (`materialId` ASC) VISIBLE,
  INDEX `fk_products_categories_idx` (`categoryId` ASC) VISIBLE,
  CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`categoryId`)
    REFERENCES `db_suyds`.`categories` (`id`),
  CONSTRAINT `fk_products_images`
    FOREIGN KEY (`imageId`)
    REFERENCES `db_suyds`.`images` (`id`),
  CONSTRAINT `fk_products_materials`
    FOREIGN KEY (`materialId`)
    REFERENCES `db_suyds`.`materials` (`id`),
  CONSTRAINT `fk_products_origins`
    FOREIGN KEY (`originId`)
    REFERENCES `db_suyds`.`origins` (`id`),
  CONSTRAINT `fk_products_qualities`
    FOREIGN KEY (`qualityId`)
    REFERENCES `db_suyds`.`qualities` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `productItemId` INT NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_items_products_idx` (`productItemId` ASC) VISIBLE,
  CONSTRAINT `fk_items_products`
    FOREIGN KEY (`productItemId`)
    REFERENCES `db_suyds`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`roles` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`statutes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`statutes` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`troley`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`troley` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `total` INT NOT NULL,
  `stateId` INT NOT NULL,
  `itemId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_troley_statutes_idx` (`stateId` ASC) VISIBLE,
  INDEX `fk_troley_items_idx` (`itemId` ASC) VISIBLE,
  CONSTRAINT `fk_troley_items`
    FOREIGN KEY (`itemId`)
    REFERENCES `db_suyds`.`items` (`id`),
  CONSTRAINT `fk_troley_statutes`
    FOREIGN KEY (`stateId`)
    REFERENCES `db_suyds`.`statutes` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_suyds`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_suyds`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `avatar` VARCHAR(45) NULL DEFAULT NULL,
  `troleyId` INT NOT NULL,
  `roleId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_troley_idx` (`troleyId` ASC) VISIBLE,
  INDEX `fk_users_roles_idx` (`roleId` ASC) VISIBLE,
  CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`roleId`)
    REFERENCES `db_suyds`.`roles` (`id`),
  CONSTRAINT `fk_users_troley`
    FOREIGN KEY (`troleyId`)
    REFERENCES `db_suyds`.`troley` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;