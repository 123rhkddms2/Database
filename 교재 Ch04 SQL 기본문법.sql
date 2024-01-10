#손코딩 p159
USE market_db;
CREATE TABLE hongong4 (
tinyint_col 	TINYINT,
smallint_col 	SMALLINT,
int_col			INT,
bigint_col 		BIGINT);

#손코딩 p160
INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 9000000000000000000);

INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 90000000000000000000);		#오류 발생(범위 넘어섬)

#손코딩 p164
CREATE TABLE big_table(
	data1 CHAR(256),
    data2 VARCHAR(16384));														#오류 발생(열의 길이 범위 넘어섬)

CREATE DATABASE `Bank`;
CREATE USER 'bank'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `Bank`.* TO 'bank'@'%';
GRANT ALL PRIVILEGES ON `Bank`.* TO 'chhak'@'%';
GRANT ALL PRIVILEGES ON `Shop`.* TO 'chhak'@'%';
FLUSH PRIVILEGES;





#손코딩 p165
CREATE DATABASE `netflix_db`;
CREATE USER 'netflix_db'@'%' identified by '1234';
GRANT ALL PRIVILEGES ON `Bank`.* TO 'netflix_db'@'%';
GRANT ALL PRIVILEGES ON `Bank`.* TO '123rhkddms2'@'%';
FLUSH privileges;
USE netflix_db;
CREATE TABLE MOVIE
	(movie_id		INT,
     movie_title	VARCHAR(30),
     movie_director VARCHAR(20),
     movie_star		VARCHAR(20),
     movie_script	LONGTEXT,
     movie_film		LONGBLOB
     )

#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16
#손코딩 p16