#날짜 : 2024/01/11
#이름 : 김광은
#내용 : SQL 연습문제4

#실습 4-1
CREATE DATABASE ``;
CREATE USER ''@'%' identified by '1234';
GRANT ALL PRIVILEGES ON `College`.* TO 'college'@'%';
GRANT ALL PRIVILEGES ON `College`.* TO 'chhak'@'%';
FLUSH privileges;