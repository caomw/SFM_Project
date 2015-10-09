-- MySQL Script generated by MySQL Workbench
-- 10/08/15 14:28:30
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sfm
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sfm` ;

-- -----------------------------------------------------
-- Schema sfm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sfm` DEFAULT CHARACTER SET utf8 ;
USE `sfm` ;

-- -----------------------------------------------------
-- Table `sfm`.`_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`_user` ;

CREATE TABLE IF NOT EXISTS `sfm`.`_user` (
  `UserID` INT(11) NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(64) NOT NULL,
  `Password` VARCHAR(64) NOT NULL,
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`subject_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`subject_category` ;

CREATE TABLE IF NOT EXISTS `sfm`.`subject_category` (
  `CategoryID` INT(11) NOT NULL AUTO_INCREMENT,
  `CategoryNameE` VARCHAR(45) NULL DEFAULT '-',
  `CategoryNameV` VARCHAR(45) NULL DEFAULT '-',
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NULL DEFAULT b'1',
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`subject` ;

CREATE TABLE IF NOT EXISTS `sfm`.`subject` (
  `SubjectID` INT(11) NOT NULL AUTO_INCREMENT,
  `CategoryID` INT(11) NOT NULL,
  `SubjectNameE` VARCHAR(80) NULL DEFAULT '-',
  `SubjectNameV` VARCHAR(80) NULL DEFAULT '-',
  `SubjectCode` VARCHAR(15) NULL DEFAULT '-',
  `Abbreviation` VARCHAR(15) NULL DEFAULT '-',
  `NumOfCredit` INT(11) NULL DEFAULT '3',
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NULL DEFAULT b'1',
  PRIMARY KEY (`SubjectID`),
  INDEX `fk_subject_category_idx` (`CategoryID` ASC),
  CONSTRAINT `fk_subject_category`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `sfm`.`subject_category` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`compulsory_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`compulsory_subject` ;

CREATE TABLE IF NOT EXISTS `sfm`.`compulsory_subject` (
  `compulsorySubjectID` INT(11) NOT NULL,
  `subjectID` INT(11) NOT NULL,
  PRIMARY KEY (`compulsorySubjectID`, `subjectID`),
  INDEX `fk_subject_2_idx` (`compulsorySubjectID` ASC),
  INDEX `fk_subject_1` (`subjectID` ASC),
  CONSTRAINT `fk_subject_1`
    FOREIGN KEY (`subjectID`)
    REFERENCES `sfm`.`subject` (`SubjectID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_2`
    FOREIGN KEY (`compulsorySubjectID`)
    REFERENCES `sfm`.`subject` (`SubjectID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`course` ;

CREATE TABLE IF NOT EXISTS `sfm`.`course` (
  `CourseID` INT(11) NOT NULL AUTO_INCREMENT,
  `SubjectID` INT(11) NOT NULL,
  `Clazz` VARCHAR(30) NOT NULL DEFAULT '-',
  `Half` INT(11) NOT NULL DEFAULT '1',
  `StartDate` TIMESTAMP NULL DEFAULT NULL,
  `EndDate` TIMESTAMP NULL DEFAULT NULL,
  `CourseStatus` VARCHAR(30) NOT NULL DEFAULT '-' COMMENT 'Bắt đầu, đang học, đã đóng',
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`CourseID`),
  INDEX `fk_course_subject_idx` (`SubjectID` ASC),
  CONSTRAINT `fk_course_subject`
    FOREIGN KEY (`SubjectID`)
    REFERENCES `sfm`.`subject` (`SubjectID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`major` ;

CREATE TABLE IF NOT EXISTS `sfm`.`major` (
  `MajorID` INT(11) NOT NULL AUTO_INCREMENT,
  `MajorCode` VARCHAR(10) NOT NULL DEFAULT '-',
  `MajorName` VARCHAR(45) NOT NULL DEFAULT '-',
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`MajorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`student` ;

CREATE TABLE IF NOT EXISTS `sfm`.`student` (
  `StudentID` INT(11) NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(64) NOT NULL,
  `StudentCode` VARCHAR(10) NOT NULL,
  `Gender` BIT(1) NOT NULL,
  `DateOfBirth` TIMESTAMP NULL DEFAULT NULL,
  `Email` VARCHAR(255) NOT NULL DEFAULT '-',
  `SSN` VARCHAR(10) NOT NULL DEFAULT '-',
  `PhoneNumber` VARCHAR(15) NULL DEFAULT '-',
  `Address` TEXT NULL DEFAULT NULL,
  `FinanceType` VARCHAR(15) NOT NULL DEFAULT '-' COMMENT 'HB, TD, ĐT, BT',
  `MajorID` INT(11) NOT NULL COMMENT 'Chuyên Ngành : SE, SB, IA',
  `IsGraduated` BIT(1) NOT NULL DEFAULT b'0',
  `StudyStatus` VARCHAR(30) NOT NULL DEFAULT '-' COMMENT 'Đang Học, Bảo Lưu',
  `SubMajor` VARCHAR(45) NOT NULL DEFAULT '-',
  `Term` VARCHAR(10) NOT NULL DEFAULT '-' COMMENT 'K7, K8, K9',
  `NarrowSpecialization` VARCHAR(20) NOT NULL DEFAULT '-' COMMENT 'Chuyên Nghành hẹp :\n-Normal\n-IS\n-JS\n- ES',
  `ParentPhone` VARCHAR(15) NULL DEFAULT '-',
  `ParentEmail` VARCHAR(255) NULL DEFAULT '-',
  PRIMARY KEY (`StudentID`),
  UNIQUE INDEX `StudentCode_UNIQUE` (`StudentCode` ASC),
  UNIQUE INDEX `SSN_UNIQUE` (`SSN` ASC),
  INDEX `fk_student_major_idx` (`MajorID` ASC),
  CONSTRAINT `fk_student_major`
    FOREIGN KEY (`MajorID`)
    REFERENCES `sfm`.`major` (`MajorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_user`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`_user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`credit_student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`credit_student` ;

CREATE TABLE IF NOT EXISTS `sfm`.`credit_student` (
  `StudentID` INT(11) NOT NULL AUTO_INCREMENT,
  `CreditRate` INT(11) NOT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_loans_student`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`credit_debt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`credit_debt` ;

CREATE TABLE IF NOT EXISTS `sfm`.`credit_debt` (
  `CreditDebtID` INT(11) NOT NULL AUTO_INCREMENT,
  `StudentID` INT(11) NOT NULL,
  `InterestRate` INT(11) NULL DEFAULT NULL,
  `BaseMoney` MEDIUMTEXT NOT NULL,
  `Interest` MEDIUMTEXT NOT NULL,
  `TotalInterest` MEDIUMTEXT NOT NULL,
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NOT NULL,
  PRIMARY KEY (`CreditDebtID`),
  INDEX `fk_interest_before_idx` (`StudentID` ASC),
  CONSTRAINT `fk_interest_before`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`credit_student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`investment_student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`investment_student` ;

CREATE TABLE IF NOT EXISTS `sfm`.`investment_student` (
  `StudentID` INT(11) NOT NULL,
  `InvestmentRate` INT(11) NOT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_investing_student`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`investment_report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`investment_report` ;

CREATE TABLE IF NOT EXISTS `sfm`.`investment_report` (
  `ReportID` INT(11) NOT NULL AUTO_INCREMENT,
  `StudentID` INT(11) NOT NULL,
  `TotalMoney` MEDIUMTEXT NOT NULL,
  `PaidMoney` MEDIUMTEXT NOT NULL,
  `PayStatus` BIT(1) NOT NULL,
  `Bank` VARCHAR(45) NULL DEFAULT NULL,
  `DateTransfer` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  INDEX `fk_investing_report_idx` (`StudentID` ASC),
  CONSTRAINT `fk_investing_report`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`investment_student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`manager` ;

CREATE TABLE IF NOT EXISTS `sfm`.`manager` (
  `ManagerID` INT(11) NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(64) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Phone` VARCHAR(15) NULL DEFAULT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ManagerID`),
  CONSTRAINT `fk_manager_user`
    FOREIGN KEY (`ManagerID`)
    REFERENCES `sfm`.`_user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`study_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`study_level` ;

CREATE TABLE IF NOT EXISTS `sfm`.`study_level` (
  `StudyLevelID` INT(11) NOT NULL AUTO_INCREMENT,
  `LevelCode` VARCHAR(15) NOT NULL,
  `LevelName` VARCHAR(45) NOT NULL,
  `TuitionVND` INT(11) NOT NULL,
  `TuitionUSD` INT(11) NOT NULL,
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`StudyLevelID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`season` ;

CREATE TABLE IF NOT EXISTS `sfm`.`season` (
  `SeasonID` INT(11) NOT NULL AUTO_INCREMENT,
  `SeasonName` VARCHAR(45) NOT NULL,
  `StartDate` TIMESTAMP NULL DEFAULT NULL,
  `EndDate` TIMESTAMP NULL DEFAULT NULL,
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` VARCHAR(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SeasonID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`semester`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`semester` ;

CREATE TABLE IF NOT EXISTS `sfm`.`semester` (
  `SemesterID` INT(11) NOT NULL AUTO_INCREMENT,
  `SeasonID` INT(11) NOT NULL,
  `StudyLevelID` INT(11) NOT NULL,
  `StudentID` INT(11) NOT NULL,
  PRIMARY KEY (`SemesterID`),
  INDEX `fk_semester_level_idx` (`StudyLevelID` ASC),
  INDEX `fk_semester_season` (`SeasonID` ASC),
  INDEX `fk_semester_student_idx` (`StudentID` ASC),
  CONSTRAINT `fk_semester_level`
    FOREIGN KEY (`StudyLevelID`)
    REFERENCES `sfm`.`study_level` (`StudyLevelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_season`
    FOREIGN KEY (`SeasonID`)
    REFERENCES `sfm`.`season` (`SeasonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_student`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`student_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`student_course` ;

CREATE TABLE IF NOT EXISTS `sfm`.`student_course` (
  `StudentCourseID` INT(11) NOT NULL AUTO_INCREMENT,
  `StudentID` INT(11) NOT NULL,
  `CourseID` INT(11) NOT NULL,
  `SemesterID` INT(11) NOT NULL,
  `Mark` FLOAT NOT NULL DEFAULT '0',
  `IsPass` BIT(1) NOT NULL DEFAULT b'0',
  `IsActive` BIT(1) NOT NULL DEFAULT b'1',
  `Note` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`StudentCourseID`),
  INDEX `fk_student_course_idx` (`StudentID` ASC),
  INDEX `fk_student_course2_idx` (`CourseID` ASC),
  INDEX `fk_student_course_3_idx` (`SemesterID` ASC),
  CONSTRAINT `fk_student_course`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_course2`
    FOREIGN KEY (`CourseID`)
    REFERENCES `sfm`.`course` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_course3`
    FOREIGN KEY (`SemesterID`)
    REFERENCES `sfm`.`semester` (`SemesterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`resit_course_payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`resit_course_payment` ;

CREATE TABLE IF NOT EXISTS `sfm`.`resit_course_payment` (
  `ResitCoursePaymentID` INT(11) NOT NULL AUTO_INCREMENT,
  `StudentCourseID` INT(11) NOT NULL,
  `StudentID` INT(11) NOT NULL,
  `TotalTuition` INT(11) NOT NULL DEFAULT '0',
  `PaidAmount` INT(11) NOT NULL DEFAULT '0',
  `Status` BIT(1) NOT NULL DEFAULT b'0',
  `TransferDate` TIMESTAMP NULL DEFAULT NULL,
  `Note` TEXT NULL DEFAULT NULL,
  `Attempt` INT(11) NOT NULL DEFAULT '1',
  `IsActive` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ResitCoursePaymentID`),
  INDEX `fk_resit_course_idx` (`StudentCourseID` ASC),
  INDEX `fk_student_resit_payment_idx` (`StudentID` ASC),
  CONSTRAINT `fk_resit_course`
    FOREIGN KEY (`StudentCourseID`)
    REFERENCES `sfm`.`student_course` (`StudentCourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_resit_payment`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`role` ;

CREATE TABLE IF NOT EXISTS `sfm`.`role` (
  `RoleID` INT(11) NOT NULL AUTO_INCREMENT,
  `RoleName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`scholarship_student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`scholarship_student` ;

CREATE TABLE IF NOT EXISTS `sfm`.`scholarship_student` (
  `StudentID` INT(11) NOT NULL,
  `ScholarshipRate` INT(11) NOT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_schoolarship_student`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`staff` ;

CREATE TABLE IF NOT EXISTS `sfm`.`staff` (
  `StaffID` INT(11) NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(64) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Phone` VARCHAR(15) NULL DEFAULT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `fk_staff_user`
    FOREIGN KEY (`StaffID`)
    REFERENCES `sfm`.`_user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`subject_in_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`subject_in_level` ;

CREATE TABLE IF NOT EXISTS `sfm`.`subject_in_level` (
  `SubInLvID` INT(11) NOT NULL AUTO_INCREMENT,
  `StudyLevelID` INT(11) NOT NULL,
  `SubjectID` INT(11) NOT NULL,
  `MajorID` INT(11) NOT NULL,
  PRIMARY KEY (`SubInLvID`),
  INDEX `fk_level_sub_1_idx` (`StudyLevelID` ASC),
  INDEX `fk_level_sub_2_idx` (`SubjectID` ASC),
  INDEX `fk_level_sub_3_idx` (`MajorID` ASC),
  CONSTRAINT `fk_level_sub_1`
    FOREIGN KEY (`StudyLevelID`)
    REFERENCES `sfm`.`study_level` (`StudyLevelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_level_sub_2`
    FOREIGN KEY (`SubjectID`)
    REFERENCES `sfm`.`subject` (`SubjectID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_level_sub_3`
    FOREIGN KEY (`MajorID`)
    REFERENCES `sfm`.`major` (`MajorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`subtract_tuition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`subtract_tuition` ;

CREATE TABLE IF NOT EXISTS `sfm`.`subtract_tuition` (
  `SubtractTuitionID` INT(11) NOT NULL AUTO_INCREMENT,
  `SubtractTuitionName` VARCHAR(45) NOT NULL DEFAULT '-',
  `SubtractTuition` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SubtractTuitionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`tuition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`tuition` ;

CREATE TABLE IF NOT EXISTS `sfm`.`tuition` (
  `TuitionID` INT(11) NOT NULL AUTO_INCREMENT,
  `Abbreviation` VARCHAR(15) NOT NULL,
  `TuitionName` VARCHAR(125) NOT NULL,
  `TuitionVND` INT(11) NOT NULL,
  `TuitionUSA` INT(11) NOT NULL,
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`TuitionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`tuition_payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`tuition_payment` ;

CREATE TABLE IF NOT EXISTS `sfm`.`tuition_payment` (
  `TuitionPaymentID` INT(11) NOT NULL AUTO_INCREMENT,
  `StudentID` INT(11) NOT NULL,
  `TuitionID` INT(11) NOT NULL,
  `SemesterID` INT(11) NOT NULL,
  `TotalTuition` INT(11) NOT NULL DEFAULT '0',
  `SubtractTuitionID` INT(11) NOT NULL DEFAULT '-1' COMMENT 'Cac khoan khau tru',
  `ActualTuition` INT(11) NOT NULL DEFAULT '0',
  `PaidTuition` INT(11) NOT NULL DEFAULT '0',
  `Bank` VARCHAR(100) NOT NULL DEFAULT '-',
  `TransferDate` TIMESTAMP NULL DEFAULT NULL,
  `Status` VARCHAR(30) NOT NULL DEFAULT '\0',
  `Note` TEXT NULL DEFAULT NULL,
  `IsActive` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`TuitionPaymentID`),
  INDEX `fk_subtract_amount_idx` (`SubtractTuitionID` ASC),
  INDEX `fk_payment_student_idx` (`StudentID` ASC),
  INDEX `fk_payment_tuition_idx` (`TuitionID` ASC),
  INDEX `fk_payment_semester_idx` (`SemesterID` ASC),
  CONSTRAINT `fk_payment_semester`
    FOREIGN KEY (`SemesterID`)
    REFERENCES `sfm`.`semester` (`SemesterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_student`
    FOREIGN KEY (`StudentID`)
    REFERENCES `sfm`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_tuition`
    FOREIGN KEY (`TuitionID`)
    REFERENCES `sfm`.`tuition` (`TuitionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subtract_amount`
    FOREIGN KEY (`SubtractTuitionID`)
    REFERENCES `sfm`.`subtract_tuition` (`SubtractTuitionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sfm`.`user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sfm`.`user_role` ;

CREATE TABLE IF NOT EXISTS `sfm`.`user_role` (
  `UserID` INT(11) NOT NULL,
  `RoleID` INT(11) NOT NULL,
  PRIMARY KEY (`UserID`, `RoleID`),
  INDEX `fk__User_has_Role_Role1_idx` (`RoleID` ASC),
  INDEX `fk__User_has_Role__User1_idx` (`UserID` ASC),
  CONSTRAINT `fk__User_has_Role_Role1`
    FOREIGN KEY (`RoleID`)
    REFERENCES `sfm`.`role` (`RoleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk__User_has_Role__User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `sfm`.`_user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
