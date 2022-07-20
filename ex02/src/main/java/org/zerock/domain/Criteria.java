package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public String[] getTpeArr() {
		return type == null ? new String[] {} : type.split(""); 
	}
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pagenum, int amount) {
		this.pageNum = pagenum;
		this.amount = amount;
	}
	
	
	
}//
