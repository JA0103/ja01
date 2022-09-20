package com.it.hrd;

import java.util.Date;

/*
create table tbl_vote_202005(
	    v_jumin char(13) not null primary key, -- 주민번호
	    v_name varchar2(20), --성명
	    m_no char(1), --후보번호
	    v_time char(4), --투표시간
	    v_area char(20), --투표장소
	    v_confirm char(1) --유권자확인
	);
create table tbl_member_202005(
	    m_no char(1) not null primary key, -- 후보번호
	    m_name varchar2(20), -- 성명
	    p_code char(2), --소속정당
	    p_school char(1), -- 최종학력
	    m_jumin char(13), --주민번호
	    m_city varchar2(20) --지역구
	);
create table tbl_party_202005(
	    p_code char(2) not null primary key, --정당코드
	    p_name varchar(20), --명칭
	    p_indate date, --등록연월일
	    p_reader varchar(20), --대표자
	    p_tel1 char(3), --전화번호1
	    p_tel2 char(4), --전화번호2
	    p_tel3 char(4) --전화번호3
	);
*/
public class VoteVO {
	private String v_jumin,v_name,m_no,v_time,v_area,v_confirm;
	private String m_name,p_code,p_school,m_jumin,m_city; // m_no
	private String p_name,p_reader,p_tel1,p_tel2,p_tel3; //p_code
	private Date p_indate;
	private int v_total;
	
	
	
	public int getV_total() {
		return v_total;
	}
	public void setV_total(int v_total) {
		this.v_total = v_total;
	}
	public String getV_jumin() {
		return v_jumin;
	}
	public void setV_jumin(String v_jumin) {
		this.v_jumin = v_jumin;
	}
	public String getV_name() {
		return v_name;
	}
	public void setV_name(String v_name) {
		this.v_name = v_name;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getV_time() {
		return v_time;
	}
	public void setV_time(String v_time) {
		this.v_time = v_time;
	}
	public String getV_area() {
		return v_area;
	}
	public void setV_area(String v_area) {
		this.v_area = v_area;
	}
	public String getV_confirm() {
		return v_confirm;
	}
	public void setV_confirm(String v_confirm) {
		this.v_confirm = v_confirm;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getP_school() {
		return p_school;
	}
	public void setP_school(String p_school) {
		this.p_school = p_school;
	}
	public String getM_jumin() {
		return m_jumin;
	}
	public void setM_jumin(String m_jumin) {
		this.m_jumin = m_jumin;
	}
	public String getM_city() {
		return m_city;
	}
	public void setM_city(String m_city) {
		this.m_city = m_city;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_reader() {
		return p_reader;
	}
	public void setP_reader(String p_reader) {
		this.p_reader = p_reader;
	}
	public String getP_tel1() {
		return p_tel1;
	}
	public void setP_tel1(String p_tel1) {
		this.p_tel1 = p_tel1;
	}
	public String getP_tel2() {
		return p_tel2;
	}
	public void setP_tel2(String p_tel2) {
		this.p_tel2 = p_tel2;
	}
	public String getP_tel3() {
		return p_tel3;
	}
	public void setP_tel3(String p_tel3) {
		this.p_tel3 = p_tel3;
	}
	public Date getP_indate() {
		return p_indate;
	}
	public void setP_indate(Date p_indate) {
		this.p_indate = p_indate;
	}
	
	
	
}
