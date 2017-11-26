-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bases2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bases2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bases2` DEFAULT CHARACTER SET utf8 ;
USE `bases2` ;

-- -----------------------------------------------------
-- Table `bases2`.`palabra_contador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bases2`.`palabra_contador` (
  `idPalabra_Contador` INT(11) NOT NULL AUTO_INCREMENT,
  `Palabra` VARCHAR(150) NOT NULL,
  `Cantidad` INT(11) NOT NULL,
  PRIMARY KEY (`idPalabra_Contador`))
ENGINE = InnoDB
AUTO_INCREMENT = 363
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bases2`.`palabra_url`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bases2`.`palabra_url` (
  `idpalabra_url` INT(11) NOT NULL AUTO_INCREMENT,
  `Link` VARCHAR(150) NOT NULL,
  `PalabraID` INT(11) NOT NULL,
  PRIMARY KEY (`idpalabra_url`),
  CONSTRAINT `palabraXlink`
    FOREIGN KEY (`PalabraID`)
    REFERENCES `bases2`.`palabra_contador` (`idPalabra_Contador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1298
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `palabraXlink_idx` ON `bases2`.`palabra_url` (`PalabraID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
