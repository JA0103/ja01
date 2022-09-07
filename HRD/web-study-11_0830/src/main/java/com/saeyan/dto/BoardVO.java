package com.saeyan.dto;

import java.sql.Timestamp;

/*
create table board(
	    num number(5) PRIMARY key,
	    pass VARCHAR2(30),
	    name VARCHAR2(30),
	    email VARCHAR2(30),
	    title VARCHAR2(50),
	    content VARCHAR2(1000),
	    readcount number(4) default 0,
	    writedate date default sysdate
	);
*/
public class BoardVO {
	private int num, readcount;
	private String pass, name, email,title,content;
	private Timestamp writedate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	
}
