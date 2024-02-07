use quietnet;
CREATE TABLE comment (
    cId INT NOT NULL AUTO_INCREMENT,
    cContent VARCHAR(1000) NOT NULL,
    cPostId INT NOT NULL,
    cUserId INT NOT NULL,
    cDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (cId),
    FOREIGN KEY (cPostId) REFERENCES post(pId),
    FOREIGN KEY (cUserId) REFERENCES user(uId)
);

select * from comment;
-- delete from comment where cId != 0;