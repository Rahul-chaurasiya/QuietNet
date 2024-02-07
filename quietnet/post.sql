CREATE TABLE `quietnet`.`post` (
  `pId` INT NOT NULL AUTO_INCREMENT,
  `pTitle` VARCHAR(100) NOT NULL,
  `pDescription` VARCHAR(800) NOT NULL,
  `pPic` VARCHAR(45) NULL,
  `pUserid` INT NOT NULL,
  PRIMARY KEY (`pId`),
  INDEX `pUserid_idx` (`pUserid` ASC) VISIBLE,
  CONSTRAINT `pUserid`
    FOREIGN KEY (`pUserid`)
    REFERENCES `quietnet`.`user` (`uId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

desc post;
ALTER TABLE `post`
ADD COLUMN `pDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER `pPic`;

select * from post order by pId desc;
select * from post where pTitle="teaching";
select * from user where uid=(select pUserid from post where pId=4);
select * from post;
select * from post where pId=1;

INSERT INTO post (pTitle, pDescription, pUserid) VALUES ("Sport","Sport pertains to any form of physical activity or game,[1] often competitive and organized, that aims to use, maintain, or improve physical ability and skills while providing enjoyment to participants and, in some cases, entertainment to spectators",11);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('Teaching', 'Teaching is great thing all of us need to education and by teaching we also improve our self knowledge.', 10);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('Education', 'Exploring the different aspects of education and its role in society.', 6);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('Study', 'Tips and strategies for effective studying and academic success.', 7);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('Crime', 'An analysis of crime rates and its impact on communities.', 8);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('India', 'Exploring the rich culture, history, and diversity of India.', 1);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('Business', 'Insights into the world of business, entrepreneurship, and innovation.', 12);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('Water', 'The importance of water conservation and sustainable water management.', 10);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('Cricket', 'A look at the popular sport of cricket and its impact on society.', 5);

INSERT INTO post (pTitle, pDescription, pUserid)
VALUES ('Sport', 'Exploring different sports and their influence on physical and mental well-being.', 9);

SELECT pTitle FROM post GROUP BY pTitle;
delete from post where pId=23;


select * from post where pUserid = 1;
