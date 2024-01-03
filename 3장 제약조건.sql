#날짜 : 2024/01/03
#이름 : 김광은
#내용 : 2장 제약조건

#실습 3-1
CREATE TABLE `User2`(
	`uid`	varchar(10) primary key,
    `name`	varchar(10),
    `birth`	char(10),
    `addr`	varchar(50)
    );
insert into `user2` values ('A101', '김유신', '1968-05-09', '경남 김해시');
insert into `user2` values ('A102', '김춘추', '1972-11-12', '경남 경주시');
insert into `user2` values ('A103', '장보고', '1978-03-01', '전남 완도군');
insert into `user2` values ('A105', '강감찬', '1979-08-16', '서울시 관악구');
insert into `user2` values ('A106', '이순신', '1981-05-23', '부산시 진구');
drop table `user2`;

#실습 3-2
CREATE TABLE `User3` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`birth` CHAR(10),
	`hp` CHAR(13) unique,
	`addr` VARCHAR(50)
);
insert into `user3` values ('A101', '김유신', '1968-05-09', '010-1234-1111', '경남 김해시');
insert into `user3` values ('A102', '김춘추', '1972-11-12', '010-1234-2222', '경남 경주시');
insert into `user3` values ('A103', '장보고', '1978-03-01', '010-1234-3333', '전남 완도군');
insert into `user3` values ('A104', '강감찬', '1979-08-16', '010-1234-4444', '서울시 관악구');
insert into `user3` values ('A105', '이순신', '1981-05-23', '010-1234-5555', '부산시 진구');
insert into `user3` values ('A106', '안중근', '1981-05-21', null, '부산시 진구');
drop table `user3`;

#실습 3-3
CREATE TABLE `User4` (
	`cid` 		VARCHAR(10) PRIMARY KEY,
	`name` 		VARCHAR(10),
	`hp` 		CHAR(13) unique,
    `parent`	constraint foreign key references
);

insert into `user4` values ('C101', '김철수', '010-1234-1001');
insert into `user4` values ('C102', '김영희', '010-1234-1002');
insert into `user4` values ('C103', '강철수', '010-1234-1003');
insert into `user4` values ('C104', '이철수', '010-1234-1004');

SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`, `age` FROM `User1`;

delete from `user4`;





#실습 3-4
#실습 3-5
