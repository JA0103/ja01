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
	
	public static BoardDAO getinstance() {
		return instance;
	}

	public List<BoardVO> selectAllBoards() {
		String sql = "select * from board order by num desc";

		List<BoardVO> list = new ArrayList<BoardVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getInt(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setReadcount(rs.getInt(7));
				vo.setWritedate(rs.getTimestamp(8));
				
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps, rs);
		}
		
		
		return list;
	}

	public void insertBoard(BoardVO vo) {
		String sql = "insert into board(num, name, email, pass, title, content) "
				+ "values(board_seq.nextval,?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getPass());
			ps.setString(4, vo.getTitle());
			ps.setString(5, vo.getContent());
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps);
		}
		
		
	}
	
	//조회수 증가
	public void updateReadCount(String num) {
		String sql = "update board set readcount= readcount+1 where num =? ";

		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(num));
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps);
		}
	}

	public BoardVO SelectOneBoardByNum(String num) {
		BoardVO vo = new BoardVO();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from board where num=? ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(num));
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setNum(rs.getInt(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setReadcount(rs.getInt(7));
				vo.setWritedate(rs.getTimestamp(8));
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps, rs);
		}
		
		return vo;
	}

	public void updateBoard(BoardVO vo) {
		String sql = "update board set name=?, email=?, pass=?, title=?, content=? "
				+ "where num =? ";

		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getPass());
			ps.setString(4, vo.getTitle());
			ps.setString(5, vo.getContent());
			ps.setInt(6, vo.getNum());
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps);
		}
	
	}

	public void deleteBoard(String num) {
	
		String sql = "delete board where num=? ";

		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(num));
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps);
		}
		
	}
	
	
}
