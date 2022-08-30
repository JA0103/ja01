package com.it.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private Integer num;
	private String pass;
	private String name;
	private String email;
	private String title;
	private String content;
	private Integer readcount;
	private Timestamp writedate;
}
