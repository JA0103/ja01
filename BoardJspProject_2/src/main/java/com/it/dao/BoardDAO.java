package com.it.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	private final String URL = "jdbc:mysql://localhost:3306/db0416?serverTimezone=UTC";
	private final String USERNAME = "root";
	private final String PASSWORD = "1234";
	
	//드라이브 등록
	public BoardDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//MYSQL 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//MYSQL 해제
	public void disConnection() {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//1. 목록출력
	// 게시물 정보 한개 : BoardVO, 게시물 여러개 : (List)
	public List<BoardVO> boardListData(int page){
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			//1.연결
			getConnection();
			//2.SQL문장 작성
			int rowSize = 10;
			int start = (rowSize*page) - rowSize;  //10*1 - 10 : (limit (start,rowSize) ) -> (0,10)
			
			String sql = "select no, subject, name, DATE_FORMAT(regdate, '%Y-%m-%d'), hit "
					+ "from jspBoard order by no desc limit ?, ? ";
													//limit : 인덱스(?)부터(?)까지 갯수제한
			//3. 전송
			pstmt  = conn.prepareStatement(sql);
			
			//4. sql "?(빈칸)" 채우기
			pstmt.setInt(1, start);
			pstmt.setInt(2, rowSize);
			
			//5. 데이터 실행
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}

			//6.닫기
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return list;
	}
	
	//2. 총페이지
	public int boardTotalPage() {
		int total =0;
		
		try {
			//1. 연결
			getConnection();
			
			//2. SQL문장 작성     
			String sql = "select ceil(count(*)/10.0) from jspBoard";
								//ceil : 소수점 첫째자리 올림
			
			//3. sql 실행
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) total = rs.getInt(1);
			//닫기
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return total;
	}
	
	//상세보기 페이지 (+조회수)
	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		
		try {
			
			getConnection();

			//조회수
			String sql = "update jspBoard set hit = hit+1 "
					+ "where no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			//상세보기 페이지
			sql = "select no, name, subject,content, DATE_FORMAT(regdate,'%Y-%m-%d'),hit "
					+ "from jspBoard where no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setHit(rs.getInt(6));
			}
			rs.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return vo;
	}
	
	// 추가
	public void boardInsert(BoardVO vo) {

		try {
			
			getConnection();
			
			String sql = "insert into jspBoard (name, subject, content, pwd, regdate) "
					+ "values(?,?,?,?,now())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getPwd());
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
	}
	
	
	//수정 value 값
	public BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		
		try {
			
			getConnection();
			String sql = "select no, name, subject,content, DATE_FORMAT(regdate,'%Y-%m-%d'),hit "
					+ "from jspBoard where no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setHit(rs.getInt(6));
			}
			rs.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return vo;
		
	}
	
	//수정하기(update)
	public boolean boardUpdate(BoardVO vo) {
		boolean chk = false;
		
		try {
			getConnection();
			
			String sql = "select pwd from jspBoard where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNo());
			ResultSet rs = pstmt.executeQuery();
			
			String chk_pwd="";
			if(rs.next()) chk_pwd = rs.getString(1);
			rs.close();
			
			if(chk_pwd.equals(vo.getPwd())) {
				chk = true;
				
				sql = "update jspBoard set name=?, subject=?, content=? where no=? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getName());
				pstmt.setString(2, vo.getSubject());
				pstmt.setString(3, vo.getContent());
				pstmt.setInt(4, vo.getNo());
				
				pstmt.executeUpdate();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return chk;
	}
	
	
	//삭제하기
	public int boardDelete(int no, String pwd) {
		int result=0;
		
		try {

				getConnection();
				String sql = "select pwd from jspBoard where no =? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				ResultSet rs = pstmt.executeQuery();
				
				String chk_pwd="";
				if(rs.next()) chk_pwd = rs.getString(1);
				rs.close();
				
				if(chk_pwd.equals(pwd)) {
					result = 1;
					sql = "delete from jspBoard where no = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return result;
	}
	
	public int boardSearch(String search) {
		int result =0;
		
		try {
			
			getConnection();
			
			String sql = "select subject from jspBoard where subject like %?% ";
			String SQL = "select * from (select A.* from bbs A	where bbstitle like'%"
					+ "%' order by bbsDate desc) where NUM between ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			ResultSet rs = pstmt.executeQuery();
			 
			if(rs.next()) 
				result = 1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		
		return result;
	}
	
	//1. 검색 결과 목록출력
		// 게시물 정보 한개 : BoardVO, 게시물 여러개 : (List)
		public List<BoardVO> boardSearchData(int page, String search){
			List<BoardVO> list = new ArrayList<BoardVO>();
			
			try {
				//1.연결
				getConnection();
				//2.SQL문장 작성
				int rowSize = 10;
				int start = (rowSize*page) - rowSize;  //10*1 - 10 : (limit (start,rowSize) ) -> (0,10)
				
				String sql = "select no, subject, name, DATE_FORMAT(regdate, '%Y-%m-%d'), hit "
						+ "from jspBoard where subject like ? order by no desc limit ?, ? ";
														//limit : 인덱스(?)부터(?)까지 갯수제한
				//3. 전송
				pstmt  = conn.prepareStatement(sql);
				
				//4. sql "?(빈칸)" 채우기
				pstmt.setString(1, search);
				pstmt.setInt(2, start);
				pstmt.setInt(3, rowSize);
				
				//5. 데이터 실행
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardVO vo = new BoardVO();
					vo.setNo(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setDbday(rs.getString(4));
					vo.setHit(rs.getInt(5));
					list.add(vo);
				}

				//6.닫기
				rs.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			
			return list;
		}
	
	
	
	
	
	
	
}
