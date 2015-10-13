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
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user`
--

LOCK TABLES `_user` WRITE;
/*!40000 ALTER TABLE `_user` DISABLE KEYS */;
INSERT INTO `_user` VALUES (1,'admin','123456','-',''),(2,'manager','123456','-',''),(3,'staff','123456','-',''),(4,'student','123456','-',''),(5,'trunghd','123456','-',''),(6,'khoadeptrai','123456','-',''),(7,'anhletuan','123456','-',''),(8,'phuctq','123456','-','');
/*!40000 ALTER TABLE `_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compulsory_subject`
--

DROP TABLE IF EXISTS `compulsory_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compulsory_subject` (
  `compulsorySubjectID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL,
  PRIMARY KEY (`compulsorySubjectID`,`subjectID`),
  KEY `fk_subject_2_idx` (`compulsorySubjectID`),
  KEY `fk_subject_1` (`subjectID`),
  CONSTRAINT `fk_subject_1` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_2` FOREIGN KEY (`compulsorySubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compulsory_subject`
--

LOCK TABLES `compulsory_subject` WRITE;
/*!40000 ALTER TABLE `compulsory_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `compulsory_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectID` int(11) NOT NULL,
  `Clazz` varchar(30) NOT NULL DEFAULT '-',
  `Half` int(11) NOT NULL DEFAULT '1',
  `StartDate` timestamp NULL DEFAULT NULL,
  `EndDate` timestamp NULL DEFAULT NULL,
  `CourseStatus` varchar(30) NOT NULL DEFAULT '-' COMMENT 'Bắt đầu, đang học, đã đóng',
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`CourseID`),
  KEY `fk_course_subject_idx` (`SubjectID`),
  CONSTRAINT `fk_course_subject` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,35,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(2,36,'SE0861',1,'2014-05-13 17:00:00','2014-06-14 17:00:00','ĐÃ ĐÓNG','-',''),(3,11,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(4,104,'SE0861',2,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(5,22,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(6,105,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(7,97,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(8,23,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(9,98,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(10,118,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(11,73,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(12,103,'SE0861',1,'2014-01-13 17:00:00','2014-02-14 17:00:00','ĐÃ ĐÓNG','-',''),(13,92,'SE0861',1,'2015-07-13 17:00:00','2014-08-14 17:00:00','ĐÃ ĐÓNG','-',''),(14,17,'SE0861',1,'2015-10-14 17:00:00','2015-11-14 17:00:00','ĐÃ ĐÓNG','-','');
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
  `IsActive` bit(1) NOT NULL,
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
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_loans_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_student`
--

LOCK TABLES `credit_student` WRITE;
/*!40000 ALTER TABLE `credit_student` DISABLE KEYS */;
INSERT INTO `credit_student` VALUES (5,50);
/*!40000 ALTER TABLE `credit_student` ENABLE KEYS */;
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
  PRIMARY KEY (`MajorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'SE','Software Engineering','-',''),(2,'SB','School For Bussiness','-','');
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
-- Table structure for table `resit_course_payment`
--

DROP TABLE IF EXISTS `resit_course_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resit_course_payment` (
  `ResitCoursePaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentCourseID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `TotalTuition` int(11) NOT NULL DEFAULT '0',
  `PaidAmount` int(11) NOT NULL DEFAULT '0',
  `Status` bit(1) NOT NULL DEFAULT b'0',
  `TransferDate` timestamp NULL DEFAULT NULL,
  `Note` text,
  `Attempt` int(11) NOT NULL DEFAULT '1',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ResitCoursePaymentID`),
  KEY `fk_resit_course_idx` (`StudentCourseID`),
  KEY `fk_student_resit_payment_idx` (`StudentID`),
  CONSTRAINT `fk_resit_course` FOREIGN KEY (`StudentCourseID`) REFERENCES `student_course` (`StudentCourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_resit_payment` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resit_course_payment`
--

LOCK TABLES `resit_course_payment` WRITE;
/*!40000 ALTER TABLE `resit_course_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resit_course_payment` ENABLE KEYS */;
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
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'MANAGER'),(3,'STAFF'),(4,'STUDENT'),(5,'STUDENT_SERVICE_STAFF'),(6,'FINANCE_STAFF'),(7,'EDUCATION_STAFF'),(8,'SCHOLARSHIP_STUDENT'),(9,'INVESTING_STUDENT'),(10,'LOANSCREDIT_STUDENT');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scholarship_student`
--

DROP TABLE IF EXISTS `scholarship_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scholarship_student` (
  `StudentID` int(11) NOT NULL,
  `ScholarshipRate` int(11) NOT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_schoolarship_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scholarship_student`
--

LOCK TABLES `scholarship_student` WRITE;
/*!40000 ALTER TABLE `scholarship_student` DISABLE KEYS */;
INSERT INTO `scholarship_student` VALUES (4,70);
/*!40000 ALTER TABLE `scholarship_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `SeasonID` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonName` varchar(45) NOT NULL,
  `StartDate` timestamp NULL DEFAULT NULL,
  `EndDate` timestamp NULL DEFAULT NULL,
  `Note` text,
  `IsActive` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SeasonID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,'Spring 2014','2014-01-09 17:00:00','2014-04-09 17:00:00','-','1'),(2,'Summer 2014','2014-05-09 17:00:00','2014-09-09 17:00:00','-','1'),(3,'Fall 2014','2014-10-09 17:00:00','2014-12-09 17:00:00','-','1'),(4,'Spring 2015','2015-01-09 17:00:00','2015-04-09 17:00:00','-','1'),(5,'Summer 2015','2015-05-09 17:00:00','2015-09-09 17:00:00','-','1'),(6,'Fall 2015','2015-10-09 17:00:00','2015-12-09 17:00:00','-','1');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `SemesterID` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonID` int(11) NOT NULL,
  `StudyLevelID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  PRIMARY KEY (`SemesterID`),
  KEY `fk_semester_level_idx` (`StudyLevelID`),
  KEY `fk_semester_season` (`SeasonID`),
  KEY `fk_semester_student_idx` (`StudentID`),
  CONSTRAINT `fk_semester_level` FOREIGN KEY (`StudyLevelID`) REFERENCES `study_level` (`StudyLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_season` FOREIGN KEY (`SeasonID`) REFERENCES `season` (`SeasonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,1,5,4),(2,2,6,4),(3,3,7,4),(4,4,8,4),(5,5,9,4),(6,6,10,4),(7,1,4,5),(8,2,5,5),(9,3,6,5),(10,4,7,5),(11,5,8,5),(12,6,9,5);
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
  `FinancialType` varchar(15) NOT NULL DEFAULT '-' COMMENT 'HB, TD, ĐT, BT',
  `FinancialRate` int(11) NOT NULL DEFAULT '0',
  `MajorID` int(11) NOT NULL COMMENT 'Chuyên Ngành : SE, SB, IA',
  `IsGraduated` bit(1) NOT NULL DEFAULT b'0',
  `StudyStatus` varchar(30) NOT NULL DEFAULT '-' COMMENT 'Đang Học, Bảo Lưu',
  `SubMajor` varchar(45) NOT NULL DEFAULT '-',
  `Term` varchar(10) NOT NULL DEFAULT '-' COMMENT 'K7, K8, K9',
  `NarrowSpecialization` varchar(20) NOT NULL DEFAULT '-' COMMENT 'Chuyên Nghành hẹp :\n-Normal\n-IS\n-JS\n- ES',
  `ParentPhone` varchar(15) DEFAULT '-',
  `ParentEmail` varchar(255) DEFAULT '-',
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `StudentCode_UNIQUE` (`StudentCode`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`),
  KEY `fk_student_major_idx` (`MajorID`),
  CONSTRAINT `fk_student_major` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_user` FOREIGN KEY (`StudentID`) REFERENCES `_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (4,'Trần Khắc Vỹ','SE60964','','1993-06-06 02:00:00','VyTKSE60964@fpt.edu.vn','241488591','01672011550','123 Lê Lợi','HB',70,1,'\0','ĐANG HỌC','KTPM','KHÓA 7','IS','0123456789','PHUHUYNH@GMAIL.COM'),(5,'Hồ Đoàn Trung','SE60882','','1993-10-27 02:00:00','trunghdse60882@fpt.edu.vn','341613279','0913925529','123 Lê Lợi','TD',50,1,'\0','ĐANG HỌC','KTPM','KHÓA 7','IS','0123456789','PHUHUYNH@GMAIL.COM'),(6,'Vũ Nhật Anh Khoa','SE12335','','1993-11-10 02:00:00','khoavnase12335@fpt.edu.vn','253265895','0913925529','123 Lê Lai','BT',0,1,'\0','ĐANG HỌC','KTPM','KHÓA 7','IS','0123456789','PHUHUYNH@GMAIL.COM'),(7,'Lê Tuấn Anh','SE78787','','1992-10-09 02:00:00','anhltse78787@fpt.edu.vn','456456456','0913925529','123 Lê Lê','BT',0,1,'\0','ĐANG HỌC','KTPM','KHÓA 7','IS','9876543210','PHUHUYNH@GMAIL.COM'),(8,'Trần Quang Phúc','SE08080','','1999-09-09 02:00:00','phuctqse08080@fpt.edu.vn','123456789','0913925529','123 Lê Lê','BT',0,1,'\0','ĐANG HỌC','KTPM','KHÓA 7','IS','9876543210','PHUHUYNH@GMAIL.COM');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course` (
  `StudentCourseID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `SemesterID` int(11) NOT NULL,
  `Mark` float NOT NULL DEFAULT '0',
  `IsPass` bit(1) NOT NULL DEFAULT b'0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `Note` text,
  `IsResit` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`StudentCourseID`),
  KEY `fk_student_course_idx` (`StudentID`),
  KEY `fk_student_course2_idx` (`CourseID`),
  KEY `fk_student_course_3_idx` (`SemesterID`),
  CONSTRAINT `fk_student_course` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_course2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_course3` FOREIGN KEY (`SemesterID`) REFERENCES `semester` (`SemesterID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES (1,4,1,1,7.8,'','','-','\0'),(2,4,2,2,5.3,'','','-','\0'),(3,4,3,3,4.3,'\0','','-','\0'),(4,4,4,3,5.6,'','','-','\0'),(5,4,5,3,6.8,'','','-','\0'),(6,4,6,4,2.4,'\0','','-','\0'),(7,4,7,4,5.6,'','','-','\0'),(8,4,8,4,4.7,'\0','','-','\0'),(9,4,9,5,9.8,'','','-','\0'),(10,4,10,5,7.8,'','','-','\0'),(11,4,11,5,8.9,'','','-','\0'),(12,4,12,6,3.4,'\0','','-','\0'),(13,4,13,6,7.8,'','','-','\0'),(14,4,14,6,5.6,'','','-','\0');
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_level`
--

DROP TABLE IF EXISTS `study_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_level` (
  `StudyLevelID` int(11) NOT NULL AUTO_INCREMENT,
  `LevelCode` varchar(15) NOT NULL,
  `LevelName` varchar(45) NOT NULL,
  `TuitionVND` int(11) NOT NULL,
  `TuitionUSD` int(11) NOT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`StudyLevelID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_level`
--

LOCK TABLES `study_level` WRITE;
/*!40000 ALTER TABLE `study_level` DISABLE KEYS */;
INSERT INTO `study_level` VALUES (1,'ENG1','Tiếng Anh dự bị 1',9900000,450,'Theo mức học thực tế',''),(2,'ENG2','Tiếng Anh dự bị 2',9900000,450,'Theo mức học thực tế',''),(3,'ENG3','Tiếng Anh dự bị 3',9900000,450,'Theo mức học thực tế',''),(4,'ENG4','Tiếng Anh dự bị 4',9900000,450,'Theo mức học thực tế',''),(5,'ENG5','Tiếng Anh dự bị 5',9900000,450,'Theo mức học thực tế',''),(6,'ENG6','Tiếng Anh dự bị 6',9900000,450,'Theo mức học thực tế',''),(7,'SEM1','Chuyên ngành 1',24200000,1100,'Bắt buộc',''),(8,'SEM2','Chuyên ngành 2',24200000,1100,'Bắt buộc',''),(9,'SEM3','Chuyên ngành 3',24200000,1100,'Bắt buộc',''),(10,'SEM4','Chuyên ngành 4',24200000,1100,'Bắt buộc',''),(11,'SEM5','Chuyên ngành 5',24200000,1100,'Bắt buộc',''),(12,'SEM6','Chuyên ngành 6',24200000,1100,'Bắt buộc',''),(13,'SEM7','Chuyên ngành 7',24200000,1100,'Bắt buộc',''),(14,'SEM8','Chuyên ngành 8',24200000,1100,'Bắt buộc',''),(15,'SEM9','Chuyên ngành 9',24200000,1100,'Bắt buộc','');
/*!40000 ALTER TABLE `study_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryID` int(11) NOT NULL,
  `SubjectNameE` varchar(80) DEFAULT '-',
  `SubjectNameV` varchar(80) DEFAULT '-',
  `SubjectCode` varchar(15) DEFAULT '-',
  `Abbreviation` varchar(15) DEFAULT '-',
  `NumOfCredit` int(11) DEFAULT '3',
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`SubjectID`),
  KEY `fk_subject_category_idx` (`CategoryID`),
  CONSTRAINT `fk_subject_category` FOREIGN KEY (`CategoryID`) REFERENCES `subject_category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,1,'Principles of Accounting','Nguyên lý kế toán','ACC101','POA',3,NULL,''),(2,1,'Managerial Accounting','Kế toán quản lý','ACC302','MA',3,NULL,''),(3,1,'Financial Statement Analysis','Phân tích báo cáo tài chính','ACC305','FSA',3,NULL,''),(4,1,'Principle Of Banking','Các nguyên tắc cơ bản về ngân hàng','BKG201','POB',3,NULL,''),(5,1,'Bank Management','Quản trị ngân hàng','BKG301','BM',3,NULL,''),(6,1,'Investment Project Appraisal','Thẩm định dự án đầu tư','BKG302','IPA',3,NULL,''),(7,1,'Bank Lending','Tín dụng ngân hàng','BKG304','BL',3,NULL,''),(8,1,'Business Ethics','Đạo đức kinh doanh','BUE201','EIB',3,NULL,''),(9,1,'Computer Organization and Architecture','Tổ chức và Kiến trúc máy tính','CEA201','',3,NULL,''),(10,1,'Data Structure and Algorithm','Cấu trúc dữ liệu và giải thuật','CSD201','DSA',3,NULL,''),(11,1,'Introduction to Computing','Nhập môn tính toán','CSI101','I2C',3,NULL,''),(12,1,'Introduction to Informatics','Tin học đại cương','CSI102','I2I',3,NULL,''),(13,1,'Chinese Elementary 1','Tiếng Trung sơ cấp 1','CHN111','CHN1',3,NULL,''),(14,1,'Chinese Elementary 2','Tiếng Trung sơ cấp 2','CHN122','CHN2',3,NULL,''),(15,1,'Chinese Elementary 3','Tiếng Trung sơ cấp 3','CHN132','CHN3',3,NULL,''),(16,1,'Database Advanced','Cơ sở dữ liệu nâng cao','DBD301','AD',3,NULL,''),(17,1,'Database Systems','Các hệ cơ sở dữ liệu','DBI202','',3,NULL,''),(18,1,'Digital Fundamentals','Cơ sở số hóa','DGT201','DF',3,NULL,''),(19,1,'Digital Signal Processing','Xử lý tín hiệu số','DGT301','DSP',3,NULL,''),(20,1,'Basic Microeconomics','Kinh tế vi mô','ECO111','BMiE',3,NULL,''),(21,1,'Basic Macroeconomics','Kinh tế vĩ mô','ECO121','BMaE',3,NULL,''),(22,1,'Business English 1','Tiếng Anh doanh nghiệp 1','ENI101','E-BE1',3,NULL,''),(23,1,'Business English 2','Tiếng Anh doanh nghiệp 2','ENI201','E-BE2',3,NULL,''),(24,1,'Business English 3','Tiếng Anh doanh nghiệp 3','ENI301','E-BE3',3,NULL,''),(25,1,'Business English 4','Tiếng Anh doanh nghiệp 4','ENI401','E-BE4',3,NULL,''),(26,1,'Academic English 1','Tiếng Anh học thuật 1','ENL111','A-ENG1',3,NULL,''),(27,1,'Academic English 2','Tiếng Anh học thuật 2','ENL112','A-ENG2',3,NULL,''),(28,1,'Elementary Business English','Tiếng Anh thương mại Elementary','ENM101','MKL1',3,NULL,''),(29,1,'Pre-Intermediate Business English','Tiếng Anh thương mại Pre-Intermediate','ENM201','MKL2',3,NULL,''),(30,1,'Intermediate Business English','Tiếng Anh thương mại Intermediate','ENM301','MKL3',3,NULL,''),(31,1,'Upper Intermediate','Tiếng Anh thương mại Upper','ENM401','MKL4',3,NULL,''),(32,1,'Top Notch 1','Tiếng Anh 2','ENT101','ENG2',3,NULL,''),(33,1,'Top Notch 2','Tiếng Anh 3','ENT201','ENG3',3,NULL,''),(34,1,'Top Notch 3','Tiếng Anh 4','ENT301','ENG4',3,NULL,''),(35,1,'Summit 1','Tiếng Anh 5','ENT401','ENG5',3,NULL,''),(36,1,'Summit 2','Tiếng Anh 6','ENT501','ENG6',3,NULL,''),(37,1,'Embedded System Hardware','Phần cứng hệ thống nhúng','ESH201','ESH',3,NULL,''),(38,1,'Embedded Software Development','Phát triển phần mềm nhúng','ESS301','ESS',3,NULL,''),(39,1,'Entrepreneurship','Khởi Sự Doanh Nghiệp','ETR401','SBE',3,NULL,''),(40,1,'Software Entrepreneurship','Khởi nghiệp phần mềm','ETR402','SWE',3,NULL,''),(41,1,'Valuation and Financial Modeling','Các mô hình tài chính','FIM301','V&FM',3,NULL,''),(42,1,'Monetary Economics and Global Economy','Kinh tế tiền tệ và Kinh tế toàn cầu','FIN201','M&GE',3,NULL,''),(43,1,'Principles Of Corporate Finance','Tài chính doanh nghiệp','FIN202','CF',3,NULL,''),(44,1,'Financial Market And Institutions','Thị trường & các định chế tài chính','FIN301','FM&I',3,NULL,''),(45,1,'Advanced Corporate Finance','Tài chính doanh nghiệp nâng cao','FIN303','ACF',3,NULL,''),(46,1,'Derivatives','Công cụ phái sinh','FIN402','DER',3,NULL,''),(47,1,'Applied Graphic Design','Ứng dụng thiết kế đồ họa','GDP101','AGD',3,NULL,''),(48,1,'Graduation Thesis (For Marketing concentration)','Marketing','GRA491','MKT',3,NULL,''),(49,1,'Graduation Thesis (For Finance Concentration \nof BBA and BFB)','Tài chính','GRA492','FIN',3,NULL,''),(50,1,'Graduation Thesis (For Banking Concentration )','Tài chính Doanh nghiệp','GRA494','COF',3,NULL,''),(51,1,'Graduation Thesis (For Marketing & Sales concentration)','Ngân hàng thương mại','GRA495','COB',3,NULL,''),(52,1,'Human Computer Interaction','Tương tác người máy','HCI201','HCI',3,NULL,''),(53,1,'Ho Chi Minh Ideology','Tư tưởng Hồ Chí Minh','HCM201','TTHCM',3,NULL,''),(54,1,'E-Commerce','Thương mại điện tử','ISC301','ECOM',3,NULL,''),(55,1,'E-Commerce for Business','Thương mại điện tử','ISC302','ECOMB',3,NULL,''),(56,1,'IT Applications In Enterprise','Ứng dụng CNTT trong doanh nghiệp','ITA201','ITAE',3,NULL,''),(57,1,'Management Information System','Hệ thống thông tin quản lý','ITA202','MIS',3,NULL,''),(58,1,'Ethics in Information Technology','Đạo đức nghề nghiệp','ITE302','EIT',3,NULL,''),(59,1,'Japanese Fundamental Information Technology Skill Standards','Tiếng Nhật CNTT','JFE301','JITF',3,NULL,''),(60,1,'IT JAPANESE','Tiếng Nhật CNTT','JIT301','JIT',3,NULL,''),(61,1,'Japanese Language 1.1 - Dekiru','Tiếng Nhật sơ cấp 1','JPD111','JPD1',3,NULL,''),(62,1,'Japanese Language 1.2 - Dekiru','Tiếng Nhật sơ cấp 2','JPD121','JPD2',3,NULL,''),(63,1,'Japanese Language 1.3 - Dekiru','Tiếng Nhật sơ cấp 3','JPD131','JPD3',3,NULL,''),(64,1,'Japanese Language 1.4 - Dekiru','Tiếng Nhật sơ cấp 4','JPD141','JPD4',3,NULL,''),(65,1,'Japanese Language 1.1','Tiếng Nhật sơ cấp 1','JPS112','JPN1.1',3,NULL,''),(66,1,'Japanese Language 1.2','Tiếng Nhật sơ cấp 2','JPS122','JPN1.2',3,NULL,''),(67,1,'Japanese Language 1.3','Tiếng Nhật sơ cấp 3','JPS132','JPN1.3',3,NULL,''),(68,1,'Japanese Language 1.4','Tiếng Nhật sơ cấp 4','JPS142','JPN1.4',3,NULL,''),(69,1,'Japanese Language 1.5','Tiếng Nhật sơ cấp 5','JPS152','JPN1.5',3,NULL,''),(70,1,'Japanese Language 2.1','Tiếng Nhật trung cấp 1','JPS212','JPN2.1',3,NULL,''),(71,1,'Japanese Language 2.2','Tiếng Nhật trung cấp 2','JPS222','JPN2.2',3,NULL,''),(72,1,'Basic Practicing (C Lab)','Thực hành cơ bản','LAB101','LAB1',3,NULL,''),(73,1,'OOP with Java Lab','Thực hành OOP với Java','LAB211','LAB2',3,NULL,''),(74,1,'Business Law Fundamentals','Pháp luật đại cương','LAW101','LF',3,NULL,''),(75,1,'Advanced Mathematics 2','Toán cao cấp 2','MAA101','AM2',3,NULL,''),(76,1,'Advanced Mathematics 1','Toán cao cấp 1','MAC101','AM1',3,NULL,''),(77,1,'Advanced Mathematics For Business','Toán cao cấp 1 (BA)','MAC102','AMB',3,NULL,''),(78,1,'Discrete Mathematics 1','Toán rời rạc 1','MAD111','DM1',3,NULL,''),(79,1,'Discrete Mathematics 2','Toán rời rạc 2','MAD121','DM2',3,NULL,''),(80,1,'Discrete Structure','Toán rời rạc','MAD101','DM',3,NULL,''),(81,1,'Mathematics for Engineerin','Toán cho ngành kỹ thuật','MAE101','',3,NULL,''),(82,1,'Statistics and Data Processing','Thống kê và xử lý dữ liệu','MAS201','S&DP',3,NULL,''),(83,1,'Probability and Statistics','Xác suất thống kê','MAS291','P&S',3,NULL,''),(84,1,'Introduction to Management','Nhập môn quản lý','MGT101','I2M',3,NULL,''),(85,1,'Marketing Principles','Nguyên lý Marketing','MKT101','MP',3,NULL,''),(86,1,'Consumer Behavior','Hành vi người tiêu dùng','MKT201','CB',3,NULL,''),(87,1,'Service Marketing Management','Quản trị marketing dịch vụ','MKT202','SMM',3,NULL,''),(88,1,'Marketing Research','Nghiên cứu Marketing','MKT301','MR',3,NULL,''),(89,1,'Integrated Marketing Communications','Tích hợp truyền thông tiếp thị','MKT304','IMC',3,NULL,''),(90,1,'Marketing Stratery','Chiến lược Marketing','MKT305','MaS',3,NULL,''),(91,1,'Principles of Marxism Leninism','Những nguyên lý cơ bản của Chủ nghĩa Mác-Lênin','MLN101','CNMLN',3,NULL,''),(92,1,'Computer Networking','Mạng máy tính','NWC202','CNW',3,NULL,''),(93,1,'Organizational Behavior','Hành vi tổ chức','OBE101','OB',3,NULL,''),(94,1,'Operating System','Hệ điều hành','OSG202','OS',3,NULL,''),(95,1,'Cloud Computing','Điện toán đám mây','PRC391','CC',3,NULL,''),(96,1,'Excel Programming','Lập trình Excel','PRE201','EP',3,NULL,''),(97,1,'Programming Fundamentals Using C','Cơ sở lập trình C','PRF192','PFC',3,NULL,''),(98,1,'Core Java','Java căn bản','PRJ101','CJ',3,NULL,''),(99,1,'Advanced Java','Java nâng cao','PRJ201','AJ',3,NULL,''),(100,1,'Web-based Java Applications','Phát triển ứng dụng Java web','PRJ321','',3,NULL,''),(101,1,'Desktop Java Applications','Phát triển ứng dụng Java desktop','PRJ311','',3,NULL,''),(102,1,'Mobile Programming','Lập trình di động','PRM391','MOP',3,NULL,''),(103,1,'C# & Dot Net','C# & Dot Net','PRN292','CNET',3,NULL,''),(104,1,'Learning to Program with Alice','Lập trình với Alice','PRO001','Alice',3,NULL,''),(105,1,'Object Oriented Paradigm','Lập trình hướng đối tượng','PRO191','OOP',3,NULL,''),(106,1,'Object-Oriented Programming','Lập trình hướng đối tượng (with Java)','PRO192','',3,NULL,''),(107,1,'Front-end Web Development','Lập trình web động','PRO201','',3,NULL,''),(108,1,'Advanced XML','XML nâng cao','PRX301','XML',3,NULL,''),(109,1,'Business Research Methods','Phương pháp nghiên cứu','RMB301','RM',3,NULL,''),(110,1,'Business Communication for BA','Giao tiếp thương mại','SSC101','COMB',3,NULL,''),(111,1,'Business Communication','Giao tiếp thương mại','SSC102','COM',3,NULL,''),(112,1,'Working in groups','Làm việc nhóm','SSG101','WIG',3,NULL,''),(113,1,'Working in Group for BA','Làm việc nhóm','SSG102','WIGB',3,NULL,''),(114,1,'Management Skills','Kỹ năng quản lý','SSM201','MS',3,NULL,''),(115,1,'Negotiation','Kỹ năng đàm phán và giải quyết xung đột','SSN301','N&CSS',3,NULL,''),(116,1,'Software Construction','Phần mềm xây dựng','SWC202','SWC',3,NULL,''),(117,1,'Software Architecture & Design','Kiến trúc và thiết kế phần mềm','SWD391','SAD',3,NULL,''),(118,1,'Introduction to Software Engineering','Nhập môn Kỹ thuật phần mềm','SWE102','I2SE',3,NULL,''),(119,1,'Information Assurance Overview','Tổng quan về an toàn thông tin','IAO101','IAO',3,NULL,''),(120,1,'Software Project Management','Quản trị dự án phần mềm','SWM301','SPM',3,NULL,''),(121,1,'Capstone Project (For IS Specializations)','Hệ thống thông tin','SWP490','IS',3,NULL,''),(122,1,'Capstone Project (For ES Specializations)','Phát triển phần mềm cho hệ thống nhúng','SWP490','ES',3,NULL,''),(123,1,'Capstone Project (For JS Specialization)\nJapanese Bridge Software Engineer','Kỹ sư cầu nối Nhật','SWP493','JS',3,NULL,''),(124,1,'Software Quality Assurance and Testing','Đảm bảo chất lượng & kiểm thử PM','SWQ391','SQA&T',3,NULL,''),(125,1,'Software Requirement','Yêu cầu phần mềm','SWR301','SR',3,NULL,''),(126,1,'Start your business','Khởi Sự Doanh Nghiệp','SYB301','SYB',3,NULL,''),(127,1,'Revolutionary Lines of CPV','Đường lối cách mạng của Đảng cộng sản Việt Nam','VNR201','DCSVN',3,NULL,''),(128,1,'Vovinam 1','','VOV112','VOV1',3,NULL,''),(129,1,'Vovinam 2','','VOV113','VOV2',3,NULL,''),(130,1,'Vovinam 3','','VOV122','VOV3',3,NULL,''),(131,1,'Vovinam 4','','VOV123','VOV4',3,NULL,''),(132,1,'Vovinam 5','','VOV132','VOV5',3,NULL,''),(133,1,'Vovinam 6','','VOV133','VOV6',3,NULL,''),(134,1,'Lái xe ôtô','','','LXO',3,NULL,''),(135,1,'','','','',3,NULL,'');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_category`
--

DROP TABLE IF EXISTS `subject_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryNameE` varchar(45) DEFAULT '-',
  `CategoryNameV` varchar(45) DEFAULT '-',
  `Note` text,
  `IsActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_category`
--

LOCK TABLES `subject_category` WRITE;
/*!40000 ALTER TABLE `subject_category` DISABLE KEYS */;
INSERT INTO `subject_category` VALUES (1,'CATEGORY','CATEGORY','-','');
/*!40000 ALTER TABLE `subject_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_in_level`
--

DROP TABLE IF EXISTS `subject_in_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_in_level` (
  `SubInLvID` int(11) NOT NULL AUTO_INCREMENT,
  `StudyLevelID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `MajorID` int(11) NOT NULL,
  PRIMARY KEY (`SubInLvID`),
  KEY `fk_level_sub_1_idx` (`StudyLevelID`),
  KEY `fk_level_sub_2_idx` (`SubjectID`),
  KEY `fk_level_sub_3_idx` (`MajorID`),
  CONSTRAINT `fk_level_sub_1` FOREIGN KEY (`StudyLevelID`) REFERENCES `study_level` (`StudyLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_level_sub_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_level_sub_3` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_in_level`
--

LOCK TABLES `subject_in_level` WRITE;
/*!40000 ALTER TABLE `subject_in_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_in_level` ENABLE KEYS */;
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
  PRIMARY KEY (`SubtractTuitionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtract_tuition`
--

LOCK TABLES `subtract_tuition` WRITE;
/*!40000 ALTER TABLE `subtract_tuition` DISABLE KEYS */;
INSERT INTO `subtract_tuition` VALUES (1,'HỌC BỔNG 70%',6930000),(2,'HỌC BỔNG 70%',16940000);
/*!40000 ALTER TABLE `subtract_tuition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuition`
--

DROP TABLE IF EXISTS `tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuition` (
  `TuitionID` int(11) NOT NULL AUTO_INCREMENT,
  `Abbreviation` varchar(15) NOT NULL,
  `TuitionName` varchar(125) NOT NULL,
  `TuitionVND` int(11) NOT NULL,
  `TuitionUSA` int(11) NOT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`TuitionID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition`
--

LOCK TABLES `tuition` WRITE;
/*!40000 ALTER TABLE `tuition` DISABLE KEYS */;
INSERT INTO `tuition` VALUES (1,'PhiNH','Phí Nhập Học',4400000,200,'Bắt Buộc',''),(2,'ENG1','Tiếng Anh Dự Bị 1',9000000,450,'Theo Mức Học Thực Tế',''),(3,'ENG2','Tiếng Anh Dự Bị 2',9000000,450,'Theo Mức Học Thực Tế',''),(4,'ENG3','Tiếng Anh Dự Bị 3',9000000,450,'Theo Mức Học Thực Tế',''),(5,'ENG4','Tiếng Anh Dự Bị 4',9000000,450,'Theo Mức Học Thực Tế',''),(6,'ENG5','Tiếng Anh Dự Bị 5',9000000,450,'Theo Mức Học Thực Tế',''),(7,'ENG6','Tiếng Anh Dự Bị 6',9000000,450,'Theo Mức Học Thực Tế',''),(8,'CN1','Chuyên Ngành 1',24000000,1100,'Bắt Buộc',''),(9,'CN2','Chuyên Ngành 2',24000000,1100,'Bắt Buộc',''),(10,'CN3','Chuyên Ngành 3',24000000,1100,'Bắt Buộc',''),(11,'CN4','Chuyên Ngành 4',24000000,1100,'Bắt Buộc',''),(12,'CN5','Chuyên Ngành 5',24000000,1100,'Bắt Buộc',''),(13,'CN6','Chuyên Ngành 6',24000000,1100,'Bắt Buộc',''),(14,'CN7','Chuyên Ngành 7',24000000,1100,'Bắt Buộc',''),(15,'CN8','Chuyên Ngành 8',24000000,1100,'Bắt Buộc',''),(16,'CN9','Chuyên Ngành 9',24000000,1100,'Bắt Buộc','');
/*!40000 ALTER TABLE `tuition` ENABLE KEYS */;
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
  `TuitionID` int(11) NOT NULL,
  `SemesterID` int(11) NOT NULL,
  `TotalTuition` int(11) NOT NULL DEFAULT '0',
  `SubtractTuitionID` int(11) NOT NULL DEFAULT '-1' COMMENT 'Cac khoan khau tru',
  `ActualTuition` int(11) NOT NULL DEFAULT '0',
  `PaidTuition` int(11) NOT NULL DEFAULT '0',
  `Bank` varchar(100) NOT NULL DEFAULT '-',
  `TransferDate` timestamp NULL DEFAULT NULL,
  `Status` varchar(30) NOT NULL DEFAULT '\0',
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`TuitionPaymentID`),
  KEY `fk_subtract_amount_idx` (`SubtractTuitionID`),
  KEY `fk_payment_student_idx` (`StudentID`),
  KEY `fk_payment_tuition_idx` (`TuitionID`),
  KEY `fk_payment_semester_idx` (`SemesterID`),
  CONSTRAINT `fk_payment_semester` FOREIGN KEY (`SemesterID`) REFERENCES `semester` (`SemesterID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_tuition` FOREIGN KEY (`TuitionID`) REFERENCES `tuition` (`TuitionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subtract_amount` FOREIGN KEY (`SubtractTuitionID`) REFERENCES `subtract_tuition` (`SubtractTuitionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition_payment`
--

LOCK TABLES `tuition_payment` WRITE;
/*!40000 ALTER TABLE `tuition_payment` DISABLE KEYS */;
INSERT INTO `tuition_payment` VALUES (1,4,6,1,9900000,1,2970000,2970000,'ĐÔNG Á','2014-01-09 17:00:00','1','-',''),(2,4,7,2,9900000,1,2970000,2970000,'ĐÔNG Á','2014-05-09 17:00:00','1','-',''),(3,4,8,3,24200000,2,7260000,7260000,'ĐÔNG Á','2014-10-09 17:00:00','1','-',''),(4,4,9,4,24200000,2,7260000,7260000,'ĐÔNG Á','2015-01-09 17:00:00','1','-',''),(5,4,10,5,24200000,2,7260000,7260000,'ĐÔNG Á','2015-05-09 17:00:00','1','-',''),(6,4,11,6,24200000,2,7260000,7260000,'ĐÔNG Á','2015-10-09 17:00:00','1','-','');
/*!40000 ALTER TABLE `tuition_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuition_plan`
--

DROP TABLE IF EXISTS `tuition_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuition_plan` (
  `TuitionPlanID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `TuitionName` varchar(40) NOT NULL,
  `Tuition` int(11) NOT NULL DEFAULT '0',
  `Note` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`TuitionPlanID`),
  KEY `fk_plan_student_idx` (`StudentID`),
  CONSTRAINT `fk_plan_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`RoleID`),
  KEY `fk__User_has_Role_Role1_idx` (`RoleID`),
  KEY `fk__User_has_Role__User1_idx` (`UserID`),
  CONSTRAINT `fk__User_has_Role_Role1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__User_has_Role__User1` FOREIGN KEY (`UserID`) REFERENCES `_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,2),(3,3),(4,4),(5,4),(6,4),(7,4),(8,4),(4,8),(5,10);
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

-- Dump completed on 2015-10-09 21:40:04
