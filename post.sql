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
SELECT pTitle FROM post GROUP BY pTitle;
-- delete from post where pId != 0;
select * from post where pUserid = 1;


INSERT INTO quietnet.post (pTitle, pDescription, pUserid) VALUES
('Education', 'Discover the latest trends and advancements in education technology.', 10),
('Education', 'Explore the impact of online learning on traditional educational systems.', 11),
('Education', 'Learn about innovative teaching methods and approaches to student engagement.', 12),
('Education', 'Discuss the importance of lifelong learning and skill development in the modern world.', 23),
('Education', 'Share insights into the challenges and opportunities in the field of education.', 24),
('Crime', 'Examine the root causes of crime and strategies for crime prevention.', 25),
('Crime', 'Investigate high-profile criminal cases and the process of criminal justice.', 26),
('India', 'Celebrate the rich cultural heritage and diversity of India.', 27),
('India', 'Discover lesser-known facts and hidden gems of Indian history and culture.', 28),
('India', 'Explore the latest developments and news from various regions of India.', 29),
('Sports', 'Follow the latest updates and scores from the world of sports.', 30),
('Sports', 'Discuss the impact of sports on physical and mental well-being.', 31),
('Cricket', 'Get insights into the strategies and tactics of cricket teams around the world.', 32),
('Cricket', 'Celebrate memorable moments and legendary players in cricket history.', 10),
('Hospital', 'Learn about the latest advancements in medical technology and healthcare.', 11),
('Hospital', 'Explore the challenges and innovations in hospital management and patient care.', 12),
('Courses', 'Discover a wide range of online courses and skill development programs.', 23),
('University', 'Explore top universities and academic programs for higher education.', 24),
('Computer Science', 'Stay updated with the latest trends and breakthroughs in computer science.', 25),
('Technology', 'Explore cutting-edge technology and its impact on society and industries.', 26),
('Mahabharat', 'Delve into the epic tale of Mahabharat and its timeless lessons.', 27),
('Religion', 'Reflect on the diversity of religious beliefs and practices around the world.', 28),
('Motivation', 'Find inspiration and motivation to achieve your goals and dreams.', 29),
('Examination', 'Prepare for exams with useful tips, study resources, and exam strategies.', 30);

