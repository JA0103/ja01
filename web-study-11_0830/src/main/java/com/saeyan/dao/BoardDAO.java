package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.BoardVO;

import util.DBManager;

public class BoardDAO {
	private BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}

	//게시물 목록
	public List<BoardVO> selectAllBoards() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		String sql = "select * from board order by num desc ";
		
		try {
			
			con = DBManager.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setPass(rs.getString("pass"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setWritedate(rs.getTimestamp("writedate"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, stmt, rs);
		}
		
		return list;
	}

	//게시물 등록
	public void insertBoard(BoardVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into board(num, name, pass, email, title, content) "
				+ "values(board_seq.nextval,?,?,?,?,?) ";
		
		try {
			
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);
		}
	}

	//게시물 조회수 +1
	public void updateReadCount(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "update board set readcount = readcount+1 "
				+ "where num = ? ";
		
		try {
			
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(num));
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);
		}
		
		
	}
	
	//선택한 게시물 읽기
	public BoardVO selectOneBoardBynum(String num) {
		BoardVO vo = new BoardVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board where num = ? ";
		
		try {
			
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));

			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setPass(rs.getString("pass"));
				vo.setEmail(rs.getString("email"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWritedate(rs.getTimestamp("writedate"));
				vo.setReadcount(rs.getInt("readcount"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return vo;
	}

	//게시글 수정
	public void updateBoard(BoardVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "update board set name=?, pass=?, email=?, title=?, "
				+ "content=? where num=? ";
		
		try {
			
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getContent());
			pstmt.setInt(6, vo.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);
		}
	}

	//게시글 삭제
	public void deleteBoard(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete board where num = ? ";
		
		try {
			
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(num));
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt);
		}
		
	}
	



}//


