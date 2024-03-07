CREATE TABLE `fileTest`(

	`fno` INT AUTO_INCREMENT PRIMARY KEY,
	`title` VARCHAR(100),
	`oName` VARCHAR(100),
	`sName` VARCHAR(100),
	`rdate` DATETIME
);StudyDB

SET foreign_key_checks = 0;

SELECT * FROM `Article` AS a
LEFT JOIN `File` AS b
ON a.`no` = b.`ano`
WHERE `no`=262630

SELECT a.*, b.`nick` FROM `Article` AS a
JOIN `User` AS b ON a.writer = b.uid
WHERE `parent`=0

SELECT COUNT(*) FROM `Article` WHERE `parent`=0

SELECT `sname` FROM `File` WHERE `fno`=?;