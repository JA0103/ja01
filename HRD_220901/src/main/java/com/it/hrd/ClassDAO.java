package com.it.hrd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClassDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String ID = "system";
	final String PWD = "1234";
	
	//드라이버 등록
	public ClassDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//디비 연결
	public void getConnection(){
		try {
			conn = DriverManager.getConnection(URL,ID,PWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//연결 해제
	public void disConnection() {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//과정 목록 출력
	public List<ClassVO> getClassList(){
		
		List<ClassVO> list = new ArrayList<ClassVO>();
		
		String sql = "select * from tbl_class_202201 order by class_seq";
		
		try {
			
			getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ClassVO vo = new ClassVO();
				vo.setClass_seq(rs.getInt(1));
				vo.setRegist_month(rs.getString(2));
				vo.setC_no(rs.getString(3));
				vo.setClass_area(rs.getString(4));
				vo.setTution(rs.getInt(5));
				vo.setTeacher_code(rs.getString(6));
				
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
	
	//과정 등록 번호 자동발생
	public int getClassSeqNo() {
		int class_seq= 0;
		
		String sql = "select max(class_seq) from tbl_class_202201 ";
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) class_seq = rs.getInt(1) + 1;
			
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return class_seq;
	}
	
	//과정 등록
	public int insertClass(ClassVO vo) {
		int rs = 0;
		String sql = "insert into tbl_class_202201(class_seq,regist_month,c_no,class_area,tution,teacher_code) "
				+ "values(?,?,?,?,?,?) ";
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getClass_seq());
			pstmt.setString(2, vo.getRegist_month());
			pstmt.setString(3, vo.getC_no());
			pstmt.setString(4, vo.getClass_area());
			pstmt.setInt(5, vo.getTution());
			pstmt.setString(6, vo.getTeacher_code());
			
			rs = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return rs;
	}
	
	//상세페이지
	public ClassVO getDetail(String class_seq){
		ClassVO vo = new ClassVO();
		
		String sql = "select C.regist_month,C.c_no,C.class_area,C.tution,C.teacher_code, "
				+ "        T.teacher_name,T.class_name "
				+ "from tbl_class_202201 C, tbl_teacher_202201 T "
				+ "where C.teacher_code = T.teacher_code "
				+ "and class_seq = ? "
				+ "group by C.regist_month,C.c_no,C.class_area,C.tution,C.teacher_code, "
				+ "        T.teacher_name,T.class_name ";
		
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(class_seq));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setRegist_month(rs.getString("regist_month"));
				vo.setC_no(rs.getString("c_no"));
				vo.setClass_area(rs.getString("class_area"));
				vo.setTution(rs.getInt("tution"));
				vo.setTeacher_code(rs.getString("teacher_code"));
				vo.setTeacher_name(rs.getString("teacher_name"));
				vo.setClass_name(rs.getString("class_name"));
			}
			
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return vo;
		
	}
	
	//과정 수정 폼
	public ClassVO getOneClass(String class_seq) {
		ClassVO vo = new ClassVO();
		String sql = "select * from tbl_class_202201 where class_seq= ? ";
		try {
			
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(class_seq));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setClass_seq(rs.getInt("class_seq"));
				vo.setRegist_month(rs.getString("regist_month"));
				vo.setC_no(rs.getString("c_no"));
				vo.setClass_area(rs.getString("class_area"));
				vo.setTution(rs.getInt("tution"));
				vo.setTeacher_code(rs.getString("teacher_code"));
			}
			
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	
	
	//과정 수정
	public int updateClass(ClassVO vo) {
		int rs = 0;
		
		String sql = "update tbl_class_202201 set class_seq=?, regist_month=?, "
				+ "c_no=?, class_area=?, tution=?, teacher_code=? "
				+ "where class_seq = ? ";
		
		try {
			
			getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getClass_seq());
			pstmt.setString(2, vo.getRegist_month());
			pstmt.setString(3, vo.getC_no());
			pstmt.setString(4, vo.getClass_area());
			pstmt.setInt(5, vo.getTution());
			pstmt.setString(6, vo.getTeacher_code());
			pstmt.setInt(7, vo.getClass_seq());
//			pstmt.setString(7, vo.getC_no());
			
			rs = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return rs;
		
	}
	
	//과정 삭제
	public int deleteClass(String class_seq) {
		int rs = 0;
		String sql = "delete tbl_class_202201 where class_seq=? ";
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(class_seq));
			
			rs = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return rs;
		
	}
	
	//수강 목록 출력
		public List<ClassVO> getMemberList(){
			
			List<ClassVO> list = new ArrayList<ClassVO>();
			
			String sql = "select * from tbl_member_202201 order by member_seq";
			
			try {
				
				getConnection();
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ClassVO vo = new ClassVO();
					vo.setMember_seq(rs.getInt(1));
					vo.setC_no(rs.getString(2));
					vo.setC_name(rs.getString(3));
					vo.setPhone(rs.getString(4));
					vo.setAddress(rs.getString(5));
					vo.setRegist_date(rs.getString(6));
					vo.setC_type(rs.getString(7));
					
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
	
		//과정 등록 번호 자동발생
		public int getMemberSeqNo() {
			int member_seq= 0;
			
			String sql = "select max(member_seq) from tbl_member_202201 ";
			
			try {
				
				getConnection();
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) member_seq = rs.getInt(1) + 1;
				
				rs.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			
			return member_seq;
		}
		
		//수강 등록
		public int insertMember(ClassVO vo) {
			int rs = 0;
			String sql = "insert into tbl_member_202201(member_seq,c_no,c_name,phone,address,regist_date,c_type) "
					+ "values(?,?,?,?,?,?,?) ";
			
			try {
				
				getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, vo.getMember_seq());
				pstmt.setString(2, vo.getC_no());
				pstmt.setString(3, vo.getC_name());
				pstmt.setString(4, vo.getPhone());
				pstmt.setString(5, vo.getAddress());
				pstmt.setString(6, vo.getRegist_date());
				pstmt.setString(7, vo.getC_type());
				
				rs = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			return rs;
		}
		
		
}//
