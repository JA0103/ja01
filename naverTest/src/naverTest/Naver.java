package naverTest;
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
				
				Class.forName("com.mysql.cj.jdbd.Driver");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//연결
		public void getConnection() {
			try {
				con = DriverManager.getConnection(URL,"root","1234");
				System.out.println("연결");
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
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		public void naverInsert( String title, String content) {
			try {
				getConnection();
				String sql = "insert into news(title, content) "
						+"values(?,?)";
				
				psmt = con.prepareStatement(sql);
				
				psmt.setString(1, title);
				psmt.setString(2, content);
				
				psmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
		}



	public static void main(String[] args) {
//		int pages =1;
//		
//		for(int i=1; i<pages;i++) {
//		
//			String url = "https://news.naver.com/main/list.naver?mode=LS2D&sid2=249&sid1=102&mid=shm&date=20220509&page="+i;
//			
//			Document doc = null;
//			try {
//				doc = Jsoup.connect(url).get();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			Elements elements = doc.getElementsByAttributeValue("class", "list_body newsflash_body");
//			Element element = elements.get(0);
//			//System.out.println(element);
//			 
//			Elements photoElements = element.getElementsByAttributeValue("class", "photo");
//			//System.out.println(photoElements);
//			
//			for(int j=0; j<photoElements.size();j++) {
//				
//			Element articleElement = photoElements.get(j);
//			//System.out.println(articleElement);
//			Elements aElements = articleElement.select("a");
//			Element aElement = aElements.get(0);
//			//System.out.println(aElements);
//			
//			String newsUrl = aElement.attr("href");		
//			//System.out.println(newsUrl);
//			
//			Element imgElement = aElement.select("img").get(0);
//			String imgUrl = imgElement.attr("src");
//			//System.out.println(imgUrl);
//			
//			String title= imgElement.attr("alt");
//			//System.out.println(title);
//			
//			Document detailDoc = null;
//			try {
//				detailDoc = Jsoup.connect(newsUrl).get();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			Element contentElenment = detailDoc.getElementById("dic_area");
//			String content = contentElenment.text();
////			
//			System.out.println(title);
//			System.out.println(content);
//			System.out.println();
//			
//			Naver n = new Naver();
//			n.naverInsert(title, content);
//			 
//			}//for j
//		}//for i
		
		Naver n = new Naver();
//		n.naverListData();
		n.getConnection();
	}//main

}
