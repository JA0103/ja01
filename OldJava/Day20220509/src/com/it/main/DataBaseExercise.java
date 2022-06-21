package com.it.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DataBaseExercise {

	private Connection con2;   
	private PreparedStatement psmt2;
	
	private final String URL = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
	
	//드라이버 등록	
	public DataBaseExercise() {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//연결	
	public void getConnection() {
		try {
			
			con2 = DriverManager.getConnection(URL,"root","1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//연결 해재
	public void disConnection() {
		
		try {
			
			if(psmt2 != null) psmt2.close();
			if(con2 != null) con2.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void mydbdbListData() {
		
		try {
			
			//1. MySql 연결
			getConnection();
			
			//2. SQL 문장 작성
			String sql2 = "select * from member";
			
			//3. MySql로 SQL 문장 전송
			psmt2=con2.prepareStatement(sql2);
			
			//4. 실행결과를 받아 온다.
			ResultSet rs = psmt2.executeQuery();
			
			//5. 결과를 출력
			while(rs.next()) {
				System.out.println(rs.getInt(1)
						+ ", " + rs.getString(2)
						+ ", " + rs.getString(3)
						+ ", " + rs.getString(4) + " ");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
	}
	
	
	public static void main(String[] args) {
		DataBaseExercise dbdb = new DataBaseExercise();
		dbdb.getConnection();
		dbdb.mydbdbListData();
	}

}
