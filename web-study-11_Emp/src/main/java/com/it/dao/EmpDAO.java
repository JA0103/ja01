package com.it.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

import com.it.dto.EmpVO;

import util.DBManager;

public class EmpDAO {
	private EmpDAO() {}
	
	private static EmpDAO instance = new EmpDAO();
	
	public static EmpDAO getinstance() {
		return instance;
	}

	public List<EmpVO> SelectAllEmp() {
		List<EmpVO> list = new ArrayList<EmpVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from employees order by enter desc ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setId(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setLev(rs.getString(4));
				vo.setEnter(rs.getTimestamp(5));
				vo.setGender(rs.getString(6));
				vo.setPhone(rs.getString(7));
			
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps, rs);
		}
		
		return list;
	}

	public void insertEmp(EmpVO vo) {
	
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into EMPLOYEES(id, pass, name, lev, gender, phone) "
				+ "values(?,?,?,?,?,?) ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPass());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getLev());
			ps.setString(5, vo.getGender());
			ps.setString(6, vo.getPhone());
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps);
		}
		
	}

	public EmpVO SelectOneEmp(String id) {
		EmpVO vo = new EmpVO();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from employees where id=? ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setLev(rs.getString(4));
				vo.setEnter(rs.getTimestamp(5));
				vo.setGender(rs.getString(6));
				vo.setPhone(rs.getString(7));
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps, rs);
		}
		
		
		return vo;
	}

	public void updateEmp(EmpVO vo, String preID) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update employees set id=?, pass=?, name=?, lev=?, gender=?, phone=? "
				+ "where id=? ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPass());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getLev());
			ps.setString(5, vo.getGender());
			ps.setString(6, vo.getPhone());
			ps.setString(7, preID);
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps);
		}
		
	
	}

	public void deleteEmp(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "delete employees where id=? ";
		
		try {
			
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.closeConnection(conn, ps);
		}
		
	}

	
	
}//
