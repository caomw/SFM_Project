USER

INSERT INTO `sfm`.`_user` (`Username`, `Password`, `Note`, `IsActive`, `Date_Created`, `DateUpdated`) 
VALUES ('admin', '123456', '-', 1, now(), now() );
INSERT INTO `sfm`.`_user` (`Username`, `Password`, `Note`, `IsActive`, `Date_Created`, `DateUpdated`) 
VALUES ('manager', '123456', '-', 1, now(), now() );
INSERT INTO `sfm`.`_user` (`Username`, `Password`, `Note`, `IsActive`, `Date_Created`, `DateUpdated`) 
VALUES ('staff', '123456', '-', 1, now(), now() );
INSERT INTO `sfm`.`_user` (`Username`, `Password`, `Note`, `IsActive`, `Date_Created`, `DateUpdated`) 
VALUES ('student', '123456', '-', 1, now(), now() );

ROLE
INSERT INTO `sfm`.`role` (`RoleName`, `Note`, `IsActive`, `Date_Created`, `DateUpdated`) 
VALUES ('ADMIN', '-', 1, now(), now());
INSERT INTO `sfm`.`role` (`RoleName`, `Note`, `IsActive`, `Date_Created`, `DateUpdated`) 
VALUES ('MANAGER', '-', 1, now(), now());
INSERT INTO `sfm`.`role` (`RoleName`, `Note`, `IsActive`, `Date_Created`, `DateUpdated`) 
VALUES ('STAFF', '-', 1, now(), now());
INSERT INTO `sfm`.`role` (`RoleName`, `Note`, `IsActive`, `Date_Created`, `DateUpdated`) 
VALUES ('STUDENT', '-', 1, now(), now());

User_Role
INSERT INTO `sfm`.`user_role` (`UserID`, `RoleID`, `Note`, `IsActive`) VALUES ('1', '1', '-', 1);
INSERT INTO `sfm`.`user_role` (`UserID`, `RoleID`, `Note`, `IsActive`) VALUES ('2', '2', '-', 1);
INSERT INTO `sfm`.`user_role` (`UserID`, `RoleID`, `Note`, `IsActive`) VALUES ('3', '3', '-', 1);
INSERT INTO `sfm`.`user_role` (`UserID`, `RoleID`, `Note`, `IsActive`) VALUES ('4', '4', '-', 1);

INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('HB', '50', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('HB', '70', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('HB', '100', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('TD', '50', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('TD', '70', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('TD', '100', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('DT', '60', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('DT', '70', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('DT', '100', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('NVD', '100', '-', 1);
INSERT INTO `sfm`.`financial_type` (`FinancialTypeName`, `FinancialRate`, `Note`, `IsActive`) VALUES ('BT', '0', '-', 1);


INSERT INTO `sfm`.`major` (`MajorCode`, `MajorName`, `Note`) VALUES ('SE', 'SOFTWARE ENGINEERING', '-');
INSERT INTO `sfm`.`major` (`MajorCode`, `MajorName`, `Note`) VALUES ('SB', 'School For Business', '-');
INSERT INTO `sfm`.`major` (`MajorCode`, `MajorName`, `Note`) VALUES ('IA', 'IA', '-');


INSERT INTO `sfm`.`student_status` (`StatusName`, `Note`) VALUES ('HD', '-');
INSERT INTO `sfm`.`student_status` (`StatusName`, `Note`) VALUES ('HL', '-');



