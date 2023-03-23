-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema TrabajoBDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `TrabajoBDB` ;

-- -----------------------------------------------------
-- Schema TrabajoBDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TrabajoBDB` DEFAULT CHARACTER SET utf8mb3 ;
USE `TrabajoBDB` ;

-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Enfermedad` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Enfermedad` (
  `idEnfermedad` VARCHAR(100) NOT NULL,
  `CambioProteina` VARCHAR(45) NULL DEFAULT NULL,
  `SignificanciaClinica` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idEnfermedad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Articulo` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Articulo` (
  `idArticulo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` DATETIME NULL DEFAULT NULL,
  `Enfermedad_idEnfermedad` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idArticulo`),
  INDEX `fk_Articulo_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  CONSTRAINT `fk_Articulo_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `TrabajoBDB`.`Enfermedad` (`idEnfermedad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Autor` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Autor` (
  `idAutor` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Genes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Genes` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Genes` (
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Enfermedad_has_Genes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Enfermedad_has_Genes` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Enfermedad_has_Genes` (
  `Enfermedad_idEnfermedad` VARCHAR(100) NOT NULL,
  `Genes_Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Enfermedad_idEnfermedad`, `Genes_Nombre`),
  INDEX `fk_Enfermedad_has_Genes_Genes1_idx` (`Genes_Nombre` ASC) VISIBLE,
  INDEX `fk_Enfermedad_has_Genes_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  CONSTRAINT `fk_Enfermedad_has_Genes_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `TrabajoBDB`.`Enfermedad` (`idEnfermedad`),
  CONSTRAINT `fk_Enfermedad_has_Genes_Genes1`
    FOREIGN KEY (`Genes_Nombre`)
    REFERENCES `TrabajoBDB`.`Genes` (`Nombre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Proteina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Proteina` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Proteina` (
  `idProteina` VARCHAR(45) NOT NULL,
  `Longitud` INT NULL DEFAULT NULL,
  `Nombre` VARCHAR(200) NULL DEFAULT NULL,
  `Organismo` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idProteina`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Proteina_has_Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Proteina_has_Enfermedad` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Proteina_has_Enfermedad` (
  `Proteina_idProteina` VARCHAR(45) NOT NULL,
  `Enfermedad_idEnfermedad` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Proteina_idProteina`, `Enfermedad_idEnfermedad`),
  INDEX `fk_Proteina_has_Enfermedad_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  INDEX `fk_Proteina_has_Enfermedad_Proteina1_idx` (`Proteina_idProteina` ASC) VISIBLE,
  CONSTRAINT `fk_Proteina_has_Enfermedad_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `TrabajoBDB`.`Enfermedad` (`idEnfermedad`),
  CONSTRAINT `fk_Proteina_has_Enfermedad_Proteina1`
    FOREIGN KEY (`Proteina_idProteina`)
    REFERENCES `TrabajoBDB`.`Proteina` (`idProteina`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Sintomas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Sintomas` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Sintomas` (
  `Descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Descripcion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Sintomas_has_Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Sintomas_has_Enfermedad` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Sintomas_has_Enfermedad` (
  `Sintomas_Descripcion` VARCHAR(100) NOT NULL,
  `Enfermedad_idEnfermedad` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Sintomas_Descripcion`, `Enfermedad_idEnfermedad`),
  INDEX `fk_Sintomas_has_Enfermedad_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  INDEX `fk_Sintomas_has_Enfermedad_Sintomas1_idx` (`Sintomas_Descripcion` ASC) VISIBLE,
  CONSTRAINT `fk_Sintomas_has_Enfermedad_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `TrabajoBDB`.`Enfermedad` (`idEnfermedad`),
  CONSTRAINT `fk_Sintomas_has_Enfermedad_Sintomas1`
    FOREIGN KEY (`Sintomas_Descripcion`)
    REFERENCES `TrabajoBDB`.`Sintomas` (`Descripcion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Articulo_has_Autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabajoBDB`.`Articulo_has_Autor` ;

CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Articulo_has_Autor` (
  `Articulo_idArticulo` INT NOT NULL,
  `Autor_idAutor` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Articulo_idArticulo`, `Autor_idAutor`),
  INDEX `fk_Articulo_has_Autor_Autor1_idx` (`Autor_idAutor` ASC) VISIBLE,
  INDEX `fk_Articulo_has_Autor_Articulo1_idx` (`Articulo_idArticulo` ASC) VISIBLE,
  CONSTRAINT `fk_Articulo_has_Autor_Articulo1`
    FOREIGN KEY (`Articulo_idArticulo`)
    REFERENCES `TrabajoBDB`.`Articulo` (`idArticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Articulo_has_Autor_Autor1`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `TrabajoBDB`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
