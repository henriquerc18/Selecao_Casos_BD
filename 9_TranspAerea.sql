-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema 9_Transp_Aerea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 9_Transp_Aerea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `9_Transp_Aerea` DEFAULT CHARACTER SET utf8 ;
USE `9_Transp_Aerea` ;

-- -----------------------------------------------------
-- Table `9_Transp_Aerea`.`Avioes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `9_Transp_Aerea`.`Avioes` (
  `idAvioes` INT NOT NULL AUTO_INCREMENT,
  `Matricula` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NumLugares` INT NOT NULL,
  `Autonomia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAvioes`, `Matricula`),
  UNIQUE INDEX `idAvioes_UNIQUE` (`idAvioes` ASC),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9_Transp_Aerea`.`Pilotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `9_Transp_Aerea`.`Pilotos` (
  `idPilotos` INT NOT NULL AUTO_INCREMENT,
  `Licença` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `ModelosAutorizados` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `idPilotos_UNIQUE` (`idPilotos` ASC),
  PRIMARY KEY (`idPilotos`, `Licença`),
  UNIQUE INDEX `Licença_UNIQUE` (`Licença` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9_Transp_Aerea`.`Voos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `9_Transp_Aerea`.`Voos` (
  `idVoos` INT NOT NULL AUTO_INCREMENT,
  `DataPartida` DATETIME NOT NULL,
  `HoraPartida` VARCHAR(45) NOT NULL,
  `LocalPartida` VARCHAR(45) NOT NULL,
  `LocalDestino` VARCHAR(45) NOT NULL,
  `Avioes_idAvioes` INT NOT NULL,
  `Avioes_Matricula` INT NOT NULL,
  `Pilotos_idPilotos` INT NOT NULL,
  `Pilotos_Licença` INT NOT NULL,
  PRIMARY KEY (`idVoos`, `Avioes_idAvioes`, `Avioes_Matricula`, `Pilotos_idPilotos`, `Pilotos_Licença`),
  UNIQUE INDEX `idVoos_UNIQUE` (`idVoos` ASC),
  INDEX `fk_Voos_Avioes_idx` (`Avioes_idAvioes` ASC, `Avioes_Matricula` ASC),
  INDEX `fk_Voos_Pilotos1_idx` (`Pilotos_idPilotos` ASC, `Pilotos_Licença` ASC),
  CONSTRAINT `fk_Voos_Avioes`
    FOREIGN KEY (`Avioes_idAvioes` , `Avioes_Matricula`)
    REFERENCES `9_Transp_Aerea`.`Avioes` (`idAvioes` , `Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voos_Pilotos1`
    FOREIGN KEY (`Pilotos_idPilotos` , `Pilotos_Licença`)
    REFERENCES `9_Transp_Aerea`.`Pilotos` (`idPilotos` , `Licença`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9_Transp_Aerea`.`Dependentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `9_Transp_Aerea`.`Dependentes` (
  `idDependentes` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Nascimento` DATETIME NOT NULL,
  PRIMARY KEY (`idDependentes`),
  UNIQUE INDEX `idDependentes_UNIQUE` (`idDependentes` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9_Transp_Aerea`.`Possuem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `9_Transp_Aerea`.`Possuem` (
  `Pilotos_idPilotos` INT NOT NULL,
  `Pilotos_Licença` INT NOT NULL,
  `Dependentes_idDependentes` INT NOT NULL,
  PRIMARY KEY (`Pilotos_idPilotos`, `Pilotos_Licença`, `Dependentes_idDependentes`),
  INDEX `fk_Pilotos_has_Dependentes_Dependentes1_idx` (`Dependentes_idDependentes` ASC),
  INDEX `fk_Pilotos_has_Dependentes_Pilotos1_idx` (`Pilotos_idPilotos` ASC, `Pilotos_Licença` ASC),
  CONSTRAINT `fk_Pilotos_has_Dependentes_Pilotos1`
    FOREIGN KEY (`Pilotos_idPilotos` , `Pilotos_Licença`)
    REFERENCES `9_Transp_Aerea`.`Pilotos` (`idPilotos` , `Licença`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pilotos_has_Dependentes_Dependentes1`
    FOREIGN KEY (`Dependentes_idDependentes`)
    REFERENCES `9_Transp_Aerea`.`Dependentes` (`idDependentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
