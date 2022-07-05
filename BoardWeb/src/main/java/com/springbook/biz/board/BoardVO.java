package com.springbook.biz.board;


import java.util.Date;

import lombok.Data;


@Data
public class BoardVO {
	private  int seq;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int cnt;
	private String searchCondition;
	private String searchKeyword;
	
	
	
	
}
