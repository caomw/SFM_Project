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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clazz`
--

LOCK TABLES `clazz` WRITE;
/*!40000 ALTER TABLE `clazz` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_tuition`
--

DROP TABLE IF EXISTS `session_tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_tuition` (
  `SessionID` int(11) NOT NULL AUTO_INCREMENT,
  `TotalMoney` mediumtext NOT NULL,
  `SubtractMoney` mediumtext NOT NULL COMMENT 'Cac khoan khau tru',
  `RealPayMoney` mediumtext NOT NULL,
  `PaidMoney` mediumtext NOT NULL,
  `Bank` varchar(45) DEFAULT NULL,
  `TransferDate` timestamp NULL DEFAULT NULL,
  `IsPaidFull` bit(1) NOT NULL,
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`SessionID`),
  CONSTRAINT `fk_session_tuition` FOREIGN KEY (`SessionID`) REFERENCES `study_session` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_tuition`
--

LOCK TABLES `session_tuition` WRITE;
/*!40000 ALTER TABLE `session_tuition` DISABLE KEYS */;
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
  `Major` varchar(10) DEFAULT NULL COMMENT 'Chuyên Ngành : SE, SB, IA',
  `StudyStatus` varchar(30) DEFAULT NULL COMMENT 'Đang Học, Bảo Lưu',
  `Term` varchar(10) DEFAULT NULL COMMENT 'K7, K8, K9',
  `Special` varchar(10) DEFAULT NULL COMMENT 'Chuyên Nghành hẹp :\n-Normal\n-IS\n-JS\n- ES',
  `FullName` varchar(64) DEFAULT NULL,
  `DateOfBirth` timestamp NULL DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `StudentCode` varchar(10) DEFAULT NULL,
  `Gender` bit(1) DEFAULT NULL,
  `ParentPhone` varchar(15) DEFAULT NULL,
  `ParentEmail` varchar(255) DEFAULT NULL,
  `IsGraduated` bit(1) DEFAULT NULL,
  `SSN` varchar(10) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text,
  `class` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `StudentCode_UNIQUE` (`StudentCode`),
  CONSTRAINT `fk_student_user` FOREIGN KEY (`StudentID`) REFERENCES `_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
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
  CONSTRAINT `fk_course_student` FOREIGN KEY (`StudentSessionID`) REFERENCES `study_session` (`StudySessionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stucourse_course` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
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
  `StudySessionID` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_session`
--

LOCK TABLES `study_session` WRITE;
/*!40000 ALTER TABLE `study_session` DISABLE KEYS */;
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
  `CategoryID` int(11) NOT NULL,
  `SubjectNameE` varchar(45) DEFAULT NULL,
  `SubjectNameV` varchar(45) DEFAULT NULL,
  `SubjectCode` varchar(10) NOT NULL,
  `NumOfCredit` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL COMMENT 'Bắt buộc\nChuyên Ngành JS\nChuyên Ngành IS',
  `Note` text,
  `IsActive` bit(1) NOT NULL,
  `NumOfLesson` int(11) NOT NULL,
  PRIMARY KEY (`SubjectID`),
  KEY `fk_subject_category_idx` (`CategoryID`),
  CONSTRAINT `fk_subject_category` FOREIGN KEY (`CategoryID`) REFERENCES `subject_category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
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

-- Dump completed on 2015-10-04 18:36:34
