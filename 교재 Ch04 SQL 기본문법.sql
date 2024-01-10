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

#손코딩 p165
CREATE DATABASE netflix_db;
USE netflix_db;
CREATE TABLE MOVIE
	(movie_id		INT,
     movie_title	VARCHAR(30),
     movie_director VARCHAR(20),
     movie_star		VARCHAR(20),
     movie_script	LONGTEXT,
     movie_film		LONGBLOB
     );

#손코딩 p167
USE market_db;
SET @myVar1 = 5 ;
SET @myVar2 = 4.25 ;

SELECT @myVar1;
SELECT @myVar1 + @myVar2 ;

SET @txt = '가수 이름 ==> ' ;
SET @height = 166 ;
SELECT @txt, mem_name FROM member WHERE height > @height ;

#손코딩 p168(오류 발생)
SET @count = 3;
SELECT mem_name, height FROM member ORDER BY height LIMIT @count;		

SET @count = 3;
PREPARE mySQL FROM 'SELECT mem_NAME, height FROM member ORDER By height LIMIT ?';
EXECUTE mySQL USING @count;

#손코딩 p169
SELECT AVG(price) AS '평균 가격' FROM buy;

SELECT CAST(AVG(price) AS SIGNED) '평균 가격' FROM buy ;
SELECT CONVERT(AVG(price), SIGNED) '평균 가격' FROM buy;

#손코딩 p170
SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022%12%12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR), 'X', CAST(amount AS CHAR), '=')
	'가격X수량', price*amount '구매액'
FROM buy;

#손코딩 p171
SELECT '100' + '200';

SELECT CONCAT('100', '200');

SELECT CONCAT(100, '200');
SELECT 100 + '200';

#손코딩 p177
USE market_db;
SELECT *
	FROM buy
    INNER JOIN member
    ON buy.mem_id = member.mem_id
WHERE buy.mem_id = 'GRL';

#손코딩 p179
SELECT * 
	FROM BUY
		INNER JOIN member
        ON buy.mem_id = member.mem_id;

SELECT mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처'			#(오류 발생)
	FROM buy
		INNER JOIN member
        ON buy.mem+id = member.mem_id;				

#손코딩 p180
SELECT buy.mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처'
	FROM buy
		INNER JOIN member
        ON buy.mem_id = member.mem_id;
        
#손코딩 p181
SELECT buy.mem_id, member.mem_name, buy.prod_name, member.addr,
				   CONCAT(member.phone1, member.phone2) '연락처'
	FROM buy
		INNER JOIN member
        ON buy.mem_id = member.mem_id;

SELECT B.mem_id, M.mem_name, B.prod_name, M. addr,
				 CONCAT(M.phone1, M.phone2) '연락처'
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id
	ORDER BY M.mem_id;
    
#손코딩 p183
SELECT DISTINCT M.mem_id, M.mem_name, M.addr
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id
	ORDER By M.mem_id;

#손코딩 p184
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
	FROM member M
		LEFT OUTER JOIN buy B
        ON M.mem_id = B.mem_id
	ORDER BY M.mem_id;

#손코딩 p185
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
	FROM buy B
		RIGHT OUTER JOIN member M
        ON M.mem_id = B.mem_id
	ORDER BY M.mem_id;
    
SELECT DISTINCT M.mem_id, B.prod_name, M.mem_name, M.addr
	FROM member M
		LEFT OUTER JOIN buy B
        ON M.mem_id = B.mem_id
	WHERE B.prod_name IS NULL
    ORDER BY M.mem_id;

#손코딩 p187
SELECT *
	FROM buy
		CROSS JOIN member;

#손코딩 p188
SELECT COUNT(*) "데이터 개수"
	FROM sakila.inventory
		CROSS JOIN world.city;

CREATE TABLE cross_table
	SELECT *
		FROM sakila.actor
			CROSS JOIN world.city;
SELECT * FROM cross_table LIMIT 5;
#손코딩 p16
#손코딩 p16
#손코딩 p16