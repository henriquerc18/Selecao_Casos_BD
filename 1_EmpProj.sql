-- Nome: Henrique Rosa Carvalho
-- Turma: 421
-- Data: 18/05/2018

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema 1_EmpProj
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 1_EmpProj
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `1_EmpProj` DEFAULT CHARACTER SET utf8 ;
USE `1_EmpProj` ;

-- -----------------------------------------------------
-- Table `1_EmpProj`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `1_EmpProj`.`Empregado` (
  `idEmpregado` INT NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(45) NOT NULL,
  `Funcao` VARCHAR(45) NOT NULL,
  `Salario` FLOAT NOT NULL,
  `EmpNome` VARCHAR(45) NOT NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  `RG` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpregado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1_EmpProj`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `1_EmpProj`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1_EmpProj`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `1_EmpProj`.`Empregado` (
  `idEmpregado` INT NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(45) NOT NULL,
  `Funcao` VARCHAR(45) NOT NULL,
  `Salario` FLOAT NOT NULL,
  `EmpNome` VARCHAR(45) NOT NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  `RG` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpregado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1_EmpProj`.`Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `1_EmpProj`.`Projeto` (
  `idProjeto` INT NOT NULL AUTO_INCREMENT,
  `Orcamento` FLOAT NOT NULL,
  `DataInicio` VARCHAR(45) NOT NULL,
  `DataTermino` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProjeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1_EmpProj`.`Empregado_has_Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `1_EmpProj`.`Empregado_has_Projeto` (
  `IdEmpregado` INT NOT NULL,
  `idProjeto` INT NOT NULL,
  PRIMARY KEY (`IdEmpregado`, `idProjeto`),
  INDEX `fk_Empregado_has_Projeto_Projeto1_idx` (`idProjeto` ASC),
  INDEX `fk_Empregado_has_Projeto_Empregado_idx` (`IdEmpregado` ASC),
  CONSTRAINT `fk_Empregado_has_Projeto_Empregado`
    FOREIGN KEY (`IdEmpregado`)
    REFERENCES `1_EmpProj`.`Empregado` (`idEmpregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empregado_has_Projeto_Projeto1`
    FOREIGN KEY (`idProjeto`)
    REFERENCES `1_EmpProj`.`Projeto` (`idProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
