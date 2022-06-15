package com.it.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBManager.DBManager;
/*
create table movie(
code number(4),
title VARCHAR2(50),
price number(10),
director VARCHAR2(20),
actor VARCHAR2(20),
poster VARCHAR2(100),
synopsis VARCHAR2(3000),
PRIMARY KEY(code)
);
*/


public class MovieDAO {
	public MovieDAO() {}
	
	private static MovieDAO getinstance = new MovieDAO();
	
	public static MovieDAO getinstance() {
		return getinstance;
	}

	public List<MovieVO> AllMovieList() {
		List<MovieVO> list = new ArrayList<MovieVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from movie ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			rs =ps.executeQuery();
			
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

	public int movieInsert(MovieVO vo) {
		int result = -1;
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into movie values(movie_seq.nextval,?,?,?,?,?,?) ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getDirector());
			ps.setString(4, vo.getActor());
			ps.setString(5, vo.getSynopsis());
			ps.setString(6, vo.getPoster());
			result = ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.closeConnection(conn, ps);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}

	public MovieVO movieSelectList(int code) {
		MovieVO vo = new MovieVO();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from movie where code =? ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, code);
			rs =ps.executeQuery();
			
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

	public int movieUpdate(MovieVO vo) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update movie set title=?,  price=?, director=?, actor=?,  poster=?, synopsis=?"
				+ "where code =? ";
		
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
			result = ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.closeConnection(conn, ps);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	
	
}
