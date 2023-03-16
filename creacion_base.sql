-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TrabajoBDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `TrabajoBDB` ;

-- -----------------------------------------------------
-- Schema TrabajoBDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TrabajoBDB` DEFAULT CHARACTER SET utf8 ;
USE `TrabajoBDB` ;

-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Enfermedad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Enfermedad` (
  `idEnfermedad` VARCHAR(45) NOT NULL,
  `Pfrevalencia` VARCHAR(45) NULL,
  `CambioProteina` VARCHAR(45) NULL,
  PRIMARY KEY (`idEnfermedad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Proteina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Proteina` (
  `idProteina` VARCHAR(45) NOT NULL,
  `Longitud` INT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Organismo` VARCHAR(45) NULL,
  PRIMARY KEY (`idProteina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Proteina_has_Enfermedad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Proteina_has_Enfermedad` (
  `Proteina_idProteina` VARCHAR(45) NOT NULL,
  `Enfermedad_idEnfermedad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Proteina_idProteina`, `Enfermedad_idEnfermedad`),
  INDEX `fk_Proteina_has_Enfermedad_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  INDEX `fk_Proteina_has_Enfermedad_Proteina_idx` (`Proteina_idProteina` ASC) VISIBLE,
  CONSTRAINT `fk_Proteina_has_Enfermedad_Proteina`
    FOREIGN KEY (`Proteina_idProteina`)
    REFERENCES `TrabajoBDB`.`Proteina` (`idProteina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proteina_has_Enfermedad_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `TrabajoBDB`.`Enfermedad` (`idEnfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Sintomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Sintomas` (
  `idSintomas` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idSintomas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Sintomas_has_Enfermedad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Sintomas_has_Enfermedad` (
  `Sintomas_idSintomas` VARCHAR(45) NOT NULL,
  `Enfermedad_idEnfermedad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Sintomas_idSintomas`, `Enfermedad_idEnfermedad`),
  INDEX `fk_Sintomas_has_Enfermedad_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  INDEX `fk_Sintomas_has_Enfermedad_Sintomas1_idx` (`Sintomas_idSintomas` ASC) VISIBLE,
  CONSTRAINT `fk_Sintomas_has_Enfermedad_Sintomas1`
    FOREIGN KEY (`Sintomas_idSintomas`)
    REFERENCES `TrabajoBDB`.`Sintomas` (`idSintomas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sintomas_has_Enfermedad_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `TrabajoBDB`.`Enfermedad` (`idEnfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Articulo` (
  `idArticulo` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Fecha` DATE NULL,
  `Enfermedad_idEnfermedad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idArticulo`),
  INDEX `fk_Articulo_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  CONSTRAINT `fk_Articulo_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `TrabajoBDB`.`Enfermedad` (`idEnfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Genes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Genes` (
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Enfermedad_has_Genes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Enfermedad_has_Genes` (
  `Enfermedad_idEnfermedad` VARCHAR(45) NOT NULL,
  `Genes_Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Enfermedad_idEnfermedad`, `Genes_Nombre`),
  INDEX `fk_Enfermedad_has_Genes_Genes1_idx` (`Genes_Nombre` ASC) VISIBLE,
  INDEX `fk_Enfermedad_has_Genes_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC) VISIBLE,
  CONSTRAINT `fk_Enfermedad_has_Genes_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `TrabajoBDB`.`Enfermedad` (`idEnfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enfermedad_has_Genes_Genes1`
    FOREIGN KEY (`Genes_Nombre`)
    REFERENCES `TrabajoBDB`.`Genes` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Autor` (
  `idAutor` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabajoBDB`.`Articulo_has_Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TrabajoBDB`.`Articulo_has_Autor` (
  `Articulo_idArticulo` VARCHAR(45) NOT NULL,
  `Autor_idAutor` INT NOT NULL,
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
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
