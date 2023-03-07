-- MySQL Script generated by MySQL Workbench
-- Tue Mar  7 17:01:05 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Enfermedad` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Enfermedad` (
  `idEnfermedad` VARCHAR(45) NOT NULL,
  `FechaInclusion` DATE NULL DEFAULT NULL,
  `Prevalencia` VARCHAR(45) NULL DEFAULT NULL,
  `Genes` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idEnfermedad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Articulo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Articulo` (
  `idArticulo` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Enfermedad_idEnfermedad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idArticulo`),
  INDEX `fk_Articulo_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  CONSTRAINT `fk_Articulo_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `mydb`.`Enfermedad` (`idEnfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Autor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `idAutor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Proteina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Proteina` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proteina` (
  `idProteina` VARCHAR(45) NOT NULL,
  `Secuencia` VARCHAR(45) NULL DEFAULT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idProteina`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Sintomas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sintomas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sintomas` (
  `idSintomas` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idSintomas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sintomas_has_Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sintomas_has_Enfermedad` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sintomas_has_Enfermedad` (
  `Sintomas_idSintomas` VARCHAR(45) NOT NULL,
  `Enfermedad_idEnfermedad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Sintomas_idSintomas`, `Enfermedad_idEnfermedad`),
  INDEX `fk_Sintomas_has_Enfermedad_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  INDEX `fk_Sintomas_has_Enfermedad_Sintomas1_idx` (`Sintomas_idSintomas` ASC) VISIBLE,
  CONSTRAINT `fk_Sintomas_has_Enfermedad_Sintomas1`
    FOREIGN KEY (`Sintomas_idSintomas`)
    REFERENCES `mydb`.`Sintomas` (`idSintomas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sintomas_has_Enfermedad_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `mydb`.`Enfermedad` (`idEnfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proteina_has_Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Proteina_has_Enfermedad` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proteina_has_Enfermedad` (
  `Proteina_idProteina` VARCHAR(45) NOT NULL,
  `Enfermedad_idEnfermedad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Proteina_idProteina`, `Enfermedad_idEnfermedad`),
  INDEX `fk_Proteina_has_Enfermedad_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  INDEX `fk_Proteina_has_Enfermedad_Proteina1_idx` (`Proteina_idProteina` ASC) VISIBLE,
  CONSTRAINT `fk_Proteina_has_Enfermedad_Proteina1`
    FOREIGN KEY (`Proteina_idProteina`)
    REFERENCES `mydb`.`Proteina` (`idProteina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proteina_has_Enfermedad_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `mydb`.`Enfermedad` (`idEnfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Enfermedad_has_Autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Enfermedad_has_Autor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Enfermedad_has_Autor` (
  `Enfermedad_idEnfermedad` VARCHAR(45) NOT NULL,
  `Autor_idAutor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Enfermedad_idEnfermedad`, `Autor_idAutor`),
  INDEX `fk_Enfermedad_has_Autor_Autor1_idx` (`Autor_idAutor` ASC) VISIBLE,
  INDEX `fk_Enfermedad_has_Autor_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  CONSTRAINT `fk_Enfermedad_has_Autor_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `mydb`.`Enfermedad` (`idEnfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enfermedad_has_Autor_Autor1`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `mydb`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
