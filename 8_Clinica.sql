-- Nome: Henrique Rosa Carvalho
-- Turma: 421
-- Data: 18/05/2018

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema 8_Clinica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 8_Clinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `8_Clinica` DEFAULT CHARACTER SET utf8 ;
USE `8_Clinica` ;

-- -----------------------------------------------------
-- Table `8_Clinica`.`Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8_Clinica`.`Medicos` (
  `CRM` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Salario` FLOAT NOT NULL,
  `Especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CRM`),
  UNIQUE INDEX `CRM_UNIQUE` (`CRM` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `8_Clinica`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8_Clinica`.`Pacientes` (
  `CPF` INT(12) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `RG` INT(11) NULL,
  `Telefone` INT(12) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Nascimento` DATETIME NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `8_Clinica`.`Quartos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8_Clinica`.`Quartos` (
  `Numero` INT NOT NULL,
  `Andar` INT NOT NULL,
  `Pacientes_CPF` INT(12) NOT NULL,
  PRIMARY KEY (`Numero`, `Andar`),
  UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC),
  UNIQUE INDEX `Andar_UNIQUE` (`Andar` ASC),
  INDEX `fk_Quartos_Pacientes1_idx` (`Pacientes_CPF` ASC),
  CONSTRAINT `fk_Quartos_Pacientes1`
    FOREIGN KEY (`Pacientes_CPF`)
    REFERENCES `8_Clinica`.`Pacientes` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `8_Clinica`.`Atendem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `8_Clinica`.`Atendem` (
  `Medicos_CRM` INT NOT NULL,
  `Pacientes_CPF` INT(12) NOT NULL,
  PRIMARY KEY (`Medicos_CRM`, `Pacientes_CPF`),
  INDEX `fk_Medicos_has_Pacientes_Pacientes1_idx` (`Pacientes_CPF` ASC),
  INDEX `fk_Medicos_has_Pacientes_Medicos_idx` (`Medicos_CRM` ASC),
  CONSTRAINT `fk_Medicos_has_Pacientes_Medicos`
    FOREIGN KEY (`Medicos_CRM`)
    REFERENCES `8_Clinica`.`Medicos` (`CRM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicos_has_Pacientes_Pacientes1`
    FOREIGN KEY (`Pacientes_CPF`)
    REFERENCES `8_Clinica`.`Pacientes` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
