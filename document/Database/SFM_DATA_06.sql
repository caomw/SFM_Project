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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user`
--

LOCK TABLES `_user` WRITE;
/*!40000 ALTER TABLE `_user` DISABLE KEYS */;
INSERT INTO `_user` VALUES (1,'admin','123456',NULL,''),(2,'manager','123456',NULL,''),(3,'staff','123456',NULL,''),(4,'student','123456',NULL,'');
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
  `ClassName` varchar(45) NOT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clazz`
--

LOCK TABLES `clazz` WRITE;
/*!40000 ALTER TABLE `clazz` DISABLE KEYS */;
INSERT INTO `clazz` VALUES (1,'SE0861',NULL,'');
/*!40000 ALTER TABLE `clazz` ENABLE KEYS */;
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
  `ClassID` int(11) NOT NULL,
  `Haft` int(11) NOT NULL,
  `StartDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EndDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  `CourseStatus` varchar(20) DEFAULT NULL COMMENT 'Chưa Bắt đầu\nĐang Bắt đầu\nĐóng',
  PRIMARY KEY (`CourseID`),
  KEY `fk_course_class_idx` (`ClassID`),
  KEY `fk_course_subject_idx` (`SubjectID`),
  CONSTRAINT `fk_course_class` FOREIGN KEY (`ClassID`) REFERENCES `clazz` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_subject` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,130,1,1,'2015-07-05 17:00:00','2015-08-05 17:00:00',NULL,'','Chưa Bắt Đầu');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investing_report`
--

DROP TABLE IF EXISTS `investing_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investing_report` (
  `ReportID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `TotalMoney` mediumtext NOT NULL,
  `PaidMoney` mediumtext NOT NULL,
  `PayStatus` bit(1) NOT NULL,
  `Bank` varchar(45) DEFAULT NULL,
  `DateTransfer` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `fk_investing_report_idx` (`StudentID`),
  CONSTRAINT `fk_investing_report` FOREIGN KEY (`StudentID`) REFERENCES `investing_student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investing_report`
--

