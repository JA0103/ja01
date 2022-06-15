package com.it.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table employees(
	    id VARCHAR2(10) not null,
	    pass VARCHAR2(10) not null,
	    name VARCHAR2(24),
	    lev char(1) DEFAULT 'A',    --운영자:'A', 일반회원:'B'
	    enter date DEFAULT sysdate,
	    gender char(1) DEFAULT '1',  --남자:1, 여자:2
	    phone varchar2(30),
	    primary key(id)
	);
*/
@Getter
@Setter
@ToString
public class EmpVO {
	private String id, pass, name, lev, gender, phone;
	private Timestamp enter;
}
