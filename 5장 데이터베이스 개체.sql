#날짜 : 2024/01/08
#이름 : 김광은
#내용 : 제5장 데이터베이스 개체

##########################
# 인덱스
##########################

#실습 5-1
SHOW INDEX FROM `User1`;
SHOW INDEX FROM `User2`;
SHOW INDEX FROM `User3`;

#실습 5-2
CREATE INDEX `idx_user1_uid` ON `User1`(`uid`);
analyze table `user1`;

#실습 5-3
drop index `idx_user1_uid` ON `User1`;
##########################
# 뷰
##########################

#실습 5-4
CREATE VIEW `vw_user1` as (
	select `name`, `hp`, `age` from `user1`);

create view `vw_user4_age_under30` as (
	select * from `user4` where `age` < 30);
    
create view `vm_member_with_sales` as (
	select 
    a.`uid`	 	as `직원아이디`,
	b.`name` 	as `직원이름`,
	b.`pos` 	as `직급`,
	c.`name` 	as `부서명`,
	a.`year`	as `매출년도`,
	a.`month`	as `월`,
	a.`sale` 	as `매출액`
    from `sales` as a
    join `member` as b on a.uid=b.uid
    join `department` as c on b.dep = c.depno
    );
 
#실습 5-5
SELECT * FROM `vw_user1`;
#실습 5-6
drop view `vm_member_with_sales`;   


##########################
# 뷰
##########################

#실습 5-7
DELIMITER $$
CREATE PROCEDURE proc_test1()
BEGIN
	SELECT * FROM `Member`;
	SELECT * FROM `Department`;
END $$
DELIMITER ;

CALL proc_test1();



#실습 5-8
DELIMITER $$
CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
BEGIN
	SELECT * FROM `Member` WHERE `name`=_userName;
END $$
DELIMITER ;

CALL proc_test2('김유신');


DELIMITER $$
CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
BEGIN
	SELECT * FROM `Member` WHERE `pos`=_pos AND `dep`=_dep;
END $$
DELIMITER ;

CALL proc_test3('차장', 101);



DELIMITER $$
CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
BEGIN
	SELECT COUNT(*) INTO _count FROM `Member` WHERE `pos`=_pos ;
END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
SELECT CONCAT('_count : ', @_count)



#실습 5-9
delimiter $$
create procedure proc_test5(IN _name varchar(10))
begin
	declare userId varchar(10);
    select `uid` into userId from `Member` where `name` = _name;
    select * from `sales` where `uid`=userId;
END $$
DELIMITER ;

Call proc_test5('김유신');



delimiter $$
create procedure proc_test6()
begin
	declare num1 int;
	declare num2 int;
    
    set num1=1;
    set num2=2;
    
    if(num1>num2) then
		select 'num1이 num2보다 크다.' as `결과2`;
	else
		select 'num1이 num2보다 작다.' as `결과2`;
	end if;
end $$
delimiter ;

call proc_test6();



delimiter $$
create procedure proc_test7()
begin 
	declare sum int;
	declare num int;
    
    set sum = 0;
    set num = 1;
    
    while(sum<=10) do
		set sum = sum + sum;
        set num = num + 1;
	end while;
    
    select sum as '1부터 10까지 합계';
end $$
delimiter ;

call proc_test7();
    





#실습 5-10

delimiter $$
create procedure proc_test8()
begin
	#변수 선언
    declare total int default 0;
    declare sale int;
    declare endOfRow boolean default false;
    
    #커서 선언 
    declare salesCursor Cursor for
		select `sale` from `sales`;
        
	#반복 조건
    declare CONTINUE HANDLER 
		FOR NOT FOUND SET endOfRow = TRUE;
	
    #커서 열기
    open salesCursor;
    
    cursor_loop: Loop
		fetch salescursor into sale;
        
        if endofrow then
			leave cursor_loop;
		end if;
        
        set total = total + sale;
	end loop;
    
    select total as '전체 합계';
    
    close salescursor;
end $$
delimiter ;

call proc_test8();


  
        
        

#실습 5-11

delimiter $$
	create function func_test1(_userid varchar(10)) returns int
    begin
		declare total int;
        
        select sum(`sale`) into total from `sales` where `uid`=_userid;
        
        return total;
	end $$
    
    delimiter ;

select func_test1('a101');

delimiter $$
	create function func_test2(_sale int) returns double
    begin
		declare bonus double;
	
    if(_sale>=100000) then
		set bonus = _sale * 0.1;
	else
		set bonus = _sale * 0.05;
	end if;
    
return bonus;
end $$

delimiter ;

select
`uid`,
`year`,
`month`,
`sale`, 
func_test2(`sale`) as `bonus`
from `sales`;












