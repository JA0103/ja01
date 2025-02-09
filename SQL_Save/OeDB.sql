--drop table marketuser;
--drop table marketboard;
--drop table mypage;
--drop table buyboard;
--drop table sellboard;
--drop table heartboard;
--drop table center;

--유저테이블
create table marketuser(
    us_num number,
    us_id varchar2(30) primary key,
    us_pass varchar2(40) not null,
    us_name varchar2(20) not null,
    us_nickname varchar2(20) unique,
    us_birth char(8),
    us_email varchar2(30),
    us_gender varchar2(8), --남성(male), 여성(female)
    us_address1 varchar2(100) not null, -- 우편번호
   us_address2 varchar2(100) not null, -- 기본주소
   us_address3 varchar2(100) not null, -- 상세주소
    us_phone char(13) not null,
    us_joindate date default sysdate,
    us_grade number(1) default 1 -- 관리자(0), 일반회원(1)
);

select * from marketuser;
select * from mypage;
--상품 테이블
create table marketboard(
    bo_num number primary key,
   bo_id varchar2(30),
    bo_title varchar2(100) not null,
    bo_nickname varchar2(20),
    bo_price number not null,
    bo_content varchar(2000) not null,
    bo_image1 varchar2(500), -- C://oe_upload
   bo_image2 varchar2(500),
   bo_image3 varchar2(500),
    bo_regdate date default sysdate,
    bo_count number default 0,
    bo_heart number,
    bo_heartcount number,
    bo_category varchar2(50),
    bo_address1 varchar2(10) not null,-- 우편번호
   bo_address2 varchar2(100) not null, -- 기본 주소
   bo_address3 varchar2(100) not null, -- 상세 주소
    constraint fk_board_id foreign key (bo_nickname) references marketuser (us_id)
    on delete cascade
);

--마이페이지
create table mypage(
    my_id varchar2(30),
    my_image varchar2(500),
    my_intro varchar2(1000),
    my_nickname varchar2(20) unique,
    constraint fk_my_id foreign key (my_id) references marketuser (us_id)
    on delete cascade
);

--구매내역
create table buyboard(
    buy_nickname varchar2(30),
    buy_title varchar2(100),
    buy_price number,
    buy_seller varchar2(30),
    buy_buydate date default sysdate,
    constraint fk_buy_id foreign key (buy_nickname) references mypage (my_nickname)
    on delete cascade
);

--판매내역
create table sellboard(
    sel_nickname varchar2(30),
    sel_title varchar2(100),
    sel_price number,
    sel_buyer varchar2(30),
    sel_selldate date default sysdate,
    constraint fk_sell_id foreign key (sel_nickname) references mypage (my_nickname)
    on delete cascade
);

CREATE TABLE MARKETBOARD(
   bo_num NUMBER PRIMARY KEY,
   bo_id VARCHAR2(30),
   bo_title VARCHAR2(100) NOT NULL,
   bo_nickname VARCHAR2(20),
   bo_price NUMBER NOT NULL,
   bo_content VARCHAR(2000) NOT NULL,
   bo_regdate DATE DEFAULT SYSDATE,
   bo_image VARCHAR2(2000),
   bo_count NUMBER DEFAULT 0,
   bo_heart NUMBER,
   bo_heartcount NUMBER,
   bo_category VARCHAR2(50),
   bo_address1 VARCHAR2(50) NOT NULL,-- 시군구
   bo_address2 VARCHAR2(30), -- 동 not null 삭제
   CONSTRAINT fk_board_id FOREIGN KEY (bo_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

drop table heartboard;


--고객센터
create table center(
    ce_num number primary key,
    ce_pass varchar(40),
    ce_nickname varchar2(20),
    ce_title varchar2(100),
    ce_content varchar2(2000),
    ce_id varchar2(30),
   constraint fk_center_id foreign key (ce_id) references marketuser (us_id)
    on delete cascade
);