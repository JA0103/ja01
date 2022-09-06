package com.it.HRD;

/*
create table course_tbl(
	    id varchar2(5) not null primary key,
	    name varchar2(80),
	    credit number(6),
	    lecturer varchar2(10),
	    week number(2),
	    start_hour number(4),
	    end_end number(4)
	);

create table lecturer_tbl(
	    idx number(6) not null primary key,
	    name varchar2(20),
	    major varchar2(40),
	    field varchar2(40)
	);

*/
public class CourseVO {
	private String id, name, lecturer, major, field;
	private int credit, week, start_hour, end_end, idx;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLecturer() {
		return lecturer;
	}
	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public int getStart_hour() {
		return start_hour;
	}
	public void setStart_hour(int start_hour) {
		this.start_hour = start_hour;
	}
	public int getEnd_end() {
		return end_end;
	}
	public void setEnd_end(int end_end) {
		this.end_end = end_end;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
	
}