LOCK TABLES `investing_report` WRITE;
/*!40000 ALTER TABLE `investing_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `investing_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investing_student`
--

DROP TABLE IF EXISTS `investing_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investing_student` (
  `StudentID` int(11) NOT NULL,
  `InvestingRate` int(11) NOT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_investing_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investing_student`
--

LOCK TABLES `investing_student` WRITE;
/*!40000 ALTER TABLE `investing_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `investing_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans_interest`
--

DROP TABLE IF EXISTS `loans_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans_interest` (
  `ReportID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `InterestRate` int(11) DEFAULT NULL,
  `BaseMoney` mediumtext NOT NULL,
  `Interest` mediumtext NOT NULL,
  `TotalInterest` mediumtext NOT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `fk_interest_before_idx` (`StudentID`),
  CONSTRAINT `fk_interest_before` FOREIGN KEY (`StudentID`) REFERENCES `loans_student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans_interest`
--

LOCK TABLES `loans_interest` WRITE;
/*!40000 ALTER TABLE `loans_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans_student`
--

DROP TABLE IF EXISTS `loans_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans_student` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `LoansRate` int(11) NOT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `fk_loans_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans_student`
--

LOCK TABLES `loans_student` WRITE;
/*!40000 ALTER TABLE `loans_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans_student` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `scholarship_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `SemesterID` int(11) NOT NULL AUTO_INCREMENT,
  `SemesterName` varchar(45) NOT NULL,
  `StartDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EndDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`SemesterID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,'Fall 2015','2015-09-06 17:00:00','2016-01-06 17:00:00',NULL,''),(2,'Summer 2015','2015-04-06 17:00:00','2015-08-06 17:00:00',NULL,''),(3,'Spring 2015','2014-11-06 17:00:00','2015-03-06 17:00:00',NULL,''),(4,'Fall 2014','2014-06-06 17:00:00','2014-10-06 17:00:00',NULL,'');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `SessionID` int(11) NOT NULL AUTO_INCREMENT,
  `SessionCode` varchar(15) DEFAULT NULL,
  `ProgressName` varchar(45) DEFAULT NULL,
  `TuitionUSA` mediumtext,
  `TuitionVND` mediumtext,
  `Note` text COMMENT 'Bắt buộc\nTheo mức học thực tế\nĐối với riêng ngành ngôn ngữ\n',
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`SessionID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'ENG1','Tiếng Anh dự bị 1','450','9900000','Theo mức học thực tế',''),(2,'ENG2','Tiếng Anh dự bị 2','450','9900000','Theo mức học thực tế',''),(3,'ENG3','Tiếng Anh dự bị 3','450','9900000','Theo mức học thực tế',''),(4,'ENG4','Tiếng Anh dự bị 4','450','9900000','Theo mức học thực tế',''),(5,'ENG5','Tiếng Anh dự bị 5','450','9900000','Theo mức học thực tế',''),(6,'ENG6','Tiếng Anh dự bị 6','450','9900000','Theo mức học thực tế',''),(7,'SEM1','Chuyên ngành 1','1100000','24200000','Bắt buộc',''),(8,'SEM2','Chuyên ngành 2','1100000','24200000','Bắt buộc',''),(9,'SEM3','Chuyên ngành 3','1100000','24200000','Bắt buộc',''),(10,'SEM4','Chuyên ngành 4','1100000','24200000','Bắt buộc',''),(11,'SEM5','Chuyên ngành 5','1100000','24200000','Bắt buộc',''),(12,'SEM6','Chuyên ngành 6','1100000','24200000','Bắt buộc',''),(13,'SEM7','Chuyên ngành 7','1100000','24200000','Bắt buộc',''),(14,'SEM8','Chuyên ngành 8','1100000','24200000','Bắt buộc',''),(15,'SEM9','Chuyên ngành 9','1100000','24200000','Bắt buộc','');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_tuition`
--

DROP TABLE IF EXISTS `session_tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_tuition` (
  `SessionTuitionID` int(11) NOT NULL AUTO_INCREMENT,
  `TotalMoney` mediumtext,
  `SubtractAmountID` int(11) DEFAULT NULL COMMENT 'Cac khoan khau tru',
  `RealPayMoney` mediumtext,
  `PaidAmount` mediumtext,
  `Bank` varchar(100) DEFAULT NULL,
  `TransferDate` timestamp NULL DEFAULT NULL,
  `IsPaidFull` bit(1) DEFAULT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`SessionTuitionID`),
  KEY `fk_subtract_amount_idx` (`SubtractAmountID`),
  CONSTRAINT `fk_session_tuition` FOREIGN KEY (`SessionTuitionID`) REFERENCES `study_session` (`StudySessionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subtract_amount` FOREIGN KEY (`SubtractAmountID`) REFERENCES `subtractamount` (`SubtractAmountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_tuition`
--

LOCK TABLES `session_tuition` WRITE;
/*!40000 ALTER TABLE `session_tuition` DISABLE KEYS */;
INSERT INTO `session_tuition` VALUES (4,'24200000',1,'0','0','Đông Á','2015-07-05 17:00:00','',NULL,'');
/*!40000 ALTER TABLE `session_tuition` ENABLE KEYS */;
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
  `FullName` varchar(64) DEFAULT NULL,
  `StudentCode` varchar(10) DEFAULT NULL,
  `Gender` bit(1) DEFAULT NULL,
  `DateOfBirth` timestamp NULL DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `SSN` varchar(10) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text,
  `FinanceType` varchar(15) DEFAULT NULL,
  `Major` varchar(5) DEFAULT NULL COMMENT 'Chuyên Ngành : SE, SB, IA',
  `IsGraduated` bit(1) DEFAULT NULL,
  `StudyStatus` varchar(30) DEFAULT NULL COMMENT 'Đang Học, Bảo Lưu',
  `SubMajor` varchar(45) DEFAULT NULL,
  `Term` varchar(10) DEFAULT NULL COMMENT 'K7, K8, K9',
  `NarrowSpecialization` varchar(20) DEFAULT NULL COMMENT 'Chuyên Nghành hẹp :\n-Normal\n-IS\n-JS\n- ES',
  `ParentPhone` varchar(15) DEFAULT NULL,
  `ParentEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `StudentCode_UNIQUE` (`StudentCode`),
  CONSTRAINT `fk_student_user` FOREIGN KEY (`StudentID`) REFERENCES `_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (4,'Trần KhắcVỹ','SE60964','','1993-06-06 17:00:00','VyTKSE60964@fpt.edu.vn','241488591','01672011550','123 Lê Lợi','HB','SE','\0','ĐANG HỌC','KTPM','KHÓA 7','IS','0123456789','phuhuynh@yahoo.com');
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
  `StudentSessionID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `StudyMode` varchar(20) DEFAULT NULL COMMENT 'Hoc Lai\nHoc Cai Thien',
  `IsPass` bit(1) DEFAULT NULL,
  `Mark` float NOT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`StudentCourseID`),
  KEY `fk_stucourse_course_idx` (`CourseID`),
  KEY `fk_course_student_idx` (`StudentSessionID`),
  CONSTRAINT `fk_course_study_session` FOREIGN KEY (`StudentSessionID`) REFERENCES `study_session` (`StudySessionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stucourse_course` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES (1,4,1,'Học Chính','',7.8,NULL,'');
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_resit_course`
--

