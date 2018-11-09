DROP TABLE train;
CREATE TABLE train
(
	code	CHAR(2)	PRIMARY KEY,  --열차코드
    tname	VARCHAR2(20) UNIQUE   --열차명
);
INSERT INTO train VALUES('TA', '새마을호');
INSERT INTO train VALUES('TB', '무궁화호');
INSERT INTO train VALUES('TC', '통일호');

DROP TABLE seat;
CREATE TABLE seat
(
	code	CHAR(2)	PRIMARY KEY,   --좌석코드
    sname	VARCHAR2(20) UNIQUE    --좌석명
);
INSERT INTO seat VALUES('SA', '특실');
INSERT INTO seat VALUES('SB', '1등칸');
INSERT INTO seat VALUES('SC', '보통칸');

DROP TABLE place;
CREATE TABLE place
(
	code	CHAR(2)	PRIMARY KEY,   --장소코드
    pname	VARCHAR(10),           --장소명
    kuri	NUMBER(4)              --거리
);
INSERT INTO place VALUES ('CA', '서울', 400);
INSERT INTO place VALUES ('CB', '부산', 50);
INSERT INTO place VALUES ('CC', '대구', 110);
INSERT INTO place VALUES ('CD', '광주', 180);

DROP TABLE price;
CREATE TABLE price
(
	id	number(1)	PRIMARY KEY,     --
    tname	VARCHAR2(20)	REFERENCES  train(tname),  --열차명
    sname	VARCHAR2(20)	REFERENCES  seat(sname),    --좌석명
    danga	NUMBER(3)                                   --km당 단가
);
INSERT INTO price VALUES(1, '새마을호', '특실', 80);
INSERT INTO price VALUES(2, '새마을호', '1등칸', 65);
INSERT INTO price VALUES(3, '새마을호', '보통칸', 50);
INSERT INTO price VALUES(4, '무궁화호', '특실', 60);
INSERT INTO price VALUES(5, '무궁화호', '1등칸', 55);
INSERT INTO price VALUES(6, '무궁화호', '보통칸', 40);
INSERT INTO price VALUES(7, '통일호', '보통칸', 30);

DROP TABLE premium;
CREATE TABLE premium
(
	code	char(2)	PRIMARY KEY,   --할증코드
    kind	VARCHAR2(20),          --종류
    rate	NUMBER(3,1)              --할인율
);
INSERT INTO premium VALUES('P0', '일반', 0.0);
INSERT INTO premium VALUES('P1', '소인', 0.5);
INSERT INTO premium VALUES('P2', '군인', 0.3);
INSERT INTO premium VALUES('P3', '장애인', 0.8);

DROP TABLE Customer;
CREATE TABLE Customer
(
	id	NUMBER(4)	PRIMARY KEY,   --
    tscode	char(4),               --열차좌석코드
    pcode	CHAR(2),               --장소코드
    jumin1	CHAR(6),               --주민번호1
    jumin2	CHAR(7),               --주민번호2
    ppcode	CHAR(2),               --할증코드
    region	VARCHAR2(10),          --지역
    gender	VARCHAR2(5),           --성별
    tname	VARCHAR2(20),          --열차명
    sname	VARCHAR2(20),          --좌석명
    kind	VARCHAR2(20),          --할증종류
    price	NUMBER(5),              --할인액
    charge	NUMBER(10)              --차비
);

CREATE SEQUENCE customer_id_seq
	INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999;