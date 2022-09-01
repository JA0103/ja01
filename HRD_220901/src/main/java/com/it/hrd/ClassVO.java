package com.it.hrd;
/*
create table tbl_class_202201(
	    class_seq number(4) not null,
	    regist_month char(8) not null,
	    c_no char(5) not null,
	    class_area varchar2(15),
	    tution number(8),
	    teacher_code char(3),
	    primary key(regist_month,c_no)
	);
*/
/*
create table tbl_teacher_202201(
	    teacher_seq number (4) not null,
	    teacher_code char(3) not null primary key,
	    class_name varchar2(12),
	    teacher_name varchar2(12),
	    class_price number(8),
	    teacher_regist_date char(8)
	);
*/
/*
create table tbl_member_202201(
	    member_seq number(4) not null primary key,
	    c_no char(5) not null,
	    c_name varchar2(12),
	    phone varchar2(11),
	    address varchar2(50),
	    regist_date char(8),
	    c_type varchar2(12)
	);
*/

public class ClassVO {
	private int class_seq,tution;
	private String regist_month,c_no,class_area,teacher_code;
	
	private int teacher_seq, class_price;
	private String class_name, teacher_name, teacher_regist_date;
	
	private int member_seq;
	private String c_name, phone, address, regist_date, c_type;
	
	
	
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
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
	public String getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public int getTeacher_seq() {
		return teacher_seq;
	}
	public void setTeacher_seq(int teacher_seq) {
		this.teacher_seq = teacher_seq;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_regist_date() {
		return teacher_regist_date;
	}
	public void setTeacher_regist_date(String teacher_regist_date) {
		this.teacher_regist_date = teacher_regist_date;
	}
	public int getClass_seq() {
		return class_seq;
	}
	public void setClass_seq(int class_seq) {
		this.class_seq = class_seq;
	}
	public int getTution() {
		return tution;
	}
	public void setTution(int tution) {
		this.tution = tution;
	}
	public String getRegist_month() {
		return regist_month;
	}
	public void setRegist_month(String regist_month) {
		this.regist_month = regist_month;
	}
	public String getC_no() {
		return c_no;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public String getClass_area() {
		return class_area;
	}
	public void setClass_area(String class_area) {
		this.class_area = class_area;
	}
	public String getTeacher_code() {
		return teacher_code;
	}
	public void setTeacher_code(String teacher_code) {
		this.teacher_code = teacher_code;
	}
	
	
}
