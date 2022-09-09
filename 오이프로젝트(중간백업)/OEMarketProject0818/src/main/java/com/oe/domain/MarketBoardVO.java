package com.oe.domain;

import java.util.Date;

import lombok.Data;

/*
CREATE TABLE MARKETBOARD(
	bo_num NUMBER PRIMARY KEY,
	bo_id VARCHAR2(30),
	bo_title VARCHAR2(300) NOT NULL,
	bo_nickname VARCHAR2(30),
	bo_price NUMBER NOT NULL,
	bo_content VARCHAR2(3000) NOT NULL,
	bo_regdate DATE DEFAULT SYSDATE,
	bo_image VARCHAR2(3000),
	bo_count NUMBER DEFAULT 0,
	bo_heart NUMBER,
	bo_heartcount NUMBER,
	bo_category VARCHAR2(150),
	bo_address1 VARCHAR2(150) NOT NULL,-- 시군구
	bo_address2 VARCHAR2(30), -- 동
	bo_ok NUMBER DEFAULT 0, --상품 판매완료 : 1 /판매중 : 0
	bo_buyer VARCHAR2(30), --상품 구매자
	CONSTRAINT fk_board_id FOREIGN KEY (bo_id) REFERENCES MARKETUSER (us_id)
	ON DELETE CASCADE
);
 */

@Data
public class MarketBoardVO {
   
   private Long bo_num, bo_count, bo_heart, bo_heartcount, bo_price, bo_ok;
   private String bo_id, bo_title, bo_nickname, bo_image ,bo_content, bo_category, bo_address1, bo_address2, bo_buyer;
   private Date bo_regdate;

}