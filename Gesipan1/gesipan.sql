CREATE SEQUENCE board_idx_seq
START WITH 1
MAXVALUE 999999
NOCYCLE;

drop SEQUENCE board_idx_seq;

CREATE TABLE Gesipan
(
	idx NUMBER(6),
	name VARCHAR2(20) NOT NULL,
	passwd VARCHAR2(20) NOT NULL,
	email VARCHAR2(50) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	contents LONG NOT NULL,
	writedate DATE NOT NULL,
	readnum NUMBER(4) NOT NULL,
	filename VARCHAR2(200),
	grp NUMBER(5) NOT NULL,
	lev NUMBER(1) NOT NULL,
	step NUMBER(4) NOT NULL,
	CONSTRAINT gesipan_idx_pk PRIMARY KEY(idx)
);

CREATE INDEX idx_gesipan_name
ON gesipan(name);

CREATE INDEX idx_gesipan_title
ON gesipan(title);



CREATE OR REPLACE procedure board_insert
(
	p_name IN gesipan.name%TYPE,
	p_passwd IN gesipan.passwd%TYPE,
	p_email IN gesipan.email%TYPE,
	p_title IN gesipan.title%TYPE,
	p_contents IN gesipan.contents%TYPE,
	p_filename IN gesipan.filename%TYPE
)
IS
BEGIN
	INSERT INTO Gesipan
	VALUES (board_idx_seq.NEXTVAL, p_name, p_passwd, p_email, p_title, p_contents, SYSDATE, 0, p_filename, board_idx_seq.CURRVAL, 0, 0);
	COMMIT;
END; 

truncate table gesipan;


CREATE OR REPLACE procedure board_selectAll
(
	board_record OUT SYS_REFCURSOR
)
AS
BEGIN
	OPEN board_record FOR
	SELECT idx, name, email, title, filename,writedate, readnum,grp,lev,step
	FROM GESIPAN ORDER BY grp DESC, step ASC;
END;



CREATE OR REPLACE procedure board_select
(
	p_idx IN gesipan.idx%TYPE,
	board_record OUT SYS_REFCURSOR
)
AS
BEGIN
	OPEN board_record FOR
	SELECT * FROM GESIPAN 
	WHERE idx = p_idx;
END;


--조회수 증가를 위한 Update
CREATE OR REPLACE procedure board_readnum_update
(
	p_idx IN gesipan.idx%TYPE
)
IS
 	p_readnum gesipan.readnum%TYPE;
BEGIN
	SELECT readnum INTO p_readnum
	FROM Gesipan WHERE idx = p_idx;
	
	UPDATE Gesipan SET readnum = p_readnum + 1
	WHERE idx = p_idx;
	COMMIT;
END;


CREATE OR REPLACE procedure board_delete
(
	p_idx IN gesipan.idx%TYPE
)
IS
BEGIN
	DELETE FROM Gesipan
	WHERE idx = p_idx;
	COMMIT;
END;

CREATE OR REPLACE procedure board_select_passwd
(
	p_idx IN Gesipan.idx%TYPE,
	dbpasswd OUT Gesipan.passwd%TYPE
)
IS
BEGIN
	SELECT passwd INTO dbpasswd
	FROM Gesipan
	WHERE idx = p_idx;
END; 

CREATE OR REPLACE procedure board_update
(
	p_email 		IN gesipan.email%TYPE,
	p_title 		IN gesipan.title%TYPE,
	p_contents	IN gesipan.contents%TYPE,	
	p_idx			IN gesipan.idx%TYPE
)
IS
BEGIN
	UPDATE Gesipan 
		SET email = p_email, title=p_title, contents=p_contents
	WHERE idx = p_idx;
	COMMIT;
END; 

--답변 처리를 위한 각 레코드의 step 업데이트,
--새로 들어오는 글의 step과 같거나 큰 step들 1씩증가
CREATE OR REPLACE procedure board_update_step
(
	p_grp 	IN Gesipan.grp%TYPE,
	p_step	IN Gesipan.step%TYPE
)
IS 
BEGIN
	UPDATE Gesipan
	SET step = step +1
	WHERE grp = p_grp AND step > p_step;
	COMMIT;
END; 


CREATE OR REPLACE PROCEDURE board_insert
(
   p_name           IN         gesipan.name%TYPE,
   p_passwd           IN         gesipan.passwd%TYPE,
   p_email           IN         gesipan.email%TYPE,
   p_title           IN         gesipan.title%TYPE,
   p_contents           IN         gesipan.contents%TYPE,
   p_filename           IN         gesipan.filename%TYPE,
   p_grp            IN            gesipan.grp%TYPE,
   p_lev         IN            gesipan.lev%TYPE,
   p_step         IN            gesipan.step%TYPE
)
IS
BEGIN
   INSERT INTO Gesipan
   VALUES (board_idx_seq.NEXTVAL, p_name, p_passwd, p_email, p_title, p_contents,
                  SYSDATE, 0, p_filename,p_grp,p_lev, p_step);
   COMMIT;
END;


INSERT INTO Gesipan(idx,name,passwd,email,title,contents,filename,grp,lev,step,writedate,readnum) 
VALUES(board_idx_seq.NEXTVAL,'호날두','123','ronaldo7','I am Ronaldo','Cris Ronaldo','',board_idx_seq.CURRVAL,0,0,SYSDATE,0);



CREATE OR REPLACE PROCEDURE board_select_filename
(
	p_idx 	IN gesipan.idx%TYPE,
	p_filename OUT gesipan.filename%TYPE
)
IS
BEGIN
	SELECT filename INTO p_filename
	FROM Gesipan
	WHERE idx = p_idx;
END; 





















