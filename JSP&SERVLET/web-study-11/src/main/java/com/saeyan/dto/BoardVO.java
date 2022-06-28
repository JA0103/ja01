package com.saeyan.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table board(
	    num number(5) PRIMARY KEY,
	    pass VARCHAR2(30),
	    name VARCHAR2(30),
	    email VARCHAR2(30),
	    title VARCHAR2(50),
	    content VARCHAR2(1000),
	    readcount number(4) DEFAULT 0,
	    writedate date DEFAULT sysdate
	);
*/

@Getter
@Setter
@ToString
public class BoardVO {
	
	private Integer num, readcount; 
	private String pass, name, email, title, content;
	private Timestamp writedate;
}
