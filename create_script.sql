SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `tutoring` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `tutoring` ;

-- -----------------------------------------------------
-- Table `tutoring`.`Tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Tutor` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Tutor` (
  `Tutor_Username` VARCHAR(25) NOT NULL ,
  `Tutor_First_Name` VARCHAR(25) NOT NULL ,
  `Tutor_Last_Name` VARCHAR(25) NOT NULL ,
  `Tutor_Email_ID` VARCHAR(25) NOT NULL ,
  `Student_ID` INT NOT NULL ,
  PRIMARY KEY (`Tutor_Username`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutoring`.`Major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Major` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Major` (
  `Major_ID` INT NOT NULL ,
  `Major_Name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Major_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutoring`.`Tutee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Tutee` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Tutee` (
  `Student_ID` INT NOT NULL ,
  `First_Name` VARCHAR(45) NOT NULL ,
  `Last_Name` VARCHAR(45) NOT NULL ,
  `Email_ID` VARCHAR(25) NOT NULL ,
  `Class_Year` YEAR NOT NULL ,
  `Tutee_Username` VARCHAR(25) NOT NULL ,
  `Major_ID` INT NOT NULL ,
  `Second_Major_ID` VARCHAR(45) NULL ,
  INDEX `Major_ID` (`Major_ID` ASC) ,
  PRIMARY KEY (`Tutee_Username`) ,
  CONSTRAINT `Major_ID`
    FOREIGN KEY (`Major_ID` )
    REFERENCES `tutoring`.`Major` (`Major_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutoring`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Course` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Course` (
  `Course_ID` INT NOT NULL ,
  `Course_Name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Course_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutoring`.`Instructor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Instructor` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Instructor` (
  `Instructor_ID` INT NOT NULL ,
  `Instructor_Name` VARCHAR(45) NOT NULL ,
  `Instructor_Email_Address` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Instructor_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutoring`.`Session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Session` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Session` (
  `Session_ID` INT NOT NULL ,
  `Description` VARCHAR(250) NULL ,
  `Instructor_ID` INT NOT NULL ,
  `Course_ID` INT NOT NULL ,
  `Tutor_Username` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`Session_ID`) ,
  INDEX `Instructor_ID` (`Instructor_ID` ASC) ,
  INDEX `Tutor_Username` (`Tutor_Username` ASC) ,
  CONSTRAINT `Course_ID`
    FOREIGN KEY (`Course_ID` )
    REFERENCES `tutoring`.`Course` (`Course_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Instructor_ID`
    FOREIGN KEY (`Instructor_ID` )
    REFERENCES `tutoring`.`Instructor` (`Instructor_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Tutor_Username`
    FOREIGN KEY (`Tutor_Username` )
    REFERENCES `tutoring`.`Tutor` (`Tutor_Username` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutoring`.`Session_Instance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Session_Instance` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Session_Instance` (
  `Instance_ID` INT NOT NULL ,
  `Instance_Date` DATE NOT NULL ,
  `Instance_Time` TIME NOT NULL ,
  `Number_of_Returning` INT NOT NULL ,
  `Number_of_New` INT NOT NULL ,
  `Session_ID` INT NOT NULL ,
  PRIMARY KEY (`Instance_ID`) ,
  INDEX `FK_Session_ID` (`Session_ID` ASC) ,
  CONSTRAINT `FK_Session_ID`
    FOREIGN KEY (`Session_ID` )
    REFERENCES `tutoring`.`Session` (`Session_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutoring`.`Administrator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Administrator` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Administrator` (
  `Admin_Username` VARCHAR(25) NOT NULL ,
  `Admin_Rights` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`Admin_Username`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutoring`.`Attendants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutoring`.`Attendants` ;

CREATE  TABLE IF NOT EXISTS `tutoring`.`Attendants` (
  `Instance_ID` INT NOT NULL ,
  `Tutee_Username` VARCHAR(25) NOT NULL ,
  INDEX `Instance_ID` (`Instance_ID` ASC) ,
  INDEX `Tutee_Username` (`Tutee_Username` ASC) ,
  CONSTRAINT `Instance_ID`
    FOREIGN KEY (`Instance_ID` )
    REFERENCES `tutoring`.`Session_Instance` (`Instance_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Tutee_Username`
    FOREIGN KEY (`Tutee_Username` )
    REFERENCES `tutoring`.`Tutee` (`Tutee_Username` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
