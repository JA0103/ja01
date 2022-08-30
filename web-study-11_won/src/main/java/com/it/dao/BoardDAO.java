package com.it.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.it.dto.BoardVO;

import util.DBManager;

public class BoardDAO{
	private BoardDAO() {
}

	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public List<BoardVO> selectAllBoards(){
		String sql = "select * from board order by num desc";
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		Connection conn = null;
		PreparedStatement stmt=null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				
				list.add(bVo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
		
			}

	public void insertBoard(BoardVO bVo) {
		String sql = "insert into board(" + "num, name, email, pass, title, content)"+"values(board_seq.nextval,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  bVo.getName());
			pstmt.setString(2,  bVo.getEmail());
			pstmt.setString(3,  bVo.getPass());
			pstmt.setString(4,  bVo.getTitle());
			pstmt.setString(5,  bVo.getContent());
			
			pstmt.executeUpdate();
	}catch(Exception e) {
		e.getStackTrace();
	}finally {
		DBManager.close(conn,  pstmt);
	}
	}
		public void updateBoard(BoardVO bVo) {
			String sql = "update board set name=?, email=?, pass=?," + "title=?, content=? where num=?";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,  bVo.getName());
				pstmt.setString(2,  bVo.getEmail());
				pstmt.setString(3,  bVo.getPass());
				pstmt.setString(4,  bVo.getTitle());
				pstmt.setString(5,  bVo.getContent());
				pstmt.setInt(6,  bVo.getNum());
			
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.getStackTrace();
			}finally {
				DBManager.close(conn,  pstmt);
			}
		}
		
		public BoardVO selectOneBoardByNum(String num) {
			String sql = "select * from board where num = ?";
			BoardVO bVo =null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,  num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bVo= new BoardVO();
				
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				}
			}catch(Exception e) {
				e.getStackTrace();
			}finally {
				DBManager.close(conn,  pstmt, rs);
			}
			return bVo;
		
		}

		public void updateReadcount(String num) {
			String sql = "update board set readcount=readcount+1 where num=?";
			
			Connection conn=null;
			PreparedStatement pstmt = null;
			try {
				conn = DBManager.getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
			
		}

		public void deleteBoard(String num) {
			
			String sql = "delete  from board where num=?";
			Connection conn = null;
			PreparedStatement pstmt=null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			
				
			}
		}
}

	
	