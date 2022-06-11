
-- 회원정보


CREATE TABLE guest (
	guestNum NUMBER(5) NOT NULL,
	guestName VARCHAR2(20) NULL,
	guestID VARCHAR2(20) NULL,
	guestPwd VARCHAR2(20) NULL,
	guestGender VARCHAR2(20) NULL,
	guestBirth VARCHAR2(50) NULL,
	guestTel VARCHAR2(13) NULL,
	guestEmail varchar2(20) NULL
);

-- 회원정보
ALTER TABLE guest
	ADD CONSTRAINT PK_guest -- 회원정보 기본키
	PRIMARY KEY (
	guestNum -- 사용자번호
	);

-- 장바구니
CREATE TABLE basket (
	basketNum NUMBER(5) NOT NULL,
	guestNum NUMBER(5) NULL,
	roomNum NUMBER(5) NULL,
	buildingNum NUMBER(5) NULL,
	startDate DATE NULL,
	endDate DATE NULL,
    totalPrice NUMBER(8) NULL
);

-- 장바구니
ALTER TABLE basket
	ADD CONSTRAINT PK_basket -- 장바구니 기본키
	PRIMARY KEY (
	basketNum -- 장바구니key
	);

-- 숙소정보
CREATE TABLE building (
	buildingNum NUMBER(5) NOT NULL,
	buildingName VARCHAR2(20) NULL,
	buildingLoc VARCHAR2(30) NULL,
	buildingDesc VARCHAR2(200) NULL,
	buildingKW VARCHAR2(20) NULL,
	buildingKind NUMBER(5) NULL,
	buildingStar NUMBER(5) NULL,
	buildingCI VARCHAR2(10) NULL,
	buildingCO VARCHAR2(10) NULL
);

-- 숙소정보
ALTER TABLE building
	ADD CONSTRAINT PK_building -- 숙소정보 기본키
	PRIMARY KEY (
	buildingNum -- 숙소고유번호
	);

-- 후기
CREATE TABLE review (
	reviewNum NUMBER(5) NOT NULL,
	buildingNum NUMBER(5) NULL,
	guestNum NUMBER(5) NULL,
	created date null,
	reviewComment VARCHAR2(200) NULL,
	reviewStar NUMBER(20) NULL
);

-- 후기
ALTER TABLE review
	ADD CONSTRAINT PK_review -- 후기 기본키
	PRIMARY KEY (
	reviewNum -- 후기key
	);

-- 방정보
CREATE TABLE room (
	roomNum NUMBER(5) NOT NULL,
	roomName VARCHAR2(20) NULL,
	roomPrice NUMBER(10) NULL,
	roomPeople NUMBER(5) NULL,
	roomOption VARCHAR2(30) NULL,
	buildingNum NUMBER(5) NULL
);

-- 방정보
ALTER TABLE room
	ADD CONSTRAINT PK_room
	PRIMARY KEY (
	roomNum -- 방고유번호
	);

-- 결제정보
CREATE TABLE buy (
	buyNum NUMBER(5) NOT NULL,
	buyCase VARCHAR2(20) NULL,
	guestNum NUMBER(5) NULL,
	roomNum NUMBER(5) NULL,
	buildingNum NUMBER(5) NULL,
	startDate DATE NULL,
	endDate DATE NULL,
	totalPrice NUMBER(8) NULL
);

-- 결제정보
ALTER TABLE buy
	ADD CONSTRAINT PK_buy
	PRIMARY KEY (
	buyNum -- 결제key
	);

-- 장바구니
ALTER TABLE basket
	ADD CONSTRAINT FK_guest_TO_basket 
	FOREIGN KEY (
	guestNum -- 사용자번호
	)
	REFERENCES guest ( -- 회원정보
	guestNum -- 사용자번호
	);
	

-- 장바구니
ALTER TABLE basket
	ADD CONSTRAINT FK_room_TO_basket
	FOREIGN KEY (
	roomNum -- 방고유번호
	)
	REFERENCES room ( -- 방정보
	roomNum -- 방고유번호
	);

-- 장바구니
ALTER TABLE basket
	ADD CONSTRAINT FK_building_TO_basket 
	FOREIGN KEY (
	buildingNum -- 숙소고유번호
	)
	REFERENCES building ( -- 숙소정보
	buildingNum -- 숙소고유번호
	);

-- 후기
ALTER TABLE review
	ADD CONSTRAINT FK_guest_TO_review 
	FOREIGN KEY (
	guestNum -- 사용자번호
	)
	REFERENCES guest ( -- 회원정보
	guestNum -- 사용자번호
	);

-- 후기
ALTER TABLE review
	ADD CONSTRAINT FK_building_TO_review 
	FOREIGN KEY (
	buildingNum -- 숙소고유번호
	)
	REFERENCES building ( -- 숙소정보
	buildingNum -- 숙소고유번호
	);

-- 방정보
ALTER TABLE room
	ADD CONSTRAINT FK_building_TO_room 
	FOREIGN KEY (
	buildingNum -- 숙소고유번호
	)
	REFERENCES building ( -- 숙소정보
	buildingNum -- 숙소고유번호
	);

-- 결제정보
ALTER TABLE buy
	ADD CONSTRAINT FK_guest_TO_buy 
	FOREIGN KEY (
	guestNum -- 사용자번호
	)
	REFERENCES guest ( -- 회원정보
	guestNum -- 사용자번호
	);

-- 결제정보
ALTER TABLE buy
	ADD CONSTRAINT FK_room_TO_buy 
	FOREIGN KEY (
	roomNum -- 방고유번호
	)
	REFERENCES room ( -- 방정보
	roomNum -- 방고유번호
	);

-- 결제정보
ALTER TABLE buy
	ADD CONSTRAINT FK_building_TO_buy 
	FOREIGN KEY (
	buildingNum -- 숙소고유번호
	)
	REFERENCES building ( -- 숙소정보
	buildingNum -- 숙소고유번호
	);

alter table building modify BUILDINGNAME VARCHAR2(200);
alter table building modify BUILDINGSTAR NUMBER(*,1);
alter table review rename column created to reviewCreated;

alter table building modify BUILDINGLOC VARCHAR2(100);
alter table building modify BUILDINGDESC VARCHAR2(4000);
alter table building modify BUILDINGKW VARCHAR2(100);

alter table ROOM modify ROOMNAME VARCHAR2(200);
alter table ROOM modify ROOMOPTION VARCHAR2(4000);
alter table REVIEW modify REVIEWCOMMENT VARCHAR2(4000);

commit;

select * from TAB;


desc BASKET;
desc BUILDING;
desc BUY;
desc GUEST;
desc REVIEW;
desc ROOM;
