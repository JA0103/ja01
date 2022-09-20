package com.it.hrd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VoteDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String ID= "system";
	final String PWD = "1234";
	
	//드라이버 연결
	public VoteDAO() {
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
	
	//디비 연결
		public void disConnection() {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	//후보조회
		public List<VoteVO> getMemberList(){
			List<VoteVO> list = new ArrayList<VoteVO>();
			String sql = "select M.m_no, M.m_name, P.p_name, m.p_school, m.m_jumin, m.m_city, "
					+ "P.p_tel1, P.p_tel2, P.p_tel3 "
					+ "from tbl_member_202005 M, tbl_party_202005 P "
					+ "where M.p_code = P.p_code";
					
			try {
				
				getConnection();
				
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					VoteVO vo = new VoteVO();
					vo.setM_no(rs.getString(1));
					vo.setM_name(rs.getString(2));
					vo.setP_name(rs.getString(3));
					String p_school = "";
					if(rs.getString(4).equals("1")) p_school="고졸";
					if(rs.getString(4).equals("2")) p_school="학사";
					if(rs.getString(4).equals("3")) p_school="석사";
					if(rs.getString(4).equals("4")) p_school="박사";
					vo.setP_school(p_school);
					vo.setM_jumin(rs.getString(5));
					vo.setM_city(rs.getString(6));
					vo.setP_tel1(rs.getString(7));
					vo.setP_tel2(rs.getString(8));
					vo.setP_tel3(rs.getString(9));
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
		
		//투표등록
		public int insertVote(VoteVO vo) {
			int result = 0;
			String sql = "insert into tbl_vote_202005 values(?,?,?,?,?,?)";
			
			try {
				
				getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getV_jumin());
				ps.setString(2, vo.getV_name());
				ps.setString(3, vo.getM_no());
				ps.setString(4, vo.getV_time());
				ps.setString(5, vo.getV_area());
				ps.setString(6, vo.getV_confirm());
				
				result = ps.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			
			return result;
		}
		
		//투표검수조회
		public List<VoteVO> getVoteList(){
			List<VoteVO> list = new ArrayList<VoteVO>();
			String sql = "select v_name, v_jumin, m_no, v_time, v_confirm "
					+ "from tbl_vote_202005 "
					+ "where v_area = '제1투표장'";
			try {
			
				getConnection();
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					VoteVO vo = new VoteVO();
					vo.setV_name(rs.getString(1));
					vo.setV_jumin(rs.getString(2));
					vo.setM_no(rs.getString(3));
					vo.setV_time(rs.getString(4));
					String confirm = "";
					if(rs.getString(5).equals("Y")) confirm = "확인";
					if(rs.getString(5).equals("N")) confirm = "미확인";
					vo.setV_confirm(confirm);
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
		
		//후보자 등수
		public List<VoteVO> getRank(){
			List<VoteVO> list = new ArrayList<VoteVO>();
			String sql = "select m.m_no, m.m_name, count(*) as v_total "
					+ "            from tbl_member_202005 m, tbl_vote_202005 v "
					+ "            where m.m_no = v.m_no and v.v_confirm = 'Y' "
					+ "            group by m.m_no,m.m_name  order by v_total desc";
			
			try {
				
				getConnection();
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					VoteVO vo = new VoteVO();
					vo.setM_no(rs.getString(1));
					vo.setM_name(rs.getString(2));
					vo.setV_total(rs.getInt(3));
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
		
}//
