
-- ȸ������


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

-- ȸ������
ALTER TABLE guest
	ADD CONSTRAINT PK_guest -- ȸ������ �⺻Ű
	PRIMARY KEY (
	guestNum -- ����ڹ�ȣ
	);

-- ��ٱ���
CREATE TABLE basket (
	basketNum NUMBER(5) NOT NULL,
	guestNum NUMBER(5) NULL,
	roomNum NUMBER(5) NULL,
	buildingNum NUMBER(5) NULL,
	startDate DATE NULL,
	endDate DATE NULL,
    totalPrice NUMBER(8) NULL
);

-- ��ٱ���
ALTER TABLE basket
	ADD CONSTRAINT PK_basket -- ��ٱ��� �⺻Ű
	PRIMARY KEY (
	basketNum -- ��ٱ���key
	);

-- ��������
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

-- ��������
ALTER TABLE building
	ADD CONSTRAINT PK_building -- �������� �⺻Ű
	PRIMARY KEY (
	buildingNum -- ���Ұ�����ȣ
	);

-- �ı�
CREATE TABLE review (
	reviewNum NUMBER(5) NOT NULL,
	buildingNum NUMBER(5) NULL,
	guestNum NUMBER(5) NULL,
	created date null,
	reviewComment VARCHAR2(200) NULL,
	reviewStar NUMBER(20) NULL
);

-- �ı�
ALTER TABLE review
	ADD CONSTRAINT PK_review -- �ı� �⺻Ű
	PRIMARY KEY (
	reviewNum -- �ı�key
	);

-- ������
CREATE TABLE room (
	roomNum NUMBER(5) NOT NULL,
	roomName VARCHAR2(20) NULL,
	roomPrice NUMBER(10) NULL,
	roomPeople NUMBER(5) NULL,
	roomOption VARCHAR2(30) NULL,
	buildingNum NUMBER(5) NULL
);

-- ������
ALTER TABLE room
	ADD CONSTRAINT PK_room
	PRIMARY KEY (
	roomNum -- �������ȣ
	);

-- ��������
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

-- ��������
ALTER TABLE buy
	ADD CONSTRAINT PK_buy
	PRIMARY KEY (
	buyNum -- ����key
	);

-- ��ٱ���
ALTER TABLE basket
	ADD CONSTRAINT FK_guest_TO_basket 
	FOREIGN KEY (
	guestNum -- ����ڹ�ȣ
	)
	REFERENCES guest ( -- ȸ������
	guestNum -- ����ڹ�ȣ
	);
	

-- ��ٱ���
ALTER TABLE basket
	ADD CONSTRAINT FK_room_TO_basket
	FOREIGN KEY (
	roomNum -- �������ȣ
	)
	REFERENCES room ( -- ������
	roomNum -- �������ȣ
	);

-- ��ٱ���
ALTER TABLE basket
	ADD CONSTRAINT FK_building_TO_basket 
	FOREIGN KEY (
	buildingNum -- ���Ұ�����ȣ
	)
	REFERENCES building ( -- ��������
	buildingNum -- ���Ұ�����ȣ
	);

-- �ı�
ALTER TABLE review
	ADD CONSTRAINT FK_guest_TO_review 
	FOREIGN KEY (
	guestNum -- ����ڹ�ȣ
	)
	REFERENCES guest ( -- ȸ������
	guestNum -- ����ڹ�ȣ
	);

-- �ı�
ALTER TABLE review
	ADD CONSTRAINT FK_building_TO_review 
	FOREIGN KEY (
	buildingNum -- ���Ұ�����ȣ
	)
	REFERENCES building ( -- ��������
	buildingNum -- ���Ұ�����ȣ
	);

-- ������
ALTER TABLE room
	ADD CONSTRAINT FK_building_TO_room 
	FOREIGN KEY (
	buildingNum -- ���Ұ�����ȣ
	)
	REFERENCES building ( -- ��������
	buildingNum -- ���Ұ�����ȣ
	);

-- ��������
ALTER TABLE buy
	ADD CONSTRAINT FK_guest_TO_buy 
	FOREIGN KEY (
	guestNum -- ����ڹ�ȣ
	)
	REFERENCES guest ( -- ȸ������
	guestNum -- ����ڹ�ȣ
	);

-- ��������
ALTER TABLE buy
	ADD CONSTRAINT FK_room_TO_buy 
	FOREIGN KEY (
	roomNum -- �������ȣ
	)
	REFERENCES room ( -- ������
	roomNum -- �������ȣ
	);

-- ��������
ALTER TABLE buy
	ADD CONSTRAINT FK_building_TO_buy 
	FOREIGN KEY (
	buildingNum -- ���Ұ�����ȣ
	)
	REFERENCES building ( -- ��������
	buildingNum -- ���Ұ�����ȣ
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
