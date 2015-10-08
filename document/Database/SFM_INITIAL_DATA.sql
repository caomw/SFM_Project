INSERT INTO `_user` VALUES (1,'admin','123456',NULL,''),(2,'manager','123456',NULL,''),(3,'staff','123456',NULL,''),(4,'student','123456',NULL,'');

INSERT INTO `role` VALUES (1,'ADMIN'),(2,'MANAGER'),(3,'STAFF'),(4,'STUDENT'),(5,'STUDENT_SERVICE_STAFF'),(6,'FINANCE_STAFF'),(7,'EDUCATION_STAFF'),(8,'SCHOLARSHIP_STUDENT'),(9,'INVESTING_STUDENT'),(10,'LOANSCREDIT_STUDENT');

INSERT INTO `user_role` VALUES (1,1),(2,2),(3,3),(4,4);


INSERT INTO `sfm`.`student` (`StudentID`, `FullName`, `StudentCode`, `Gender`, `DateOfBirth`, `Email`, `SSN`, `PhoneNumber`, `Address`, `FinanceType`, `Major`, `IsGraduated`, `StudyStatus`, `SubMajor`, `Term`, `NarrowSpecialization`, `ParentPhone`, `ParentEmail`) VALUES ('4', 'Trần KhắcVỹ', 'SE60964', 1, '1993-06-07', 'VyTKSE60964@fpt.edu.vn', '241488591', '01672011550', '123 Lê Lợi', 'HB', 'SE', 0, 'ĐANG HỌC', 'KTPM', 'KHÓA 7', 'IS', '0123456789', 'phuhuynh@yahoo.com');

INSERT INTO `sfm`.`semester` (`SemesterName`, `StartDate`, `EndDate`, `IsActive`) VALUES ('Fall 2015', '2015-09-07', '2016-01-07', 1);
INSERT INTO `sfm`.`semester` (`SemesterName`, `StartDate`, `EndDate`, `IsActive`) VALUES ('Summer 2015', '2015-04-07', '2015-08-07', 1);
INSERT INTO `sfm`.`semester` (`SemesterName`, `StartDate`, `EndDate`, `IsActive`) VALUES ('Spring 2015', '2014-11-07', '2015-03-07', 1);
INSERT INTO `sfm`.`semester` (`SemesterName`, `StartDate`, `EndDate`, `IsActive`) VALUES ('Fall 2014', '2014-06-07', '2014-10-07', 1);




INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('ENG1', 'Tiếng Anh dự bị 1', '450', '9900000', 'Theo mức học thực tế', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('ENG2', 'Tiếng Anh dự bị 2', '450', '9900000', 'Theo mức học thực tế', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('ENG3', 'Tiếng Anh dự bị 3', '450', '9900000', 'Theo mức học thực tế', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('ENG4', 'Tiếng Anh dự bị 4', '450', '9900000', 'Theo mức học thực tế', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('ENG5', 'Tiếng Anh dự bị 5', '450', '9900000', 'Theo mức học thực tế', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('ENG6', 'Tiếng Anh dự bị 6', '450', '9900000', 'Theo mức học thực tế', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM1', 'Chuyên ngành 1', '1100000', '24200000', 'Bắt buộc', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM2', 'Chuyên ngành 2', '1100000', '24200000', 'Bắt buộc', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM3', 'Chuyên ngành 3', '1100000', '24200000', 'Bắt buộc', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM4', 'Chuyên ngành 4', '1100000', '24200000', 'Bắt buộc', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM5', 'Chuyên ngành 5', '1100000', '24200000', 'Bắt buộc', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM6', 'Chuyên ngành 6', '1100000', '24200000', 'Bắt buộc', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM7', 'Chuyên ngành 7', '1100000', '24200000', 'Bắt buộc', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM8', 'Chuyên ngành 8', '1100000', '24200000', 'Bắt buộc', 1);
INSERT INTO `sfm`.`session` (`SessionCode`, `SessionName`, `TuitionUSA`, `TuitionVND`, `Note`, `IsActive`) VALUES ('SEM9', 'Chuyên ngành 9', '1100000', '24200000', 'Bắt buộc', 1);


INSERT INTO `sfm`.`study_session` (`StudentID`, `SessionID`, `SemesterID`) VALUES ('4', '6', '4');
INSERT INTO `sfm`.`study_session` (`StudentID`, `SessionID`, `SemesterID`) VALUES ('4', '7', '3');
INSERT INTO `sfm`.`study_session` (`StudentID`, `SessionID`, `SemesterID`) VALUES ('4', '8', '2');
INSERT INTO `sfm`.`study_session` (`StudentID`, `SessionID`, `SemesterID`) VALUES ('4', '9', '1');




