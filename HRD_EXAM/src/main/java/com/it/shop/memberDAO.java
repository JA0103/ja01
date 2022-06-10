package com.it.shop;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class memberDAO {
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		final String ID = "system";
		final String PWD = "1234";
		
		//드라이브 등록
		public memberDAO() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			 
		}
		
		//sql연결
		public void getConnection() {
			try {
				conn = DriverManager.getConnection(URL,ID,PWD);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//연결해제
		public void disConnection() {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//추가
		public int memberInsert(memberVO vo) {
			int rs = 0;
			try {
				
				
				getConnection();
				String sql = "insert into MEMBER_TBL_02 (custno, custname, phone, address, joindate, grade, city) "
						+ "values(?, ?, ?, ?, ?, ?, ?) ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, vo.getCustno());
				ps.setString(2, vo.getCustname());
				ps.setString(3, vo.getPhone());
				ps.setString(4, vo.getAddress());
				ps.setString(5, vo.getJoindate());
				ps.setString(6, vo.getGrade());
				ps.setString(7, vo.getCity());
				
				rs = ps.executeUpdate();
				
				
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			
			return rs;
		}
		
		//목록조회
		public List<memberVO> memberListData(){
			List<memberVO> list = new ArrayList<memberVO>();
			try {
				getConnection();
				
				
				String sql = "select custno, custname, phone, address, joindate, grade, city "
						+ "from MEMBER_TBL_02 order by custno";
				ps = conn.prepareStatement(sql);
				
				
				ResultSet rs = ps.executeQuery();
				String grade = "직원";
				
				while(rs.next()) {
					memberVO vo = new memberVO();
					vo.setCustno(rs.getInt(1));
					vo.setCustname(rs.getString(2));
					vo.setPhone(rs.getString(3));
					vo.setAddress(rs.getString(4));
					vo.setJoindate(rs.getString(5));
					if(rs.getString(6).equals("A")) grade = "VIP";
					else if(rs.getString(6).equals("B")) grade = "일반";
					vo.setGrade(grade);
					vo.setCity(rs.getString(7));
					list.add(vo);
				}
				
				rs.close();
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			return list;
		}
		
		
		//수정 전 원래 값
		public memberVO memberUpdateData(int custno) {
			memberVO vo = new memberVO();
			try {
				
				getConnection();
				String sql = "select * from MEMBER_TBL_02 where custno =? ";
				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, custno);
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					vo.setCustno(rs.getInt(1));
					vo.setCustname(rs.getString(2));
					vo.setPhone(rs.getString(3));
					vo.setAddress(rs.getString(4));
					vo.setJoindate(rs.getString(5));
					vo.setGrade(rs.getString(6));
					vo.setCity(rs.getString(7));
				}
				rs.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			return vo;
		}
		
		//수정(update)
		public int memberUpdate(memberVO vo) {
			int result = 0;
			try {
				
				getConnection();
				String sql = "update MEMBER_TBL_02 set custno=?, custname=?, phone=?, address=?, joindate=?, grade=?, city=? "
						+"where custno=? ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, vo.getCustno());
				ps.setString(2, vo.getCustname());
				ps.setString(3, vo.getPhone());
				ps.setString(4, vo.getAddress());
				ps.setString(5, vo.getJoindate());
				ps.setString(6, vo.getGrade());
				ps.setString(7, vo.getCity());
				ps.setInt(8, vo.getCustno());
				result = ps.executeUpdate();
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			
			
			return result;
			
		}
		
		
		//매출조회
		public List<memberVO> memberSalse(){
			List<memberVO> list = new ArrayList<memberVO>();
			
			try {
				
				getConnection();
				

				//String sql = "select custno from money_tbl_02 ";
				
				String sql = "select  D.custno, D.custname, D.grade, sum(price) "
						+ "from MONEY_TBL_02 N , MEMBER_TBL_02 D "
						+ "where N.custno = D.custno "
						+ "group by D.CUSTNO, D.custname, D.grade "
						+ "order by sum(price) desc ";
				
				ps = conn.prepareStatement(sql);
				
				ResultSet rs = ps.executeQuery();
				String grade = "직원";
				
				while(rs.next()) {
					memberVO vo = new memberVO();
					vo.setCustno(rs.getInt(1));
					vo.setCustname(rs.getString(2));
					if(rs.getString(3).equals("A")) grade = "VIP";
					else if(rs.getString(3).equals("B")) grade = "일반";
					vo.setGrade(grade);
					vo.setPrice(rs.getInt(4));
					list.add(vo);
				}
				rs.close();
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			
			return list;
			
		}
		
		//회원정보 자동입력값
		public int seqCustno(memberVO vo) {
			String sql = "SELECT MAX(CUSTNO) FROM MEMBER_TBL_02";
			int custno = 100001;
			ResultSet rs = null;
			try {
				getConnection();
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()) custno = rs.getInt(1) + 1;
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				disConnection();
			}
			return custno;
		} //end of seqCustno
		
		//검색
		public List<memberVO> memberSearch(String search){
			List<memberVO> list = new ArrayList<memberVO>();
			
			try {
				
				getConnection();
				String sql = "select * from member_tbl_02 where address like ? ";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+search+"%");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					memberVO vo = new memberVO();
					vo.setCustno(rs.getInt(1));
					vo.setCustname(rs.getString(2));
					vo.setPhone(rs.getString(3));
					vo.setAddress(rs.getString(4));
					vo.setJoindate(rs.getString(5));
					vo.setGrade(rs.getString(6));
					vo.setCity(rs.getString(7));
					list.add(vo);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			
			return list;
		}
		//검색
		public boolean memberSearch_chk(String search){
			boolean result = false;
			
			try {
				
				getConnection();
				String sql = "select * from member_tbl_02 where address like ? ";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+search+"%");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					result = true;
					memberVO vo = new memberVO();
					vo.setCustno(rs.getInt(1));
					vo.setCustname(rs.getString(2));
					vo.setPhone(rs.getString(3));
					vo.setAddress(rs.getString(4));
					vo.setJoindate(rs.getString(5));
					vo.setGrade(rs.getString(6));
					vo.setCity(rs.getString(7));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			
			return result;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}//class