DROP TABLE IF EXISTS `student_resit_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_resit_course` (
  `StudentCourseID` int(11) NOT NULL,
  `TotalMoney` mediumtext NOT NULL,
  `MustPayMoney` mediumtext NOT NULL,
  `PaidMoney` mediumtext NOT NULL,
  `PayStatus` bit(1) NOT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`StudentCourseID`),
  CONSTRAINT `fk_resit_student_course` FOREIGN KEY (`StudentCourseID`) REFERENCES `student_course` (`StudentCourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_resit_course`
--

LOCK TABLES `student_resit_course` WRITE;
/*!40000 ALTER TABLE `student_resit_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_resit_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_session`
--

DROP TABLE IF EXISTS `study_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_session` (
  `StudySessionID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `SessionID` int(11) NOT NULL,
  `SemesterID` int(11) NOT NULL,
  PRIMARY KEY (`StudySessionID`),
  KEY `fk_study_progress_2_idx` (`SessionID`),
  KEY `fk_study_session3_idx` (`SemesterID`),
  KEY `fk_study_progress_1` (`StudentID`),
  CONSTRAINT `fk_study_progress_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_study_progress_2` FOREIGN KEY (`SessionID`) REFERENCES `session` (`SessionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_study_session3` FOREIGN KEY (`SemesterID`) REFERENCES `semester` (`SemesterID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_session`
--

LOCK TABLES `study_session` WRITE;
/*!40000 ALTER TABLE `study_session` DISABLE KEYS */;
INSERT INTO `study_session` VALUES (1,4,6,4),(2,4,7,3),(3,4,8,2),(4,4,9,1);
/*!40000 ALTER TABLE `study_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryID` int(11) DEFAULT NULL,
  `SubjectNameE` varchar(80) DEFAULT NULL,
  `SubjectNameV` varchar(80) DEFAULT NULL,
  `SubjectCode` varchar(15) DEFAULT NULL,
  `Abbreviation` varchar(15) DEFAULT NULL,
  `NumOfCredit` int(11) DEFAULT NULL,
  `Note` text,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`SubjectID`),
  KEY `fk_subject_category_idx` (`CategoryID`),
  CONSTRAINT `fk_subject_category` FOREIGN KEY (`CategoryID`) REFERENCES `subject_category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (32,NULL,'Principles of Accounting','Nguyên lý kế toán','ACC101','POA',0,NULL,''),(33,NULL,'Managerial Accounting','Kế toán quản lý','ACC302','MA',0,NULL,''),(34,NULL,'Financial Statement Analysis','Phân tích báo cáo tài chính','ACC305','FSA',0,NULL,''),(35,NULL,'Principle Of Banking','Các nguyên tắc cơ bản về ngân hàng','BKG201','POB',0,NULL,''),(36,NULL,'Bank Management','Quản trị ngân hàng','BKG301','BM',0,NULL,''),(37,NULL,'Investment Project Appraisal','Thẩm định dự án đầu tư','BKG302','IPA',0,NULL,''),(38,NULL,'Bank Lending','Tín dụng ngân hàng','BKG304','BL',0,NULL,''),(39,NULL,'Business Ethics','Đạo đức kinh doanh','BUE201','EIB',0,NULL,''),(40,NULL,'Computer Organization and Architecture','Tổ chức và Kiến trúc máy tính','CEA201','',0,NULL,''),(41,NULL,'Data Structure and Algorithm','Cấu trúc dữ liệu và giải thuật','CSD201','DSA',0,NULL,''),(42,NULL,'Introduction to Computing','Nhập môn tính toán','CSI101','I2C',0,NULL,''),(43,NULL,'Introduction to Informatics','Tin học đại cương','CSI102','I2I',0,NULL,''),(44,NULL,'Chinese Elementary 1','Tiếng Trung sơ cấp 1','CHN111','CHN1',0,NULL,''),(45,NULL,'Chinese Elementary 2','Tiếng Trung sơ cấp 2','CHN122','CHN2',0,NULL,''),(46,NULL,'Chinese Elementary 3','Tiếng Trung sơ cấp 3','CHN132','CHN3',0,NULL,''),(47,NULL,'Database Advanced','Cơ sở dữ liệu nâng cao','DBD301','AD',0,NULL,''),(48,NULL,'Database Systems','Các hệ cơ sở dữ liệu','DBI202','',0,NULL,''),(49,NULL,'Digital Fundamentals','Cơ sở số hóa','DGT201','DF',0,NULL,''),(50,NULL,'Digital Signal Processing','Xử lý tín hiệu số','DGT301','DSP',0,NULL,''),(51,NULL,'Basic Microeconomics','Kinh tế vi mô','ECO111','BMiE',0,NULL,''),(52,NULL,'Basic Macroeconomics','Kinh tế vĩ mô','ECO121','BMaE',0,NULL,''),(53,NULL,'Business English 1','Tiếng Anh doanh nghiệp 1','ENI101','E-BE1',0,NULL,''),(54,NULL,'Business English 2','Tiếng Anh doanh nghiệp 2','ENI201','E-BE2',0,NULL,''),(55,NULL,'Business English 3','Tiếng Anh doanh nghiệp 3','ENI301','E-BE3',0,NULL,''),(56,NULL,'Business English 4','Tiếng Anh doanh nghiệp 4','ENI401','E-BE4',0,NULL,''),(57,NULL,'Academic English 1','Tiếng Anh học thuật 1','ENL111','A-ENG1',0,NULL,''),(58,NULL,'Academic English 2','Tiếng Anh học thuật 2','ENL112','A-ENG2',0,NULL,''),(59,NULL,'Elementary Business English','Tiếng Anh thương mại Elementary','ENM101','MKL1',0,NULL,''),(60,NULL,'Pre-Intermediate Business English','Tiếng Anh thương mại Pre-Intermediate','ENM201','MKL2',0,NULL,''),(61,NULL,'Intermediate Business English','Tiếng Anh thương mại Intermediate','ENM301','MKL3',0,NULL,''),(62,NULL,'Upper Intermediate','Tiếng Anh thương mại Upper','ENM401','MKL4',0,NULL,''),(63,NULL,'Top Notch 1','Tiếng Anh 2','ENT101','ENG2',0,NULL,''),(64,NULL,'Top Notch 2','Tiếng Anh 3','ENT201','ENG3',0,NULL,''),(65,NULL,'Top Notch 3','Tiếng Anh 4','ENT301','ENG4',0,NULL,''),(66,NULL,'Summit 1','Tiếng Anh 5','ENT401','ENG5',0,NULL,''),(67,NULL,'Summit 2','Tiếng Anh 6','ENT501','ENG6',0,NULL,''),(68,NULL,'Embedded System Hardware','Phần cứng hệ thống nhúng','ESH201','ESH',0,NULL,''),(69,NULL,'Embedded Software Development','Phát triển phần mềm nhúng','ESS301','ESS',0,NULL,''),(70,NULL,'Entrepreneurship','Khởi Sự Doanh Nghiệp','ETR401','SBE',0,NULL,''),(71,NULL,'Software Entrepreneurship','Khởi nghiệp phần mềm','ETR402','SWE',0,NULL,''),(72,NULL,'Valuation and Financial Modeling','Các mô hình tài chính','FIM301','V&FM',0,NULL,''),(73,NULL,'Monetary Economics and Global Economy','Kinh tế tiền tệ và Kinh tế toàn cầu','FIN201','M&GE',0,NULL,''),(74,NULL,'Principles Of Corporate Finance','Tài chính doanh nghiệp','FIN202','CF',0,NULL,''),(75,NULL,'Financial Market And Institutions','Thị trường & các định chế tài chính','FIN301','FM&I',0,NULL,''),(76,NULL,'Advanced Corporate Finance','Tài chính doanh nghiệp nâng cao','FIN303','ACF',0,NULL,''),(77,NULL,'Derivatives','Công cụ phái sinh','FIN402','DER',0,NULL,''),(78,NULL,'Applied Graphic Design','Ứng dụng thiết kế đồ họa','GDP101','AGD',0,NULL,''),(79,NULL,'Graduation Thesis (For Marketing concentration)','Marketing','GRA491','MKT',0,NULL,''),(80,NULL,'Graduation Thesis (For Finance Concentration \nof BBA and BFB)','Tài chính','GRA492','FIN',0,NULL,''),(81,NULL,'Graduation Thesis (For Banking Concentration )','Tài chính Doanh nghiệp','GRA494','COF',0,NULL,''),(82,NULL,'Graduation Thesis (For Marketing & Sales concentration)','Ngân hàng thương mại','GRA495','COB',0,NULL,''),(83,NULL,'Human Computer Interaction','Tương tác người máy','HCI201','HCI',0,NULL,''),(84,NULL,'Ho Chi Minh Ideology','Tư tưởng Hồ Chí Minh','HCM201','TTHCM',0,NULL,''),(85,NULL,'E-Commerce','Thương mại điện tử','ISC301','ECOM',0,NULL,''),(86,NULL,'E-Commerce for Business','Thương mại điện tử','ISC302','ECOMB',0,NULL,''),(87,NULL,'IT Applications In Enterprise','Ứng dụng CNTT trong doanh nghiệp','ITA201','ITAE',0,NULL,''),(88,NULL,'Management Information System','Hệ thống thông tin quản lý','ITA202','MIS',0,NULL,''),(89,NULL,'Ethics in Information Technology','Đạo đức nghề nghiệp','ITE302','EIT',0,NULL,''),(90,NULL,'Japanese Fundamental Information Technology Skill Standards','Tiếng Nhật CNTT','JFE301','JITF',0,NULL,''),(91,NULL,'IT JAPANESE','Tiếng Nhật CNTT','JIT301','JIT',0,NULL,''),(92,NULL,'Japanese Language 1.1 - Dekiru','Tiếng Nhật sơ cấp 1','JPD111','JPD1',0,NULL,''),(93,NULL,'Japanese Language 1.2 - Dekiru','Tiếng Nhật sơ cấp 2','JPD121','JPD2',0,NULL,''),(94,NULL,'Japanese Language 1.3 - Dekiru','Tiếng Nhật sơ cấp 3','JPD131','JPD3',0,NULL,''),(95,NULL,'Japanese Language 1.4 - Dekiru','Tiếng Nhật sơ cấp 4','JPD141','JPD4',0,NULL,''),(96,NULL,'Japanese Language 1.1','Tiếng Nhật sơ cấp 1','JPS112','JPN1.1',0,NULL,''),(97,NULL,'Japanese Language 1.2','Tiếng Nhật sơ cấp 2','JPS122','JPN1.2',0,NULL,''),(98,NULL,'Japanese Language 1.3','Tiếng Nhật sơ cấp 3','JPS132','JPN1.3',0,NULL,''),(99,NULL,'Japanese Language 1.4','Tiếng Nhật sơ cấp 4','JPS142','JPN1.4',0,NULL,''),(100,NULL,'Japanese Language 1.5','Tiếng Nhật sơ cấp 5','JPS152','JPN1.5',0,NULL,''),(101,NULL,'Japanese Language 2.1','Tiếng Nhật trung cấp 1','JPS212','JPN2.1',0,NULL,''),(102,NULL,'Japanese Language 2.2','Tiếng Nhật trung cấp 2','JPS222','JPN2.2',0,NULL,''),(103,NULL,'Basic Practicing (C Lab)','Thực hành cơ bản','LAB101','LAB1',0,NULL,''),(104,NULL,'OOP with Java Lab','Thực hành OOP với Java','LAB211','LAB2',0,NULL,''),(105,NULL,'Business Law Fundamentals','Pháp luật đại cương','LAW101','LF',0,NULL,''),(106,NULL,'Advanced Mathematics 2','Toán cao cấp 2','MAA101','AM2',0,NULL,''),(107,NULL,'Advanced Mathematics 1','Toán cao cấp 1','MAC101','AM1',0,NULL,''),(108,NULL,'Advanced Mathematics For Business','Toán cao cấp 1 (BA)','MAC102','AMB',0,NULL,''),(109,NULL,'Discrete Mathematics 1','Toán rời rạc 1','MAD111','DM1',0,NULL,''),(110,NULL,'Discrete Mathematics 2','Toán rời rạc 2','MAD121','DM2',0,NULL,''),(111,NULL,'Discrete Structure','Toán rời rạc','MAD101','DM',0,NULL,''),(112,NULL,'Mathematics for Engineerin','Toán cho ngành kỹ thuật','MAE101','',0,NULL,''),(113,NULL,'Statistics and Data Processing','Thống kê và xử lý dữ liệu','MAS201','S&DP',0,NULL,''),(114,NULL,'Probability and Statistics','Xác suất thống kê','MAS291','P&S',0,NULL,''),(115,NULL,'Introduction to Management','Nhập môn quản lý','MGT101','I2M',0,NULL,''),(116,NULL,'Marketing Principles','Nguyên lý Marketing','MKT101','MP',0,NULL,''),(117,NULL,'Consumer Behavior','Hành vi người tiêu dùng','MKT201','CB',0,NULL,''),(118,NULL,'Service Marketing Management','Quản trị marketing dịch vụ','MKT202','SMM',0,NULL,''),(119,NULL,'Marketing Research','Nghiên cứu Marketing','MKT301','MR',0,NULL,''),(120,NULL,'Integrated Marketing Communications','Tích hợp truyền thông tiếp thị','MKT304','IMC',0,NULL,''),(121,NULL,'Marketing Stratery','Chiến lược Marketing','MKT305','MaS',0,NULL,''),(122,NULL,'Principles of Marxism Leninism','Những nguyên lý cơ bản của Chủ nghĩa Mác-Lênin','MLN101','CNMLN',0,NULL,''),(123,NULL,'Computer Networking','Mạng máy tính','NWC202','CNW',0,NULL,''),(124,NULL,'Organizational Behavior','Hành vi tổ chức','OBE101','OB',0,NULL,''),(125,NULL,'Operating System','Hệ điều hành','OSG202','OS',0,NULL,''),(126,NULL,'Cloud Computing','Điện toán đám mây','PRC391','CC',0,NULL,''),(127,NULL,'Excel Programming','Lập trình Excel','PRE201','EP',0,NULL,''),(128,NULL,'Programming Fundamentals Using C','Cơ sở lập trình C','PRF192','PFC',0,NULL,''),(129,NULL,'Core Java','Java căn bản','PRJ101','CJ',0,NULL,''),(130,NULL,'Advanced Java','Java nâng cao','PRJ201','AJ',0,NULL,''),(131,NULL,'Web-based Java Applications','Phát triển ứng dụng Java web','PRJ321','',0,NULL,''),(132,NULL,'Desktop Java Applications','Phát triển ứng dụng Java desktop','PRJ311','',0,NULL,''),(133,NULL,'Mobile Programming','Lập trình di động','PRM391','MOP',0,NULL,''),(134,NULL,'C# & Dot Net','C# & Dot Net','PRN292','CNET',0,NULL,''),(135,NULL,'Learning to Program with Alice','Lập trình với Alice','PRO001','Alice',0,NULL,''),(136,NULL,'Object Oriented Paradigm','Lập trình hướng đối tượng','PRO191','OOP',0,NULL,''),(137,NULL,'Object-Oriented Programming','Lập trình hướng đối tượng (with Java)','PRO192','',0,NULL,''),(138,NULL,'Front-end Web Development','Lập trình web động','PRO201','',0,NULL,''),(139,NULL,'Advanced XML','XML nâng cao','PRX301','XML',0,NULL,''),(140,NULL,'Business Research Methods','Phương pháp nghiên cứu','RMB301','RM',0,NULL,''),(141,NULL,'Business Communication for BA','Giao tiếp thương mại','SSC101','COMB',0,NULL,''),(142,NULL,'Business Communication','Giao tiếp thương mại','SSC102','COM',0,NULL,''),(143,NULL,'Working in groups','Làm việc nhóm','SSG101','WIG',0,NULL,''),(144,NULL,'Working in Group for BA','Làm việc nhóm','SSG102','WIGB',0,NULL,''),(145,NULL,'Management Skills','Kỹ năng quản lý','SSM201','MS',0,NULL,''),(146,NULL,'Negotiation','Kỹ năng đàm phán và giải quyết xung đột','SSN301','N&CSS',0,NULL,''),(147,NULL,'Software Construction','Phần mềm xây dựng','SWC202','SWC',0,NULL,''),(148,NULL,'Software Architecture & Design','Kiến trúc và thiết kế phần mềm','SWD391','SAD',0,NULL,''),(149,NULL,'Introduction to Software Engineering','Nhập môn Kỹ thuật phần mềm','SWE102','I2SE',0,NULL,''),(150,NULL,'Information Assurance Overview','Tổng quan về an toàn thông tin','IAO101','IAO',0,NULL,''),(151,NULL,'Software Project Management','Quản trị dự án phần mềm','SWM301','SPM',0,NULL,''),(152,NULL,'Capstone Project (For IS Specializations)','Hệ thống thông tin','SWP490','IS',0,NULL,''),(153,NULL,'Capstone Project (For ES Specializations)','Phát triển phần mềm cho hệ thống nhúng','SWP490','ES',0,NULL,''),(154,NULL,'Capstone Project (For JS Specialization)\nJapanese Bridge Software Engineer','Kỹ sư cầu nối Nhật','SWP493','JS',0,NULL,''),(155,NULL,'Software Quality Assurance and Testing','Đảm bảo chất lượng & kiểm thử PM','SWQ391','SQA&T',0,NULL,''),(156,NULL,'Software Requirement','Yêu cầu phần mềm','SWR301','SR',0,NULL,''),(157,NULL,'Start your business','Khởi Sự Doanh Nghiệp','SYB301','SYB',0,NULL,''),(158,NULL,'Revolutionary Lines of CPV','Đường lối cách mạng của Đảng cộng sản Việt Nam','VNR201','DCSVN',0,NULL,''),(159,NULL,'Vovinam 1','','VOV112','VOV1',0,NULL,''),(160,NULL,'Vovinam 2','','VOV113','VOV2',0,NULL,''),(161,NULL,'Vovinam 3','','VOV122','VOV3',0,NULL,''),(162,NULL,'Vovinam 4','','VOV123','VOV4',0,NULL,''),(163,NULL,'Vovinam 5','','VOV132','VOV5',0,NULL,''),(164,NULL,'Vovinam 6','','VOV133','VOV6',0,NULL,''),(165,NULL,'Lái xe ôtô','','','LXO',0,NULL,''),(166,NULL,'','','','',0,NULL,'');
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
  `CategoryNameE` varchar(45) DEFAULT NULL,
  `CategoryNameV` varchar(45) DEFAULT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_category`
--

LOCK TABLES `subject_category` WRITE;
/*!40000 ALTER TABLE `subject_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtractamount`
--

DROP TABLE IF EXISTS `subtractamount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subtractamount` (
  `SubtractAmountID` int(11) NOT NULL AUTO_INCREMENT,
  `SubtractAmountName` varchar(45) DEFAULT NULL,
  `SubtractAmount` mediumtext,
  PRIMARY KEY (`SubtractAmountID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtractamount`
--

LOCK TABLES `subtractamount` WRITE;
/*!40000 ALTER TABLE `subtractamount` DISABLE KEYS */;
INSERT INTO `subtractamount` VALUES (1,'Học Bổng 100%','24200000');
/*!40000 ALTER TABLE `subtractamount` ENABLE KEYS */;
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
INSERT INTO `user_role` VALUES (1,1),(2,2),(3,3),(4,4);
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

-- Dump completed on 2015-10-06 16:54:32
