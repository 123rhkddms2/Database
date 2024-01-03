#날짜 : 2024/01/02
#이름 : 김광은
#내용 : 1장 데이터베이스 생성과 사용자 관리

#실습 1-1
CREATE DATABASE `StudyDB`;
DROP DATABASE `StudyDB2`;



#실습 1-2
CREATE USER '123rhkddms2'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `StudyDB2`.* TO '123rhkddms2'@'%';
FLUSH PRIVILEGES;

#실습 1-3
ALTER USER '123rhkddms2'@'%' IDENTIFIED BY 'abc1234';
DROP USER '123rhkddms2'@'%';
FLUSH PRIVILEGES; 