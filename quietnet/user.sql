create database quietnet;

use quietnet;                                     
CREATE TABLE `quietnet`.`user` (
  `uId` INT NOT NULL AUTO_INCREMENT,
  `uNumber` VARCHAR(45) NOT NULL,
  `ubasicname` VARCHAR(45) NOT NULL,
  `uName` VARCHAR(45) NOT NULL,
  `uEmail` VARCHAR(85) NOT NULL,
  `uGender` VARCHAR(45) NULL,
  `uPassword` VARCHAR(45) NOT NULL,
  `uPic` VARCHAR(55) NULL DEFAULT 'default.png',
  PRIMARY KEY (`uId`),
  UNIQUE INDEX `uName_UNIQUE` (`uName` ASC) VISIBLE);

ALTER TABLE `user`
ADD COLUMN `uBio` VARCHAR(300) DEFAULT 'xxxx' AFTER `uDate`;

ALTER TABLE `user`
ADD COLUMN `uOccupation` VARCHAR(50) DEFAULT 'xxxx' AFTER `uBio`;

ALTER TABLE `user`
ADD COLUMN `uDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER `upic`;
-- ALTER TABLE `user` DROP COLUMN `uDate`;

ALTER TABLE `quietnet`.`user`
  ADD UNIQUE INDEX `uEmail_UNIQUE` (`uEmail` ASC) VISIBLE ;

desc user;
select * from user where uEmail="abc@gmail.com" and uPassword="123";
select * from quietnet.user;
delete from user where uId = 3;
INSERT INTO user (uId,uNumber, ubasicname, uName, uEmail, uGender, uPassword, uPic) VALUES (10,'234092380545', 'Shubham', 'sh092u1', 'shubham@gmail.com', 'Male', '123', 'default.png');

SELECT uGender FROM user GROUP BY uGender;
SELECT uGender, COUNT(*) AS gender_type FROM user GROUP BY uGender;
UPDATE user SET uNumber = 24243, uGender = 'Female', uPassword = '1234', uPic = 'man (2).png', uBio = 'A teacher, also called a schoolteacher or formally an educator, is a person who helps students to acquire knowledge, competence, or virtue, via the practice of teaching.', uOccupation = 'Teacher' WHERE (uName = 'monkey2312');


ALTER TABLE `quietnet`.`user` 
DROP COLUMN `uOccupation`,
DROP COLUMN `uBio`;

