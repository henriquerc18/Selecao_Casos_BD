-- Nome: Henrique Rosa Carvalho
-- Turma: 421
-- Data: 18/05/2018


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema 3_Cinema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 3_Cinema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `3_Cinema` DEFAULT CHARACTER SET utf8 ;
USE `3_Cinema` ;

-- -----------------------------------------------------
-- Table `3_Cinema`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Filme` (
  `CodFilme` INT(11) NOT NULL AUTO_INCREMENT,
  `NomeLingOrig` VARCHAR(45) NOT NULL,
  `NomePort` VARCHAR(45) NOT NULL,
  `Ano` INT NOT NULL,
  `Sinopse` VARCHAR(300) NOT NULL,
  `Diretor` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodFilme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3_Cinema`.`Premiacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Premiacao` (
  `CodPrem` INT(11) NOT NULL AUTO_INCREMENT,
  `Premiacoes` VARCHAR(45) NULL,
  `Indicacoes` VARCHAR(45) NULL,
  PRIMARY KEY (`CodPrem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3_Cinema`.`Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Horario` (
  `CodHorario` INT(11) NOT NULL AUTO_INCREMENT,
  `Hora` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodHorario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3_Cinema`.`Sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Sala` (
  `Nome` INT NOT NULL AUTO_INCREMENT,
  `Capacidade` INT(3) NOT NULL,
  PRIMARY KEY (`Nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3_Cinema`.`Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Funcionarios` (
  `NumCartTrab` INT(11) NOT NULL AUTO_INCREMENT,
  `NomeFunc` VARCHAR(45) NOT NULL,
  `DataAdmissao` DATETIME NOT NULL,
  `Salario` FLOAT NOT NULL,
  PRIMARY KEY (`NumCartTrab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3_Cinema`.`Exibido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Exibido` (
  `Filme_CodFilme` INT(11) NOT NULL,
  `Horario_CodHorario` INT(11) NOT NULL,
  PRIMARY KEY (`Filme_CodFilme`, `Horario_CodHorario`),
  INDEX `fk_Filme_has_Horario_Horario1_idx` (`Horario_CodHorario` ASC),
  INDEX `fk_Filme_has_Horario_Filme1_idx` (`Filme_CodFilme` ASC),
  CONSTRAINT `fk_Filme_has_Horario_Filme1`
    FOREIGN KEY (`Filme_CodFilme`)
    REFERENCES `3_Cinema`.`Filme` (`CodFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Horario_Horario1`
    FOREIGN KEY (`Horario_CodHorario`)
    REFERENCES `3_Cinema`.`Horario` (`CodHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3_Cinema`.`Possui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Possui` (
  `Filme_CodFilme` INT(11) NOT NULL,
  `Premiacao_CodPrem` INT(11) NOT NULL,
  PRIMARY KEY (`Filme_CodFilme`, `Premiacao_CodPrem`),
  INDEX `fk_Filme_has_Premiacao_Premiacao1_idx` (`Premiacao_CodPrem` ASC),
  INDEX `fk_Filme_has_Premiacao_Filme1_idx` (`Filme_CodFilme` ASC),
  CONSTRAINT `fk_Filme_has_Premiacao_Filme1`
    FOREIGN KEY (`Filme_CodFilme`)
    REFERENCES `3_Cinema`.`Filme` (`CodFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Premiacao_Premiacao1`
    FOREIGN KEY (`Premiacao_CodPrem`)
    REFERENCES `3_Cinema`.`Premiacao` (`CodPrem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3_Cinema`.`Relacionada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Relacionada` (
  `Sala_Nome` INT NOT NULL,
  `Horario_CodHorario` INT(11) NOT NULL,
  PRIMARY KEY (`Sala_Nome`, `Horario_CodHorario`),
  INDEX `fk_Sala_has_Horario_Horario1_idx` (`Horario_CodHorario` ASC),
  INDEX `fk_Sala_has_Horario_Sala1_idx` (`Sala_Nome` ASC),
  CONSTRAINT `fk_Sala_has_Horario_Sala1`
    FOREIGN KEY (`Sala_Nome`)
    REFERENCES `3_Cinema`.`Sala` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sala_has_Horario_Horario1`
    FOREIGN KEY (`Horario_CodHorario`)
    REFERENCES `3_Cinema`.`Horario` (`CodHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3_Cinema`.`Vinculado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3_Cinema`.`Vinculado` (
  `Horario_CodHorario` INT(11) NOT NULL,
  `Funcionarios_NumCartTrab` INT(11) NOT NULL,
  PRIMARY KEY (`Horario_CodHorario`, `Funcionarios_NumCartTrab`),
  INDEX `fk_Horario_has_Funcionarios_Funcionarios1_idx` (`Funcionarios_NumCartTrab` ASC),
  INDEX `fk_Horario_has_Funcionarios_Horario1_idx` (`Horario_CodHorario` ASC),
  CONSTRAINT `fk_Horario_has_Funcionarios_Horario1`
    FOREIGN KEY (`Horario_CodHorario`)
    REFERENCES `3_Cinema`.`Horario` (`CodHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Horario_has_Funcionarios_Funcionarios1`
    FOREIGN KEY (`Funcionarios_NumCartTrab`)
    REFERENCES `3_Cinema`.`Funcionarios` (`NumCartTrab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
