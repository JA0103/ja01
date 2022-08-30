/*system으로 접속*/

/*
DROP TABLE CENTER;
DROP TABLE HEARTBOARD;
DROP TABLE SELLBOARD;
DROP TABLE BUYBOARD;
DROP TABLE MYPAGE;
DROP TABLE CRAWLINGTEST;
DROP SEQUENCE SEQ_CRAWLING;
DROP TABLE WITHDRAWAL;
DROP TABLE FILEUPLOAD;
DROP TABLE MARKETBOARD;
DROP TABLE MARKETUSER;
*/
select * from marketuser;
select * from marketboard;
select * from mypage;

--유저테이블
CREATE TABLE MARKETUSER(
   us_num NUMBER,
   us_id VARCHAR2(30) PRIMARY KEY,
   us_pass VARCHAR2(40) NOT NULL,
   us_name VARCHAR2(20) NOT NULL,
   us_nickname VARCHAR2(20) UNIQUE,
   us_birth CHAR(8),
   us_email VARCHAR2(30),
   us_gender VARCHAR2(8), --남성(male), 여성(female)
   us_address1 VARCHAR2(50) NOT NULL, -- 시군구
   us_address2 VARCHAR2(30) NOT NULL, -- 동
   us_phone CHAR(13) NOT NULL,
   us_joindate DATE DEFAULT SYSDATE,
   us_grade NUMBER(1) DEFAULT 1 -- 관리자(0), 일반회원(1)
);

--상품 테이블
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
   bo_address2 VARCHAR2(30) NOT NULL, -- 동
   CONSTRAINT fk_board_id FOREIGN KEY (bo_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--마이페이지
CREATE TABLE MYPAGE(
   my_id VARCHAR2(30),
   my_image VARCHAR2(500),
   my_intro VARCHAR2(1000),
   my_nickname VARCHAR2(20) UNIQUE,
   wd_reason_pre VARCHAR2(200), --go to WITHDRAWAL
   wd_remark_pre VARCHAR2(2000), --go to WITHDRAWAL
   CONSTRAINT fk_my_id FOREIGN KEY (my_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--구매내역
CREATE TABLE BUYBOARD(
   buy_id VARCHAR2(30),
   buy_nickname VARCHAR2(30),
   buy_title VARCHAR2(100),
   buy_price NUMBER,
   buy_seller VARCHAR2(30),
   buy_buydate DATE DEFAULT SYSDATE,
   CONSTRAINT fk_buy_id FOREIGN KEY (buy_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--판매내역
CREATE TABLE SELLBOARD(
   sel_id VARCHAR2(30),
   sel_nickname VARCHAR2(30),
   sel_title VARCHAR2(100),
   sel_price NUMBER,
   sel_buyer VARCHAR2(30),
   sel_selldate DATE DEFAULT SYSDATE,
   CONSTRAINT fk_sell_id FOREIGN KEY (sel_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--찜목록
CREATE TABLE HEARTBOARD(
   he_bo_num NUMBER,
   he_id VARCHAR2(30),
   he_nickname VARCHAR2(30),
   he_title VARCHAR2(100),
   he_price NUMBER,
   he_seller VARCHAR2(30),
   CONSTRAINT fk_heart_id FOREIGN KEY (he_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE,
   CONSTRAINT fk_heart_bo_num FOREIGN KEY (he_bo_num) REFERENCES MARKETBOARD (bo_num)
   ON DELETE CASCADE
);

--고객센터
CREATE TABLE CENTER(
   ce_id VARCHAR2(30),
   ce_num NUMBER PRIMARY KEY,
   ce_pass VARCHAR(40),
   ce_nickname VARCHAR2(20),
   ce_title VARCHAR2(100),
   ce_content VARCHAR2(2000),
   CONSTRAINT fk_center_id FOREIGN KEY (ce_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--크롤링
create table crawlingTest(
    no number,
    title varchar2(100),
    content varchar2(500),
    poster varchar2(500),
    address varchar2(500),
    heart varchar2(500),
    price varchar2(500),
    category varchar2(500),
    regdate DATE default sysdate 
);
alter table crawlingTest add CONSTRAINT pk_crawlingTest PRIMARY key(no);

CREATE SEQUENCE SEQ_CRAWLING start with 1
INCREMENT by 1;

--회원탈퇴
CREATE TABLE WITHDRAWAL (
   wd_id VARCHAR2(30),
   wd_reason VARCHAR2(200), --탈퇴사유
   wd_remark VARCHAR2(2000), --하고싶은말
   wd_date DATE DEFAULT SYSDATE,
   CONSTRAINT fk_withdrawal_id FOREIGN KEY (wd_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--파일업로드
create table fileUpload(
    bo_num number,
    file_num number PRIMARY KEY,
    file_original varchar2(500),
    file_size number,
    CONSTRAINT fk_file_num  FOREIGN KEY (bo_num) REFERENCES marketboard (bo_num)
    on delete cascade
);

commit;