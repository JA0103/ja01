package com.it.movie;

import lombok.Getter;
import lombok.Setter;

/*
create table movie(
code number(4),
title VARCHAR2(50),
price number(10),
director VARCHAR2(20),
actor VARCHAR2(20),
poster VARCHAR2(100),
synopsis VARCHAR2(3000),
PRIMARY KEY(code)
);
*/
@Getter
@Setter
public class MovieVO {
	private Integer code, price;
	private String title,  director, actor, poster, synopsis;
}
