CREATE TABLE `quietnet`.`likes` (
  `lId` INT NOT NULL AUTO_INCREMENT,
  `lPostid` INT NOT NULL,
  `lUserid` INT NOT NULL,
  PRIMARY KEY (`lId`),
  INDEX `lPostid_idx` (`lPostid` ASC) VISIBLE,
  INDEX `lUserid_idx` (`lUserid` ASC) VISIBLE,
  CONSTRAINT `lPostid`
    FOREIGN KEY (`lPostid`)
    REFERENCES `quietnet`.`post` (`pId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `lUserid`
    FOREIGN KEY (`lUserid`)
    REFERENCES `quietnet`.`user` (`uId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


ALTER TABLE `likes`
ADD COLUMN `lDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER `lUserid`;

INSERT INTO `quietnet`.`likes` (`lPostid`, `lUserid`) VALUES ('21', '6');
INSERT INTO `quietnet`.`likes` (`lPostid`, `lUserid`) VALUES ('8', '9');
INSERT INTO `quietnet`.`likes` (`lPostid`, `lUserid`) VALUES ('10', '13');
INSERT INTO `quietnet`.`likes` (`lPostid`, `lUserid`) VALUES ('7', '1');
select count(*) from likes where lPostid=10;


desc likes;
select * from likes;
select count(*) from likes where lPostid=10;
delete from likes where lUserid=2;