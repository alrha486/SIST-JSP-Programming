DROP TABLE Member;

CREATE SEQUENCE member_seq
	MAXVALUE 9999
	NOCYCLE

	--- 멤버 테이블
CREATE TABLE Member
(
	idx			NUMBER(4)        NOT NULL,
	userid		VARCHAR2(20) 	,
	passwd      VARCHAR2(20)	,
	username   VARCHAR2(20)	NOT NULL,
	usernickname VARCHAR2(20) NOT NULL,
	email         VARCHAR2(100)	NOT NULL ,
	tel             VARCHAR2(20)   NOT NULL,
	regdate 		DATE				NOT NULL,
	zipcode   	CHAR(7),
	address1    VARCHAR2(200),
	address2    VARCHAR2(100),
	CONSTRAINT member_idx_pk PRIMARY KEY(idx)	
)


----일반 회원가입 
CREATE OR REPLACE PROCEDURE member_insert
(
	userid		IN		member.userid%TYPE,
	passwd   	IN		member.passwd%TYPE,
	username	IN		member.username%TYPE,
	usernickname IN member.usernickname%TYPE,
	email			IN		member.email%TYPE,
	tel            IN    member.tel%TYPE,
	zipcode		IN		member.zipcode%TYPE,
	address1	IN		member.address1%TYPE,
	address2	IN		member.address2%TYPE
)
IS 
BEGIN
	INSERT INTO Member(idx,userid,passwd,username,usernickname,email,tel, regdate, zipcode,address1,address2)
	VALUES(member_seq.NEXTVAL, userid, passwd, username, usernickname, email, tel,  SYSDATE, zipcode, address1, address2);
	COMMIT;
END; 


----카카오,네이버 전용 회원가입
CREATE OR REPLACE PROCEDURE kakao_insert
(
	userid        IN    member.userid%TYPE,
	username	IN		member.username%TYPE,
	usernickname IN member.usernickname%TYPE,
	email			IN		member.email%TYPE,
	tel         IN    member.tel%TYPE
)
IS 
BEGIN
	INSERT INTO Member(idx,userid,username,usernickname, email,tel, regdate,tel)
	VALUES(member_seq.NEXTVAL, userid, username, usernickname, email, tel, SYSDATE,tel);
	COMMIT;
END; 

-- 로그인 체크
CREATE OR REPLACE procedure member_login
(
	p_userid			IN 	member.userid%TYPE,
	login_record 	OUT SYS_REFCURSOR
)
AS 
BEGIN
	OPEN login_record FOR
	SELECT userid, passwd
	FROM Member 
	WHERE userid = p_userid;
END; 


--회원 ID로 전체정보 조회
CREATE OR REPLACE procedure member_select
(
	p_userid	 			IN 		member.userid%TYPE,
	member_record  OUT 		SYS_REFCURSOR
)
AS
BEGIN
	OPEN member_record FOR
	SELECT * 
	FROM Member
	WHERE userid = p_userid;
END; 

--회원 email로 전체정보 조회
CREATE OR REPLACE procedure member_select1
(
	p_useremail 			IN 		member.email%TYPE,
	member_record1  OUT 		SYS_REFCURSOR
)
AS
BEGIN
	OPEN member_record1 FOR
	SELECT * 
	FROM Member
	WHERE email = p_useremail;
END; 

CREATE OR REPLACE procedure member_delete
(
	p_userid 			IN 		member.userid%TYPE
)
IS
BEGIN
	DELETE FROM Member
	WHERE userid = p_userid;
	COMMIT;
END; 

CREATE OR REPLACE procedure member_update
(
	p_userid			IN		menber_userid%TYPE,
	p_email			IN		menber_email%TYPE,
	p_zipcode		IN		menber_zipcode%TYPE,
	p_address1		IN		menber_address1%TYPE,
	p_address2		IN		menber_address2%TYPE
)
IS 
BEGIN
	UPDATE Member
	SET email = p_email, zipcode = p_zipcode, 
		   address1=p_address1, address2=p_address2
	WHERE userid = p_userid;
	COMMIT;
END; 


