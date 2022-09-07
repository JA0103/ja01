package com.it.shop;


/*
create table member_tbl_02(
	    custno number(6) not null primary key,
	    custname varchar2(20),
	    phone varchar2(13),
	    address varchar2(60),
	    joindate date,
	    grade char(1),
	    city char(2)
	);
*/

/*
create table money_tbl_02(
	    custno number(6) not null,
	    salenol number(8) not null,
	    pcost number(8),
	    amount number(4),
	    price number(8),
	    pcode varchar2(4),
	    sdate date,
	     primary key (custno,salenol)
	);
*/



public class memberVO {
	private int custno;
	private String custname,phone,address,joindate,grade,city;
	
	private int salenol,pcost,amount,price;
	private String pcode, sdate;
	
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getSalenol() {
		return salenol;
	}
	public void setSalenol(int salenol) {
		this.salenol = salenol;
	}
	public int getPcost() {
		return pcost;
	}
	public void setPcost(int pcost) {
		this.pcost = pcost;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	
	
	
}
