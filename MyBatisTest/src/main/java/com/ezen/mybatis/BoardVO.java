package com.ezen.mybatis;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/*
create table board(
	    id number(5) PRIMARY KEY,
	    name VARCHAR(20),
	    phone VARCHAR2(20),
	    address VARCHAR2(50)
	    
	);
*/

@Data
public class BoardVO {
	private Integer id;
	private String name;
	private String phone;
	private String address;
	
}
