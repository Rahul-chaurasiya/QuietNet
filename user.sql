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
select * from quietnet.user ;
-- delete from user where uId = ;
INSERT into user (uId,uNumber, ubasicname, uName, uEmail, uGender, uPassword, uPic) VALUES (10,'234092380545', 'Shubham', 'sh092u1', 'shubham@gmail.com', 'Male', '123', 'default.png');
SELECT uGender FROM user GROUP BY uGender;
SELECT uGender, COUNT(*) AS gender_type FROM user GROUP BY uGender;
UPDATE user SET uNumber = 24243, uGender = 'Female', uPassword = '1234', uPic = 'man (2).png', uBio = 'A teacher, also called a schoolteacher or formally an educator, is a person who helps students to acquire knowledge, competence, or virtue, via the practice of teaching.', uOccupation = 'Teacher' WHERE (uName = 'monkey2312');


-- ALTER TABLE `quietnet`.`user` 
-- DROP COLUMN `uOccupation`,
-- DROP COLUMN `uBio`;

INSERT INTO user (uNumber, ubasicname, uName, uEmail, uGender, uPassword, uPic, uBio, uOccupation)
VALUES 
('9876543210', 'Jennifer', 'jen123', 'jennifer@example.com', 'Female', '123', 'default.png', 'Passionate about fitness and health, encouraging a balanced lifestyle.', 'Fitness Trainer'),
('1234567890', 'Alex', 'al123', 'alex@example.com', 'Male', '123', 'default.png', 'A tech enthusiast and software developer exploring new technologies.', 'Software Developer'),
('4567890123', 'Lily', 'li123', 'lily@example.com', 'Female', '123', 'default.png', 'An avid reader who enjoys exploring different genres of literature.', 'Librarian'),
('7890123456', 'Charlie', 'ch123', 'charlie@example.com', 'Male', '123', 'default.png', 'A musician, passionate about playing various musical instruments.', 'Musician'),
('1111111111', 'Ella', 'el123', 'ella@example.com', 'Female', '123', 'default.png', 'An aspiring fashion designer with a flair for creativity and style.', 'Fashion Designer'),
('2222222222', 'Jack', 'ja123', 'jack@example.com', 'Male', '123', 'default.png', 'An adventure enthusiast who loves exploring new places and cultures.', 'Travel Blogger'),
('3333333333', 'Sophie', 'so123', 'sophie@example.com', 'Female', '123', 'default.png', 'A chef experimenting with flavors and creating culinary delights.', 'Chef'),
('4444444444', 'Max', 'ma123', 'max@example.com', 'Male', '123', 'default.png', 'An animal lover advocating for animal welfare and conservation.', 'Animal Rights Activist'),
('5555555555', 'Lucy', 'lu123', 'lucy@example.com', 'Female', '123', 'default.png', 'An environmentalist passionate about preserving nature and wildlife.', 'Environmental Scientist'),
('6666666666', 'Owen', 'ow123', 'owen@example.com', 'Male', '123', 'default.png', 'A sports enthusiast and coach motivating individuals towards fitness goals.', 'Sports Coach');
