package com.it.HRD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String ID = "system";
	final String PWD = "1234";
	
	//드라이버 등록
	public CourseDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//디비 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,ID,PWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//디비 연결 해제
	public void disConnection() {
		try {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//목록 출력
	public List<CourseVO> getList(){
		List<CourseVO> list = new ArrayList<CourseVO>();
		String sql = "select C.id, C.name, C.credit, L.name, C.week, C.start_hour, C.end_end "
				+ "from course_tbl C, lecturer_tbl L "
				+ "where C.lecturer = L.idx "
				+ "order by id ";
		
		try {
			
			getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				CourseVO vo = new CourseVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setCredit(rs.getInt(3));
				vo.setLecturer(rs.getString(4));
				vo.setWeek(rs.getInt(5));
				vo.setStart_hour(rs.getInt(6));
				vo.setEnd_end(rs.getInt(7));
				System.out.print(vo.getCredit());
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
	
	//교과목 갯수
	public int getCourseCount() {
		String sql = "select count(id) from course_tbl";
		int count = 0;
		try {
			
			getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return count;
	}
	
	//강사 선택
	public List<CourseVO> getLecturer() {
		List<CourseVO> list = new ArrayList<CourseVO>();
		String sql = "select idx, name from lecturer_tbl ";
		
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				CourseVO vo = new CourseVO();
				vo.setIdx(rs.getInt(1));
				vo.setName(rs.getString(2));
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
	
	//교과목 추가
	public int insertCourse(CourseVO vo) {
		String sql="insert into course_tbl values(?,?,?,?,?,?,?)";
		int rs = 0;
		
		try {
			getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,vo.getId());
			ps.setString(2,vo.getName());
			ps.setInt(3,vo.getCredit());
			ps.setString(4,vo.getLecturer());
			ps.setInt(5,vo.getWeek());
			ps.setInt(6,vo.getStart_hour());
			ps.setInt(7,vo.getEnd_end());
			
			rs = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return rs;
	}
	
	//한개 교과목 출력
	public CourseVO getOneCourse(String id) {
		CourseVO vo = new CourseVO();
		String sql = "select * from course_tbl where id = ? ";
		
		try {
			
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(id));
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setCredit(rs.getInt("credit"));
				vo.setLecturer(rs.getString("lecturer"));
				vo.setWeek(rs.getInt("week"));
				vo.setStart_hour(rs.getInt("start_hour"));
				vo.setEnd_end(rs.getInt("end_end"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	
	//교과목 수정
	public int updateCourse(CourseVO vo) {
		String sql="update course_tbl set id=?, name=?, credit=?, lecturer=?, week=?, start_hour=?, end_end=? "
				+ "where id=? ";
		int rs = 0;
		
		try {
			getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,vo.getId());
			ps.setString(2,vo.getName());
			ps.setInt(3,vo.getCredit());
			ps.setString(4,vo.getLecturer());
			ps.setInt(5,vo.getWeek());
			ps.setInt(6,vo.getStart_hour());
			ps.setInt(7,vo.getEnd_end());
			ps.setString(8,vo.getId());
			
			rs = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return rs;
	} 
	
	//교과목 삭제
	public int deleteCourse(String id) {
		String sql="delete course_tbl where id = ? ";
		int rs = 0;
		
		try {
			getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,id);
			
			rs = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return rs;
	} 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//
