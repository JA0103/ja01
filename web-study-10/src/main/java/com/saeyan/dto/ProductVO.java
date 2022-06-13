package com.saeyan.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/*
create table product(
	    code number(5),
	    name VARCHAR2(100),
	    price number(8),
	    pictureurl VARCHAR(50),
	    description varchar(1000),
	    primary key(code)
	);
*/

@Getter
@Setter
public class ProductVO {
	private int code;
	private String name;
	private int price;
	private String pictureurl;
	private String description;
	
}
