package com.it.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.it.vo.MovieVO;

public class MovieDAO {
	private MovieDAO() {}
	
	private static MovieDAO getinstance = new MovieDAO();
	
	public static MovieDAO getinstance() {
		return getinstance;
	}
	

	public List<MovieVO> movieList() {
		List<MovieVO> list = new ArrayList<MovieVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from movie";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setCode(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setDirector(rs.getString(4));
				vo.setActor(rs.getString(5));
				vo.setPoster(rs.getString(6));
				vo.setSynopsis(rs.getString(7));
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.closeConnection(conn, ps, rs);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}


	public void insertMovie(MovieVO vo) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into movie values(movie_seq.nextval, ?, ?, ?, ?, ?, ?) ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getDirector());
			ps.setString(4, vo.getActor());
			ps.setString(5, vo.getPoster());
			ps.setString(6, vo.getSynopsis());
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.closeConnection(conn, ps);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}


	public MovieVO movieUpdateData(int code) {
		MovieVO vo = new MovieVO();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from movie where code =? ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, code);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setCode(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setDirector(rs.getString(4));
				vo.setActor(rs.getString(5));
				vo.setPoster(rs.getString(6));
				vo.setSynopsis(rs.getString(7));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.closeConnection(conn, ps, rs);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return vo;
	}


	public void movieUpdate(MovieVO vo) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update movie set title=?,price=?,director=?,actor=?,poster=?,synopsis=? "
				+ "where code = ?";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getDirector());
			ps.setString(4, vo.getActor());
			ps.setString(5, vo.getPoster());
			ps.setString(6, vo.getSynopsis());
			ps.setInt(7, vo.getCode());
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.closeConnection(conn, ps);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}


	public void deleteMovie(int code) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "delete movie where code=? ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,code);
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.closeConnection(conn, ps);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}




	
	
	
}//class
