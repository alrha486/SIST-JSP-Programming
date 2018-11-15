DROP TABLE Member;

CREATE SEQUENCE member_seq
	MAXVALUE 9999
	NOCYCLE

CREATE TABLE Member
(
	idx			NUMBER(4)        NOT NULL,
	userid		VARCHAR2(20) 	NOT NULL,
	passwd      VARCHAR2(20)	NOT NULL,
	username   VARCHAR2(20)	NOT NULL ,
	email         VARCHAR2(100)	NOT NULL ,
	regdate 		DATE				NOT NULL,
	zipcode   	CHAR(7),
	address1    VARCHAR2(200),
	address2    VARCHAR2(100),
	CONSTRAINT member_userid_pk PRIMARY KEY(userid)	
)

CREATE OR REPLACE PROCEDURE member_insert
(
	userid		IN		menber_userid%TYPE,
	passwd   	IN		menber_passwd%TYPE,
	username	IN		menber_username%TYPE,
	email			IN		menber_email%TYPE,
	zipcode		IN		menber_zipcode%TYPE,
	address1	IN		menber_address1%TYPE,
	address2	IN		menber_address2%TYPE
)
IS 
BEGIN
	INSERT INTO Member(idx,userid,passwd,username,email,regdate, zipcode,address1,address2)
	VALUES(member_seq.NEXTVAL, userid, passwd, username, email, SYSDATE, zipcode, address1, address2);
	COMMIT;
END; 


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


