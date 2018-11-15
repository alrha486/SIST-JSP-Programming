CREATE SEQUENCE board_idx_seq
START WITH 1
MAXVALUE 999999
NOCYCLE;

CREATE TABLE Gesipan
(
	idx			NUMBER(6),
	name			VARCHAR2(20)	NOT NULL,
	passwd		VARCHAR2(20)	NOT NULL,
	email			VARCHAR2(50) 	NOT NULL,
	title			VARCHAR2(100) 	NOT NULL,
	contents		LONG 				NOT NULL, /*가변 2G의 LONG*/
	writedate	DATE   				NOT NULL	,
	readnum 	NUMBER(4)		NOT NULL, /*조회수*/
	filename		VARCHAR2(200),	 /*파일의 이름(경로포함)*/
	grp			NUMBER(5)		NOT NULL, /*그룹 번호*/
	lev			NUMBER(1)		NOT NULL , /*덧글이 몇개있는지 */
	step			NUMBER(4)		NOT NULL,
	CONSTRAINT gesipan_idx_pk 	PRIMARY KEY(idx)
)

CREATE INDEX idx_gisipan_name
ON Gesipan(name);
CREATE INDEX idx_gesipan_title
ON Gesipan(title);