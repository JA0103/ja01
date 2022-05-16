package com.hom.naver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Naver {
	
	private Connection con;	//sql 연결
		private PreparedStatement psmt; //sql 문장 전송
		
		private final String URL = "jdbc:mysql://localhost:3306/naver?serverTimezone=UTC";
		
		//드라이버 등록 : 한번만 하면된다.
		public Naver() {
			try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
//				System.out.println("등록ok");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//연결
		public void getConnection() {
			try {
				con = DriverManager.getConnection(URL,"root","1234");  //경로, 아이디, 비번
//				System.out.println("연결ok");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//연결 해재
		public void disConnection() {
			try {
				
				if(psmt != null) psmt.close();
				if(con != null) con.close();
	
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//데이터 목록
		public void naverListData() {
			try {
				getConnection();
				String sql = "select * from news";
				
				psmt=con.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery();
				
				while(rs.next()) {
					System.out.println(rs.getInt(1) 
							+ ". <" + rs.getString(2)
							+ "> \n" + rs.getString(3) + " \n");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//추가
		public void naverInsert( String title, String content) {
			try {
				getConnection();
				String sql = "insert into news(title, content) "
						+"values(?,?)";
				
				psmt = con.prepareStatement(sql);
				
				psmt.setString(1, title);
				psmt.setString(2, content);
				
				psmt.executeUpdate();
				System.out.println("추가ok");
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
		}
		//선택
		public void naverSelect(int id) {
			try {
				
				getConnection();
				String sql = "select * from news where id = ? ";
				
				psmt = con.prepareStatement(sql);
				
				psmt.setInt(1, id);
				
				ResultSet rs = psmt.executeQuery();
				
				while(rs.next()) {
					System.out.println(rs.getInt(1) 
							+ ". <" + rs.getString(2)
							+ "> \n" + rs.getString(3) + " \n");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}

	public static void main(String[] args) throws IOException {
//		int pages =2;
//		
//		for(int i=1; i<=pages;i++) {
//		
//			String url = "https://news.naver.com/main/list.naver?mode=LS2D&sid2=249&sid1=102&mid=shm&date=20220516&page="+i;
//			
//			Document doc = Jsoup.connect(url).get();
//			
//			Elements elements = doc.getElementsByAttributeValue("class", "list_body newsflash_body");
//			Element element = elements.get(0);
//			 
//			Elements photoElements = element.getElementsByAttributeValue("class", "photo");
//			
//			for(int j=0; j<photoElements.size();j++) {
//				
//			Element articleElement = photoElements.get(j);
//			Elements aElements = articleElement.select("a");
//			Element aElement = aElements.get(0);
//			
//			String newsUrl = aElement.attr("href");		
//
//			//title
//			Element imgElement = aElement.select("img").get(0);
//			String imgUrl = imgElement.attr("src");
//			String title= imgElement.attr("alt");
//		
//			//content
//			Document detailDoc = Jsoup.connect(newsUrl).get();
//			Element contentElenment = detailDoc.getElementById("dic_area");
//			String content = contentElenment.text();
//			
//			Naver n = new Naver();
//			n.naverInsert(title, content);
//			 
//			}//for j
//		}//for i
		
		Naver n = new Naver();
//		n.naverListData();
		n.naverSelect(1);
		n.naverSelect(2);
		n.naverSelect(3);
	
		
	}//main

}
