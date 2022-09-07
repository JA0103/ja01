package com.it.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class memberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String ID = "system";
	final String PWD = "1234";
	
	//드라이브 등록
	public memberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//디비 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,ID,PWD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//연결 해제
	public void disConnection() {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	//등록 번호 자동 발생
	public int seqCustno() {
		String sql = "select max(custno) from member_tbl_02 ";
		int custno=0;
		
		try {
			getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) custno = rs.getInt(1)+1; 
			
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return custno;
		
	}
	
	//회원 추가
	public int insert(memberVO vo) {
		int result = 0;
		String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?) ";
		
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			
			result= pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return result;
		
	}
	
	
	//리스트 출력
	public List<memberVO> getList(){
		List<memberVO> list = new ArrayList<memberVO>();
		
		String sql = "select * from member_tbl_02 ";
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			String grade = "";
			
			while(rs.next()) {
				memberVO vo = new memberVO();
				vo.setCustno(rs.getInt(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				if(rs.getString(6).equals("A")) grade="VIP";
				if(rs.getString(6).equals("B")) grade="일반";
				if(rs.getString(6).equals("C")) grade="직원";
				vo.setGrade(grade);
				vo.setCity(rs.getString(7));
				
				list.add(vo);
			}
			
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return list;
	}
	
	//상세보기
	public memberVO getOne(int custno) {
		memberVO vo = new memberVO();
		String sql = "select * from member_tbl_02 where custno = ? ";
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			String grade = "";
			if(rs.next()) {
				vo.setCustno(rs.getInt(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				if(rs.getString(6).equals("A")) grade="VIP";
				if(rs.getString(6).equals("B")) grade="일반";
				if(rs.getString(6).equals("C")) grade="직원";
				vo.setGrade(grade);
				vo.setCity(rs.getString(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	
	//수정하기
	public int update() {
		int result = 0;
		
		String sql = "update member_tbl_02 set custno=?, custname=?, phone=?, address=?, joindate=?, grade=?, city=? "
				+"where custno=? ";
		
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return result;
		
	}
	
}//
