CREATE TABLE Member
(
	userid		VARCHAR2(20),
	passwd      VARCHAR2(20)	NOT NULL,
	username   VARCHAR2(20)	NOT NULL ,
	email         VARCHAR2(100)	NOT NULL ,
	zipcode   	CHAR(6),
	address1    VARCHAR2(200),
	address2    VARCHAR2(100),
	CONSTRAINT member_userid_pk PRIMARY KEY(userid)	
)