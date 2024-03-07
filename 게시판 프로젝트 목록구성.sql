

INSERT INTO `Article` (`title`, `content`, `writer`, `regip`, `rdate`)
SELECT `title`, `content`, `writer`, `regip`, `rdate` FROM `Article`;



SELECT * FROM `Article` WHERE `no`=1;

DELETE FROM `Article` WHERE `no` > 5;

UPDATE `Article` SET `hit`= `hit` + 1 WHERE `no`=1;

SELECT 
	a.*,
	b.`nick`
FROM `Article` AS a
JOIN `User` AS b ON a.writer = b.uid
WHERE `parent`=0
ORDER BY `no` DESC
LIMIT 0, 10;

SELECT COUNT(*) FROM `Article` WHERE `parent`=0;

SELECT a.*, b.`nick` FROM `Article` AS a
JOIN `User` AS b ON a.writer = b.uid WHERE `parent`=?
ORDER BY `no` ASC;

ALTER TABLE `user` ADD COLUMN `sms` CHAR(1) AFTER `regip`;

SELECT * FROM `Article` WHERE `title` LIKE '%사과%';


SELECT a.*, b.`nick`
FROM `Article` AS a JOIN `User` AS b ON a.writer = b.uid
WHERE `parent`=0 AND (`title` LIKE '%니다%' OR 
ORDER BY `no` ASC;








