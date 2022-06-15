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
		String sql = "select * from employees ";
		
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

	
	
}//
