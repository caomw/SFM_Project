-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: sfm
-- ------------------------------------------------------
-- Server version	5.6.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_user`
--

DROP TABLE IF EXISTS `_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(64) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user`
--

LOCK TABLES `_user` WRITE;
/*!40000 ALTER TABLE `_user` DISABLE KEYS */;
INSERT INTO `_user` VALUES (1,'admin','123456','-','','2015-10-11 19:06:49','2015-10-11 19:06:49'),(2,'manager','123456','-','','2015-10-11 19:06:49','2015-10-11 19:06:49'),(3,'staff','123456','-','','2015-10-11 19:06:49','2015-10-11 19:06:49'),(4,'student','123456','-','','2015-10-11 19:06:49','2015-10-11 19:06:49');
/*!40000 ALTER TABLE `_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clazz`
--

DROP TABLE IF EXISTS `clazz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clazz` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(20) NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clazz`
--

LOCK TABLES `clazz` WRITE;
/*!40000 ALTER TABLE `clazz` DISABLE KEYS */;
INSERT INTO `clazz` VALUES (1,'CHUA_XEP_LOP','-','','2015-10-13 05:35:44','2015-10-13 05:35:44');
/*!40000 ALTER TABLE `clazz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `SubInSemID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `Mark` float NOT NULL DEFAULT '0',
  `IsPass` bit(1) NOT NULL DEFAULT b'0',
  `IsRetake` bit(1) NOT NULL DEFAULT b'0',
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CourseID`),
  KEY `fk_course_student_idx` (`StudentID`),
  KEY `fk_course_subject_idx` (`SubInSemID`),
  KEY `fk_course_class_idx` (`ClassID`),
  CONSTRAINT `fk_course_class` FOREIGN KEY (`ClassID`) REFERENCES `clazz` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_subject` FOREIGN KEY (`SubInSemID`) REFERENCES `subject_in_semester` (`SubInSemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_debt`
--

DROP TABLE IF EXISTS `credit_debt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_debt` (
  `CreditDebtID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `InterestRate` int(11) DEFAULT NULL,
  `BaseMoney` mediumtext NOT NULL,
  `Interest` mediumtext NOT NULL,
  `TotalInterest` mediumtext NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CreditDebtID`),
  KEY `fk_interest_before_idx` (`StudentID`),
  CONSTRAINT `fk_interest_before` FOREIGN KEY (`StudentID`) REFERENCES `credit_student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_debt`
--

LOCK TABLES `credit_debt` WRITE;
/*!40000 ALTER TABLE `credit_debt` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_debt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_student`
--

DROP TABLE IF EXISTS `credit_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_student` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `CreditRate` int(11) NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_loans_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_student`
--

LOCK TABLES `credit_student` WRITE;
/*!40000 ALTER TABLE `credit_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_type`
--

DROP TABLE IF EXISTS `financial_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_type` (
  `FinancialTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `FinancialTypeName` varchar(45) NOT NULL DEFAULT '-',
  `FinancialRate` int(11) NOT NULL DEFAULT '0',
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FinancialTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_type`
--

LOCK TABLES `financial_type` WRITE;
/*!40000 ALTER TABLE `financial_type` DISABLE KEYS */;
INSERT INTO `financial_type` VALUES (1,'HB',50,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(2,'HB',70,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(3,'HB',100,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(4,'TD',50,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(5,'TD',70,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(6,'TD',90,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(7,'DT',60,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(8,'DT',70,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(9,'DT',90,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(10,'NVD',100,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19'),(11,'BT',0,'-','','2015-10-11 19:45:19','2015-10-11 19:45:19');
/*!40000 ALTER TABLE `financial_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investment_report`
--

DROP TABLE IF EXISTS `investment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment_report` (
  `ReportID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `TotalMoney` mediumtext NOT NULL,
  `PaidMoney` mediumtext NOT NULL,
  `PayStatus` bit(1) NOT NULL,
  `Bank` varchar(45) DEFAULT NULL,
  `DateTransfer` timestamp NULL DEFAULT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReportID`),
  KEY `fk_investing_report_idx` (`StudentID`),
  CONSTRAINT `fk_investing_report` FOREIGN KEY (`StudentID`) REFERENCES `investment_student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investment_report`
--

LOCK TABLES `investment_report` WRITE;
/*!40000 ALTER TABLE `investment_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `investment_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investment_student`
--

DROP TABLE IF EXISTS `investment_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment_student` (
  `StudentID` int(11) NOT NULL,
  `InvestmentRate` int(11) NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_investing_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investment_student`
--

LOCK TABLES `investment_student` WRITE;
/*!40000 ALTER TABLE `investment_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `investment_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `MajorID` int(11) NOT NULL AUTO_INCREMENT,
  `MajorCode` varchar(10) NOT NULL DEFAULT '-',
  `MajorName` varchar(45) NOT NULL DEFAULT '-',
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MajorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'SE','SOFTWARE ENGINEERING','-','','2015-10-11 19:46:21','2015-10-11 19:46:21'),(2,'SB','School For Business','-','','2015-10-11 19:46:21','2015-10-11 19:46:21'),(3,'IA','IA','-','','2015-10-11 19:53:49','2015-10-11 19:53:49'),(4,'TKDH','THIẾT KẾ ĐỒ HỌA','-','','2015-10-11 19:58:26','2015-10-11 19:58:26');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `ManagerID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(64) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT NULL,
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ManagerID`),
  CONSTRAINT `fk_manager_user` FOREIGN KEY (`ManagerID`) REFERENCES `_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mandatory_subject`
--

DROP TABLE IF EXISTS `mandatory_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mandatory_subject` (
  `MandatorySubID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectId` int(11) NOT NULL,
  `RequireSubjectID` int(11) NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MandatorySubID`),
  KEY `fk_subject_has_subject_subject2_idx` (`RequireSubjectID`),
  KEY `fk_subject_has_subject_subject1_idx` (`SubjectId`),
  CONSTRAINT `fk_subject_has_subject_subject1` FOREIGN KEY (`SubjectId`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_subject_subject2` FOREIGN KEY (`RequireSubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mandatory_subject`
--

LOCK TABLES `mandatory_subject` WRITE;
/*!40000 ALTER TABLE `mandatory_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `mandatory_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `money_rate`
--

DROP TABLE IF EXISTS `money_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `money_rate` (
  `RateID` int(11) NOT NULL AUTO_INCREMENT,
  `Rate` float NOT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_rate`
--

LOCK TABLES `money_rate` WRITE;
/*!40000 ALTER TABLE `money_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `money_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retake_subject_payment`
--

DROP TABLE IF EXISTS `retake_subject_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retake_subject_payment` (
  `RetakeSubPaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `SubInSemID` int(11) NOT NULL,
  `TotalTuition` int(11) NOT NULL DEFAULT '0',
  `PaidTuition` int(11) NOT NULL DEFAULT '0',
  `Status` bit(1) NOT NULL DEFAULT b'0',
  `TransferDate` timestamp NULL DEFAULT NULL,
  `Bank` varchar(125) NOT NULL DEFAULT '-',
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RetakeSubPaymentID`),
  KEY `fk_retake_sub_student_idx` (`StudentID`),
  KEY `fk_retake_sub_in_sem_idx` (`SubInSemID`),
  CONSTRAINT `fk_retake_sub_in_sem` FOREIGN KEY (`SubInSemID`) REFERENCES `subject_in_semester` (`SubInSemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_retake_sub_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retake_subject_payment`
--

LOCK TABLES `retake_subject_payment` WRITE;
/*!40000 ALTER TABLE `retake_subject_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `retake_subject_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(30) NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN','-','','2015-10-11 19:06:49','2015-10-11 19:06:49'),(2,'MANAGER','-','','2015-10-11 19:06:49','2015-10-11 19:06:49'),(3,'STAFF','-','','2015-10-11 19:06:49','2015-10-11 19:06:49'),(4,'STUDENT','-','','2015-10-11 19:06:49','2015-10-11 19:06:49');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `SemesterID` int(11) NOT NULL AUTO_INCREMENT,
  `TermID` int(11) NOT NULL,
  `MajorID` int(11) NOT NULL,
  `StudyStageID` int(11) NOT NULL,
  `StageTuitionUSD` int(11) NOT NULL DEFAULT '0',
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `DateCreated` timestamp NULL DEFAULT NULL,
  `DateUpdated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SemesterID`),
  KEY `fk_semester_level_idx` (`StudyStageID`),
  KEY `fk_semester_season` (`TermID`),
  KEY `fk_semester_major_idx` (`MajorID`),
  CONSTRAINT `fk_semester_level` FOREIGN KEY (`StudyStageID`) REFERENCES `study_stage` (`StudyStageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_major` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_season` FOREIGN KEY (`TermID`) REFERENCES `term` (`TermID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,1,1,1,450,'-','',NULL,NULL),(2,1,1,2,450,'-','',NULL,NULL),(3,1,1,3,450,'-','',NULL,NULL),(4,1,1,4,450,'-','',NULL,NULL),(5,1,1,5,450,'-','',NULL,NULL),(6,1,1,6,450,'-','',NULL,NULL),(7,1,1,7,1100,'-','',NULL,NULL),(8,1,1,8,1100,'-','',NULL,NULL),(9,1,1,9,1100,'-','',NULL,NULL),(10,1,1,10,1100,'-','',NULL,NULL),(11,1,1,11,1100,'-','',NULL,NULL),(12,1,1,12,1100,'-','',NULL,NULL),(13,1,1,13,1100,'-','',NULL,NULL),(14,1,1,14,1100,'-','',NULL,NULL),(15,1,1,15,1100,'-','',NULL,NULL),(16,1,1,16,1100,'-','',NULL,NULL),(18,1,2,1,450,'-','',NULL,NULL),(19,1,2,2,450,'-','',NULL,NULL),(20,1,2,3,450,'-','',NULL,NULL),(21,1,2,4,450,'-','',NULL,NULL),(22,1,2,5,450,'-','',NULL,NULL),(23,1,2,6,450,'-','',NULL,NULL),(24,1,2,7,1100,'-','',NULL,NULL),(25,1,2,8,1100,'-','',NULL,NULL),(26,1,2,9,1100,'-','',NULL,NULL),(27,1,2,10,1100,'-','',NULL,NULL),(28,1,2,11,1100,'-','',NULL,NULL),(29,1,2,12,1100,'-','',NULL,NULL),(30,1,2,13,1100,'-','',NULL,NULL),(31,1,2,14,1100,'-','',NULL,NULL),(32,1,2,15,1100,'-','',NULL,NULL),(33,1,2,16,1100,'-','',NULL,NULL),(35,1,3,1,450,'-','',NULL,NULL),(36,1,3,2,450,'-','',NULL,NULL),(37,1,3,3,450,'-','',NULL,NULL),(38,1,3,4,450,'-','',NULL,NULL),(39,1,3,5,450,'-','',NULL,NULL),(40,1,3,6,450,'-','',NULL,NULL),(41,1,3,7,1100,'-','',NULL,NULL),(42,1,3,8,1100,'-','',NULL,NULL),(43,1,3,9,1100,'-','',NULL,NULL),(44,1,3,10,1100,'-','',NULL,NULL),(45,1,3,11,1100,'-','',NULL,NULL),(46,1,3,12,1100,'-','',NULL,NULL),(47,1,3,13,1100,'-','',NULL,NULL),(48,1,3,14,1100,'-','',NULL,NULL),(49,1,3,15,1100,'-','',NULL,NULL),(50,1,3,16,1100,'-','',NULL,NULL),(52,1,4,1,450,'-','',NULL,NULL),(53,1,4,2,450,'-','',NULL,NULL),(54,1,4,3,450,'-','',NULL,NULL),(55,1,4,4,450,'-','',NULL,NULL),(56,1,4,5,450,'-','',NULL,NULL),(57,1,4,6,450,'-','',NULL,NULL),(58,1,4,7,1100,'-','',NULL,NULL),(59,1,4,8,1100,'-','',NULL,NULL),(60,1,4,9,1100,'-','',NULL,NULL),(61,1,4,10,1100,'-','',NULL,NULL),(62,1,4,11,1100,'-','',NULL,NULL),(63,1,4,12,1100,'-','',NULL,NULL),(64,1,4,13,1100,'-','',NULL,NULL),(65,1,4,14,1100,'-','',NULL,NULL),(66,1,4,15,1100,'-','',NULL,NULL),(67,1,4,16,1100,'-','',NULL,NULL);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(64) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT NULL,
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `fk_staff_user` FOREIGN KEY (`StaffID`) REFERENCES `_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(64) NOT NULL,
  `StudentCode` varchar(10) NOT NULL,
  `Gender` bit(1) NOT NULL,
  `DateOfBirth` timestamp NULL DEFAULT NULL,
  `Email` varchar(255) NOT NULL DEFAULT '-',
  `SSN` varchar(10) NOT NULL DEFAULT '-',
  `PhoneNumber` varchar(15) DEFAULT '-',
  `Address` text,
  `MajorID` int(11) NOT NULL COMMENT 'Chuyên Ngành : SE, SB, IA',
  `FinancialTypeID` int(11) NOT NULL,
  `IsGraduated` bit(1) NOT NULL DEFAULT b'0',
  `Status` varchar(30) NOT NULL DEFAULT '-' COMMENT 'Đang Học, Bảo Lưu',
  `SubMajor` varchar(45) NOT NULL DEFAULT '-',
  `Term` varchar(10) NOT NULL DEFAULT '-' COMMENT 'K7, K8, K9',
  `NarrowSpecialization` varchar(20) NOT NULL DEFAULT '-' COMMENT 'Chuyên Nghành hẹp :\n-Normal\n-IS\n-JS\n- ES',
  `ParentPhone` varchar(15) DEFAULT '-',
  `ParentEmail` varchar(255) DEFAULT '-',
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CurrentStudyStage` varchar(10) NOT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `StudentCode_UNIQUE` (`StudentCode`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`),
  KEY `fk_student_major_idx` (`MajorID`),
  KEY `fk_student_financial_idx` (`FinancialTypeID`),
  KEY `fk_student_status_idx` (`Status`),
  CONSTRAINT `fk_student_financial` FOREIGN KEY (`FinancialTypeID`) REFERENCES `financial_type` (`FinancialTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_major` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_user` FOREIGN KEY (`StudentID`) REFERENCES `_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2352 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_status`
--

DROP TABLE IF EXISTS `student_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_status` (
  `StudentStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(45) NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StudentStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_status`
--

LOCK TABLES `student_status` WRITE;
/*!40000 ALTER TABLE `student_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_stage`
--

DROP TABLE IF EXISTS `study_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_stage` (
  `StudyStageID` int(11) NOT NULL AUTO_INCREMENT,
  `StageCode` varchar(15) NOT NULL,
  `StageName` varchar(45) NOT NULL,
  `Order` int(11) NOT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`StudyStageID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_stage`
--

LOCK TABLES `study_stage` WRITE;
/*!40000 ALTER TABLE `study_stage` DISABLE KEYS */;
INSERT INTO `study_stage` VALUES (1,'ENG1','Tiếng Anh dự bị 1',1,'-',''),(2,'ENG2','Tiếng Anh dự bị 2',2,'-',''),(3,'ENG3','Tiếng Anh dự bị 3',3,'-',''),(4,'ENG4','Tiếng Anh dự bị 4',4,'-',''),(5,'ENG5','Tiếng Anh dự bị 5',5,'-',''),(6,'ENG6','Tiếng Anh dự bị 6',6,'-',''),(7,'SEM1','Chuyên ngành 1',7,'-',''),(8,'SEM2','Chuyên ngành 2',8,'-',''),(9,'SEM3','Chuyên ngành 3',9,'-',''),(10,'SEM4','Chuyên ngành 4',10,'-',''),(11,'SEM5','Chuyên ngành 5',11,'-',''),(12,'SEM6','Chuyên ngành 6',12,'-',''),(13,'SEM7','Chuyên ngành 7',13,'-',''),(14,'SEM8','Chuyên ngành 8',14,'-',''),(15,'SEM9','Chuyên ngành 9',15,'-',''),(16,'SEM10','Chuyên ngành 10',16,'-','');
/*!40000 ALTER TABLE `study_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectNameE` varchar(80) DEFAULT '-',
  `SubjectNameV` varchar(80) DEFAULT '-',
  `SubjectCode` varchar(15) DEFAULT '-',
  `Abbreviation` varchar(15) DEFAULT '-',
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Principles of Accounting','Nguyên lý kế toán','ACC101','POA','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(2,'Managerial Accounting','Kế toán quản lý','ACC302','MA','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(3,'Financial Statement Analysis','Phân tích báo cáo tài chính','ACC305','FSA','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(4,'Principle Of Banking','Các nguyên tắc cơ bản về ngân hàng','BKG201','POB','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(5,'Bank Management','Quản trị ngân hàng','BKG301','BM','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(6,'Investment Project Appraisal','Thẩm định dự án đầu tư','BKG302','IPA','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(7,'Bank Lending','Tín dụng ngân hàng','BKG304','BL','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(8,'Business Ethics','Đạo đức kinh doanh','BUE201','EIB','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(9,'Computer Organization and Architecture','Tổ chức và Kiến trúc máy tính','CEA201','-','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(10,'Data Structure and Algorithm','Cấu trúc dữ liệu và giải thuật','CSD201','DSA','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(11,'Introduction to Computing','Nhập môn tính toán','CSI101','I2C','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(12,'Introduction to Informatics','Tin học đại cương','CSI102','I2I','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(13,'Chinese Elementary 1','Tiếng Trung sơ cấp 1','CHN111','CHN1','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(14,'Chinese Elementary 2','Tiếng Trung sơ cấp 2','CHN122','CHN2','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(15,'Chinese Elementary 3','Tiếng Trung sơ cấp 3','CHN132','CHN3','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(16,'Database Advanced','Cơ sở dữ liệu nâng cao','DBD301','AD','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(17,'Database Systems','Các hệ cơ sở dữ liệu','DBI202','-','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(18,'Digital Fundamentals','Cơ sở số hóa','DGT201','DF','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(19,'Digital Signal Processing','Xử lý tín hiệu số','DGT301','DSP','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(20,'Basic Microeconomics','Kinh tế vi mô','ECO111','BMiE','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(21,'Basic Macroeconomics','Kinh tế vĩ mô','ECO121','BMaE','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(22,'Business English 1','Tiếng Anh doanh nghiệp 1','ENI101','E-BE1','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(23,'Business English 2','Tiếng Anh doanh nghiệp 2','ENI201','E-BE2','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(24,'Business English 3','Tiếng Anh doanh nghiệp 3','ENI301','E-BE3','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(25,'Business English 4','Tiếng Anh doanh nghiệp 4','ENI401','E-BE4','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(26,'Academic English 1','Tiếng Anh học thuật 1','ENL111','A-ENG1','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(27,'Academic English 2','Tiếng Anh học thuật 2','ENL112','A-ENG2','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(28,'Elementary Business English','Tiếng Anh thương mại Elementary ','ENM101','MKL1','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(29,'Pre-Intermediate Business English','Tiếng Anh thương mại Pre-Intermediate','ENM201','MKL2','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(30,'Intermediate Business English','Tiếng Anh thương mại Intermediate','ENM301','MKL3','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(31,'Upper Intermediate','Tiếng Anh thương mại Upper ','ENM401','MKL4','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(32,'Top Notch 1','Tiếng Anh 2','ENT101','ENG2','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(33,'Top Notch 2','Tiếng Anh 3','ENT201','ENG3','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(34,'Top Notch 3','Tiếng Anh 4','ENT301 ','ENG4','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(35,'Summit 1','Tiếng Anh 5','ENT401','ENG5','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(36,'Summit 2','Tiếng Anh 6','ENT501','ENG6','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(37,'Embedded System Hardware','Phần cứng hệ thống nhúng','ESH201','ESH','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(38,'Embedded Software Development','Phát triển phần mềm nhúng','ESS301','ESS','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(39,'Entrepreneurship','Khởi Sự Doanh Nghiệp','ETR401','SBE','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(40,'Software Entrepreneurship','Khởi nghiệp phần mềm','ETR402','SWE','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(41,'Valuation and Financial Modeling','Các mô hình tài chính','FIM301','V&FM','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(42,'Monetary Economics and Global Economy','Kinh tế tiền tệ và Kinh tế toàn cầu','FIN201','M&GE','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(43,'Principles Of Corporate Finance','Tài chính doanh nghiệp','FIN202','CF','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(44,'Financial Market And Institutions','Thị trường & các định chế tài chính','FIN301','FM&I','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(45,'Advanced Corporate Finance','Tài chính doanh nghiệp nâng cao','FIN303','ACF','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(46,'Derivatives','Công cụ phái sinh','FIN402','DER','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(47,'Applied Graphic Design','Ứng dụng thiết kế đồ họa','GDP101','AGD','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(48,'Graduation Thesis (For Marketing concentration)','Marketing','GRA491 ','MKT','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(49,'Graduation Thesis (For Finance Concentration \nof BBA and BFB)','Tài chính','GRA492','FIN','-','','2015-10-12 02:54:48','2015-10-12 02:54:48'),(50,'Graduation Thesis (For Banking Concentration )','Tài chính Doanh nghiệp ','GRA494','COF','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(51,'Graduation Thesis (For Marketing & Sales concentration)','Ngân hàng thương mại','GRA495','COB','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(52,'Human Computer Interaction','Tương tác người máy','HCI201','HCI','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(53,'Ho Chi Minh Ideology','Tư tưởng Hồ Chí Minh','HCM201','TTHCM','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(54,'E-Commerce','Thương mại điện tử','ISC301','ECOM','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(55,'E-Commerce for Business','Thương mại điện tử','ISC302','ECOMB','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(56,'IT Applications In Enterprise','Ứng dụng CNTT trong doanh nghiệp','ITA201','ITAE','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(57,'Management Information System','Hệ thống thông tin quản lý','ITA202','MIS','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(58,'Ethics in Information Technology','Đạo đức nghề nghiệp','ITE302','EIT','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(59,'Japanese Fundamental Information Technology Skill Standards','Tiếng Nhật CNTT','JFE301','JITF','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(60,'IT JAPANESE','Tiếng Nhật CNTT','JIT301','JIT','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(61,'Japanese Language 1.1 - Dekiru','Tiếng Nhật sơ cấp 1','JPD111','JPD1','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(62,'Japanese Language 1.2 - Dekiru','Tiếng Nhật sơ cấp 2','JPD121','JPD2','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(63,'Japanese Language 1.3 - Dekiru','Tiếng Nhật sơ cấp 3','JPD131','JPD3','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(64,'Japanese Language 1.4 - Dekiru','Tiếng Nhật sơ cấp 4','JPD141','JPD4','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(65,'Japanese Language 1.1','Tiếng Nhật sơ cấp 1','JPS112','JPN1.1','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(66,'Japanese Language 1.2','Tiếng Nhật sơ cấp 2','JPS122','JPN1.2','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(67,'Japanese Language 1.3','Tiếng Nhật sơ cấp 3','JPS132','JPN1.3','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(68,'Japanese Language 1.4','Tiếng Nhật sơ cấp 4','JPS142','JPN1.4','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(69,'Japanese Language 1.5','Tiếng Nhật sơ cấp 5','JPS152','JPN1.5','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(70,'Japanese Language 2.1','Tiếng Nhật trung cấp 1','JPS212','JPN2.1','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(71,'Japanese Language 2.2','Tiếng Nhật trung cấp 2','JPS222','JPN2.2','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(72,'Basic Practicing (C Lab)','Thực hành cơ bản','LAB101','LAB1','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(73,'OOP with Java Lab','Thực hành OOP với Java','LAB211','LAB2','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(74,'Business Law Fundamentals','Pháp luật đại cương','LAW101','LF','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(75,'Advanced Mathematics 2','Toán cao cấp 2','MAA101','AM2','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(76,'Advanced Mathematics 1','Toán cao cấp 1','MAC101','AM1','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(77,'Advanced Mathematics For Business','Toán cao cấp 1 (BA)','MAC102','AMB','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(78,'Discrete Mathematics 1','Toán rời rạc 1','MAD111','DM1','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(79,'Discrete Mathematics 2','Toán rời rạc 2','MAD121','DM2','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(80,'Discrete Structure','Toán rời rạc','MAD101','DM','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(81,'Mathematics for Engineerin','Toán cho ngành kỹ thuật','MAE101','-','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(82,'Statistics and Data Processing','Thống kê và xử lý dữ liệu','MAS201','S&DP','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(83,'Probability and Statistics','Xác suất thống kê','MAS291','P&S','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(84,'Introduction to Management','Nhập môn quản lý','MGT101','I2M','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(85,'Marketing Principles','Nguyên lý Marketing','MKT101','MP','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(86,'Consumer Behavior','Hành vi người tiêu dùng','MKT201','CB','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(87,'Service Marketing Management','Quản trị marketing dịch vụ','MKT202','SMM','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(88,'Marketing Research','Nghiên cứu Marketing','MKT301','MR','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(89,'Integrated Marketing Communications','Tích hợp truyền thông tiếp thị','MKT304','IMC','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(90,'Marketing Stratery','Chiến lược Marketing','MKT305','MaS','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(91,'Principles of Marxism Leninism','Những nguyên lý cơ bản của Chủ nghĩa Mác-Lênin','MLN101','CNMLN','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(92,'Computer Networking','Mạng máy tính','NWC202','CNW','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(93,'Organizational Behavior','Hành vi tổ chức','OBE101','OB','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(94,'Operating System','Hệ điều hành','OSG202','OS','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(95,'Cloud Computing',' Điện toán đám mây','PRC391','CC','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(96,'Excel Programming','Lập trình Excel','PRE201','EP','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(97,'Programming Fundamentals Using C','Cơ sở lập trình C','PRF192','PFC','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(98,'Core Java',' Java căn bản ','PRJ101','CJ','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(99,'Advanced Java','Java nâng cao','PRJ201','AJ','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(100,'Web-based Java Applications','Phát triển ứng dụng Java web','PRJ321','-','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(101,'Desktop Java Applications','Phát triển ứng dụng Java desktop','PRJ311','-','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(102,'Mobile Programming','Lập trình di động','PRM391','MOP','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(103,'C# & Dot Net','C# & Dot Net','PRN292','CNET','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(104,'Learning to Program with Alice','Lập trình với Alice','PRO001','Alice','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(105,'Object Oriented Paradigm','Lập trình hướng đối tượng','PRO191','OOP','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(106,'Object-Oriented Programming','Lập trình hướng đối tượng (with Java)','PRO192','-','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(107,'Front-end Web Development','Lập trình web động','PRO201','-','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(108,'Advanced XML','XML nâng cao','PRX301','XML','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(109,'Business Research Methods','Phương pháp nghiên cứu','RMB301','RM','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(110,'Business Communication for BA','Giao tiếp thương mại','SSC101','COMB','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(111,'Business Communication','Giao tiếp thương mại','SSC102','COM','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(112,'Working in groups','Làm việc nhóm','SSG101','WIG','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(113,'Working in Group for BA','Làm việc nhóm','SSG102','WIGB','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(114,'Management Skills','Kỹ năng quản lý','SSM201','MS','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(115,'Negotiation','Kỹ năng đàm phán và giải quyết xung đột','SSN301','N&CSS','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(116,'Software Construction','Phần mềm xây dựng','SWC202','SWC','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(117,'Software Architecture & Design','Kiến trúc và thiết kế phần mềm','SWD391','SAD','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(118,'Introduction to Software Engineering','Nhập môn Kỹ thuật phần mềm','SWE102','I2SE','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(119,'Information Assurance Overview','Tổng quan về an toàn thông tin','IAO101','IAO','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(120,'Software Project Management','Quản trị dự án phần mềm','SWM301','SPM','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(121,'Capstone Project (For IS Specializations)','Hệ thống thông tin','SWP490','IS','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(122,'Capstone Project (For ES Specializations)','Phát triển phần mềm cho hệ thống nhúng','SWP490','ES','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(123,'Capstone Project (For JS Specialization)\nJapanese Bridge Software Engineer','Kỹ sư cầu nối Nhật','SWP493','JS','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(124,'Software Quality Assurance and Testing','Đảm bảo chất lượng & kiểm thử PM','SWQ391','SQA&T','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(125,'Software Requirement','Yêu cầu phần mềm','SWR301','SR','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(126,'Start your business ','Khởi Sự Doanh Nghiệp','SYB301','SYB','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(127,'Revolutionary Lines of CPV','Đường lối cách mạng của Đảng cộng sản Việt Nam','VNR201','DCSVN','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(128,'Vovinam 1','-','VOV112','VOV1','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(129,'Vovinam 2','-','VOV113','VOV2','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(130,'Vovinam 3','-','VOV122','VOV3','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(131,'Vovinam 4','-','VOV123','VOV4','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(132,'Vovinam 5','-','VOV132','VOV5','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(133,'Vovinam 6','-','VOV133','VOV6','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(134,'Lái xe ôtô','-','-','LXO','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(135,'On Training Job','Đào tạo trong công việc thực tế 1','OJS201','OJT','-','','2015-10-12 02:54:49','2015-10-12 02:54:49'),(136,'On Training Job SB','Đào tạo trong công việc thực tế 1','OJB211','OJB','-','','2015-10-12 11:25:45','2015-10-12 11:25:45');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_in_semester`
--

DROP TABLE IF EXISTS `subject_in_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_in_semester` (
  `SubInSemID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectID` int(11) NOT NULL,
  `SemesterID` int(11) NOT NULL,
  `NumberOfCredit` int(11) NOT NULL DEFAULT '3',
  `Half` int(11) NOT NULL DEFAULT '1',
  `StartDate` timestamp NULL DEFAULT NULL,
  `EndDate` timestamp NULL DEFAULT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SubInSemID`),
  KEY `fk_sub_sem_idx` (`SubjectID`),
  KEY `fk_sem_sub_idx` (`SemesterID`),
  CONSTRAINT `fk_sem_sub` FOREIGN KEY (`SemesterID`) REFERENCES `semester` (`SemesterID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sub_sem` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_in_semester`
--

LOCK TABLES `subject_in_semester` WRITE;
/*!40000 ALTER TABLE `subject_in_semester` DISABLE KEYS */;
INSERT INTO `subject_in_semester` VALUES (1,32,1,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 10:25:20','2015-10-12 10:25:20'),(2,32,18,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 10:37:21','2015-10-12 10:37:21'),(3,32,35,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 10:37:53','2015-10-12 10:37:53'),(4,32,52,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 10:39:13','2015-10-12 10:39:13'),(5,33,2,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 10:39:23','2015-10-12 10:39:23'),(6,34,3,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(7,35,4,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(8,36,5,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(9,36,6,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(10,9,7,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(11,81,7,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(12,11,7,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(13,97,7,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(14,112,7,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(15,107,8,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(16,106,8,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(17,17,8,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(18,80,8,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(19,72,8,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(20,61,9,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(21,94,9,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(22,10,9,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(23,101,9,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(24,73,9,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(25,10,10,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(26,103,10,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(27,17,10,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(28,63,10,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(29,92,10,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(30,10,11,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(31,103,11,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(32,17,11,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(33,63,11,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(34,92,11,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(35,135,12,3,1,'2015-09-06 17:00:00','2015-09-06 17:00:00','-','','2015-10-12 11:04:08','2015-10-12 11:04:08'),(36,1,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(37,18,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(38,37,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(39,52,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(40,54,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(41,68,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(42,91,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(43,111,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(44,117,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(45,126,13,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:12:14','2015-10-12 11:12:14'),(46,16,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(47,19,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(48,38,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(49,53,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(50,60,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(51,70,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(52,108,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(53,111,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(54,120,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(55,127,14,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:14:20','2015-10-12 11:14:20'),(56,58,15,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:16:24','2015-10-12 11:16:24'),(57,59,15,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:16:24','2015-10-12 11:16:24'),(58,71,15,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:16:24','2015-10-12 11:16:24'),(59,95,15,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:16:24','2015-10-12 11:16:24'),(60,102,15,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:16:24','2015-10-12 11:16:24'),(61,121,15,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:16:24','2015-10-12 11:16:24'),(62,122,15,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:16:24','2015-10-12 11:16:24'),(63,123,15,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:16:24','2015-10-12 11:16:24'),(64,33,19,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:18:10','2015-10-12 11:18:10'),(65,34,20,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:18:27','2015-10-12 11:18:27'),(66,35,21,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:18:42','2015-10-12 11:18:42'),(67,36,22,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:18:51','2015-10-12 11:18:51'),(68,36,23,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:19:00','2015-10-12 11:19:00'),(69,12,24,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:19:48','2015-10-12 11:19:48'),(70,20,24,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:19:48','2015-10-12 11:19:48'),(71,26,24,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:19:48','2015-10-12 11:19:48'),(72,84,24,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:19:48','2015-10-12 11:19:48'),(73,112,24,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:19:48','2015-10-12 11:19:48'),(74,1,25,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:20:32','2015-10-12 11:20:32'),(75,21,25,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:20:32','2015-10-12 11:20:32'),(76,27,25,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:20:32','2015-10-12 11:20:32'),(77,77,25,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:20:32','2015-10-12 11:20:32'),(78,93,25,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:20:32','2015-10-12 11:20:32'),(79,13,26,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:21:09','2015-10-12 11:21:09'),(80,29,26,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:21:09','2015-10-12 11:21:09'),(81,42,26,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:21:09','2015-10-12 11:21:09'),(82,43,26,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:21:09','2015-10-12 11:21:09'),(83,85,26,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:21:09','2015-10-12 11:21:09'),(84,14,27,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:22:32','2015-10-12 11:22:32'),(85,30,27,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:22:32','2015-10-12 11:22:32'),(86,82,27,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:22:32','2015-10-12 11:22:32'),(87,86,27,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:22:32','2015-10-12 11:22:32'),(88,96,27,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:22:32','2015-10-12 11:22:32'),(89,15,28,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:23:59','2015-10-12 11:23:59'),(90,31,28,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:23:59','2015-10-12 11:23:59'),(91,87,28,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:23:59','2015-10-12 11:23:59'),(92,88,28,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:23:59','2015-10-12 11:23:59'),(93,110,28,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:23:59','2015-10-12 11:23:59'),(94,136,29,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:26:19','2015-10-12 11:26:19'),(95,2,30,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:27:24','2015-10-12 11:27:24'),(96,39,30,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:27:24','2015-10-12 11:27:24'),(97,46,30,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:27:24','2015-10-12 11:27:24'),(98,74,30,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:27:24','2015-10-12 11:27:24'),(99,89,30,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:27:24','2015-10-12 11:27:24'),(100,91,30,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:27:24','2015-10-12 11:27:24'),(101,114,30,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:27:24','2015-10-12 11:27:24'),(102,6,31,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:00','2015-10-12 11:29:00'),(103,47,31,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:00','2015-10-12 11:29:00'),(104,53,31,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:00','2015-10-12 11:29:00'),(105,57,31,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:00','2015-10-12 11:29:00'),(106,90,31,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:00','2015-10-12 11:29:00'),(107,109,31,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:00','2015-10-12 11:29:00'),(108,115,31,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:00','2015-10-12 11:29:00'),(109,127,31,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:00','2015-10-12 11:29:00'),(110,8,32,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:38','2015-10-12 11:29:38'),(111,49,32,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:38','2015-10-12 11:29:38'),(112,50,32,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:38','2015-10-12 11:29:38'),(113,51,32,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:38','2015-10-12 11:29:38'),(114,55,32,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:29:38','2015-10-12 11:29:38'),(115,33,36,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:32:02','2015-10-12 11:32:02'),(116,34,37,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:32:24','2015-10-12 11:32:24'),(117,35,38,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:32:32','2015-10-12 11:32:32'),(118,36,39,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:33:38','2015-10-12 11:33:38'),(119,36,40,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:33:47','2015-10-12 11:33:47'),(120,9,41,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:34:49','2015-10-12 11:34:49'),(121,11,41,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:34:49','2015-10-12 11:34:49'),(122,81,41,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:34:49','2015-10-12 11:34:49'),(123,97,41,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:34:49','2015-10-12 11:34:49'),(124,112,41,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:34:49','2015-10-12 11:34:49'),(125,17,42,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:15','2015-10-12 11:36:15'),(126,72,42,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:15','2015-10-12 11:36:15'),(127,80,42,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:15','2015-10-12 11:36:15'),(128,106,42,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:15','2015-10-12 11:36:15'),(129,107,42,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:15','2015-10-12 11:36:15'),(130,10,37,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:58','2015-10-12 11:36:58'),(131,73,37,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:58','2015-10-12 11:36:58'),(132,94,37,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:58','2015-10-12 11:36:58'),(133,101,37,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:58','2015-10-12 11:36:58'),(134,119,37,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-12 11:36:58','2015-10-12 11:36:58'),(135,58,16,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-13 05:37:31','2015-10-13 05:37:31'),(136,59,16,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-13 05:37:31','2015-10-13 05:37:31'),(137,71,16,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-13 05:37:31','2015-10-13 05:37:31'),(138,95,16,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-13 05:37:31','2015-10-13 05:37:31'),(139,102,16,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-13 05:37:31','2015-10-13 05:37:31'),(140,121,16,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-13 05:37:31','2015-10-13 05:37:31'),(141,122,16,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-13 05:37:31','2015-10-13 05:37:31'),(142,123,16,3,1,'2015-09-06 17:00:00','2015-12-06 17:00:00','-','','2015-10-13 05:37:31','2015-10-13 05:37:31');
/*!40000 ALTER TABLE `subject_in_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtract_tuition`
--

DROP TABLE IF EXISTS `subtract_tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subtract_tuition` (
  `SubtractTuitionID` int(11) NOT NULL AUTO_INCREMENT,
  `SubtractTuitionName` varchar(45) NOT NULL DEFAULT '-',
  `SubtractTuition` int(11) NOT NULL DEFAULT '0',
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SubtractTuitionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtract_tuition`
--

LOCK TABLES `subtract_tuition` WRITE;
/*!40000 ALTER TABLE `subtract_tuition` DISABLE KEYS */;
/*!40000 ALTER TABLE `subtract_tuition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `Key` varchar(40) NOT NULL,
  `Value` varchar(125) NOT NULL,
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term` (
  `TermID` int(11) NOT NULL AUTO_INCREMENT,
  `TermName` varchar(45) NOT NULL,
  `StartDate` timestamp NULL DEFAULT NULL,
  `EndDate` timestamp NULL DEFAULT NULL,
  `Note` text,
  `IsActive` varchar(45) NOT NULL DEFAULT '1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsCurrent` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`TermID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (1,'FALL 2015','2015-09-06 17:00:00','2015-12-06 17:00:00','-','1','2015-10-12 01:14:57','2015-10-12 01:14:57','');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuition_payment`
--

DROP TABLE IF EXISTS `tuition_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuition_payment` (
  `TuitionPaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `SemesterID` int(11) NOT NULL,
  `TotalTuition` int(11) NOT NULL DEFAULT '0',
  `SubtractTuitionID` int(11) DEFAULT NULL COMMENT 'Cac khoan khau tru',
  `PaidTuition` int(11) NOT NULL DEFAULT '0',
  `Bank` varchar(100) NOT NULL DEFAULT '-',
  `TransferDate` timestamp NULL DEFAULT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'0',
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TuitionPaymentID`),
  KEY `fk_subtract_amount_idx` (`SubtractTuitionID`),
  KEY `fk_payment_student_idx` (`StudentID`),
  KEY `fk_payment_semester_idx` (`SemesterID`),
  CONSTRAINT `fk_payment_semester` FOREIGN KEY (`SemesterID`) REFERENCES `semester` (`SemesterID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subtract_amount` FOREIGN KEY (`SubtractTuitionID`) REFERENCES `subtract_tuition` (`SubtractTuitionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition_payment`
--

INSERT INTO `sfm`.`major` (`MajorCode`, `MajorName`, `Note`, `IsActive`) VALUES ('N/A', 'UPDATING', '-', 1);
INSERT INTO `sfm`.`major` (`MajorCode`, `MajorName`, `Note`, `IsActive`) VALUES ('BA', 'B .... A.....', '-', 1);
INSERT INTO `sfm`.`major` (`MajorCode`, `MajorName`, `Note`, `IsActive`) VALUES ('FB', 'F .... B ,,,,', '-', 1);




LOCK TABLES `tuition_payment` WRITE;
/*!40000 ALTER TABLE `tuition_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuition_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuition_plan`
--

DROP TABLE IF EXISTS `tuition_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuition_plan` (
  `TuitionPlanID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `TermID` int(11) NOT NULL,
  `TuitionName` varchar(64) NOT NULL DEFAULT '-',
  `Tuition` int(11) NOT NULL DEFAULT '0',
  `TuitionType` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`TuitionPlanID`),
  KEY `fk_plan_student_idx` (`StudentID`),
  KEY `fk_plan_term_idx` (`TermID`),
  CONSTRAINT `fk_plan_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_term` FOREIGN KEY (`TermID`) REFERENCES `term` (`TermID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition_plan`
--

LOCK TABLES `tuition_plan` WRITE;
/*!40000 ALTER TABLE `tuition_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuition_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `UserRoleID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserRoleID`),
  KEY `fk__User_has_Role_Role1_idx` (`RoleID`),
  KEY `fk__User_has_Role__User1_idx` (`UserID`),
  CONSTRAINT `fk__User_has_Role_Role1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__User_has_Role__User1` FOREIGN KEY (`UserID`) REFERENCES `_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,'-','','2015-10-11 19:07:43','2015-10-11 19:07:43'),(2,2,2,'-','','2015-10-11 19:07:43','2015-10-11 19:07:43'),(3,3,3,'-','','2015-10-11 19:07:43','2015-10-11 19:07:43'),(4,4,4,'-','','2015-10-11 19:07:43','2015-10-11 19:07:43');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-14  8:12:50
