package com.it.main;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import com.it.dao.*;
public class SeoulMain {

	public static void main(String[] args) {
        SeoulMain sm = new SeoulMain();
        //sm.seoulAttractions();
        //sm.seoulNature();
        sm.seoulHotel();
	}
	
	public void seoulAttractions()
	{
		DataDAO dao=new DataDAO();
		try
		{
			int k=1;
			for(int i=1;i<=35;i++)
			{
			   Document doc=Jsoup.connect("https://korean.visitseoul.net/attractions?curPage="+i).get(); 
			   Elements poster=doc.select("ul.article-list li.item div.thumb"); 
			   Elements comment=doc.select("ul.article-list li.item div.infor-element span.text-dot-d");
			   Elements link=doc.select("ul.article-list li.item a");
			   Elements title=doc.select("ul.article-list li.item div.infor-element span.title");
			   for(int j=0;j<poster.size();j++)
			   {
				   try{
					   System.out.println("번호:"+k);
					   System.out.println(title.get(j).text());
					   //text() : HTML에서 텍스트만 불러옴(자바스크립트 코드는 생략된다.)
					   System.out.println(poster.get(j).attr("style")); 
					   //attr("style") : element attr메서드를 통해 필요한부분(style)만 가져올 수 있습니다. 
					   System.out.println(comment.get(j).text());
					   System.out.println(link.get(j).attr("href"));

					   Document doc2=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
					   Element address=doc2.select("div.detail-map-infor:eq(1) dl dd").get(0);
					   //eq() : index 값을 사용해 원하는 위치의 요소를 선택해 가져올 수 있는 선택자 메소드.
					   System.out.println("주소:"+address.text());
					   System.out.println("=========================================================");
				       
					   //DB저장
					   SeoulLocationVO vo=new SeoulLocationVO();//SeoulLocationVO 객체 생성
					   vo.setNo(k); //숫자 1부터  SeoulLocationVO 변수에 저장
					   vo.setTitle(title.get(j).text()); //title을 차례대로 글자만 가져와서 set.
					   vo.setMsg(comment.get(j).text()); //comment도 차례대로 글자만 가져와서 set
					   String image=poster.get(j).attr("style"); //이미지 url을 스트링 변수 image에 차례대로 넣어준다. 
					   image=image.substring(image.indexOf("(")+1,image.lastIndexOf(")"));
					   //substring : 문자열 자르는 메소드 (시작,끝) 시작은 포함-> +1을 해줌. 끝은 미포함.
					   //"(" 와 ")" 사이의 문자열을 잘라서 image에 저장
					   // style="background-image:url(/comm/getImage?srvcId=POST&amp;parentSn=5548&amp;fileTy=POSTTHUMB&amp;fileNo=1&amp;thumbTy=M)"
					   image="https://korean.visitseoul.net"+image;
					   vo.setPoster(image); 
					   vo.setAddress(address.text());
					   dao.seoulLocationInsert(vo);// 디비에 넣어줌
					   k++;
				   }catch(Exception ex) {}
			   }
			}
		}catch(Exception ex){}
	}
	
	public void seoulHotel()
	{
		DataDAO dao=new DataDAO();
		try
		{
			int k=1;
			for(int i=1;i<=33;i++)
			{
			   Document doc=Jsoup.connect("https://korean.visitseoul.net/hotels?curPage="+i).get();
			   Elements poster=doc.select("ul.article-list li.item div.thumb img");
			   Elements link=doc.select("ul.article-list li.item a");
			   Elements title=doc.select("ul.article-list li.item div.infor-element span.title");
			   Elements score=doc.select("div.infor-element-inner span.trip-ico img");
			   for(int j=0;j<poster.size();j++)
			   {
				   try {
						   System.out.println("번호:"+k);
						   System.out.println(title.get(j).text());
						   System.out.println(poster.get(j).attr("src"));
						   System.out.println(link.get(j).attr("href"));
						   System.out.println("score-alt" + score.get(j).attr("alt"));
						   Document doc2=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
						   Element address=doc2.select("div.detail-map-infor dl dd").get(0);
						   Elements images=doc2.select("div.wide-slide div.item");
						   String simg="";
						   for(int m=0;m<images.size();m++)
						   {
							   System.out.println(images.get(m).attr("style"));
							   String temp=images.get(m).attr("style");
							   // background-image:url(http://media-cdn.tripadvisor.com/media/photo-s/10/f5/38/a8/twin-rom--v17512289.jpg)"
							   // http://media-cdn.tripadvisor.com/media/photo-s/10/f5/38/a8/twin-rom--v17512289.jpg
							   temp=temp.substring(temp.indexOf("(")+1,temp.lastIndexOf(")"));
							   simg+=temp+"^";
						   }
						   simg=simg.substring(0,simg.lastIndexOf("^"));
						   System.out.println("주소:"+address.text());
						   
						   System.out.println("=========================================================");
					       SeoulHotelVO vo=new SeoulHotelVO();
					       vo.setNo(k);
					       vo.setName(title.get(j).text());
					       vo.setAddress(address.text());
					       vo.setPoster(poster.get(j).attr("src"));
					       String s=score.get(j).attr("alt");
					       // alt=""  평점:4.5
					       s=s.substring(s.indexOf(":")+1);
//					       vo.setScore(Double.parseDouble(s.trim()));
					       vo.setScore(0.0);
					       vo.setImages(simg);
					       dao.seoulHotelInsert(vo);
						   k++;
				   }catch(Exception ex) {
					   ex.printStackTrace();
				   }
			   }
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	/*
	 *  NO      NOT NULL NUMBER         
		TITLE   NOT NULL VARCHAR2(200)  
		POSTER  NOT NULL VARCHAR2(300)  
		MSG     NOT NULL VARCHAR2(4000) 
		ADDRESS NOT NULL VARCHAR2(300)
	 */
	public void seoulNature()
	{
		DataDAO dao=new DataDAO();
		try
		{
			int k=1;
			for(int i=1;i<=14;i++)
			{
			   Document doc=Jsoup.connect("https://korean.visitseoul.net/nature?curPage="+i).get();
			   
			   Elements poster=doc.select("ul.article-list li.item div.thumb");
			   Elements comment=doc.select("ul.article-list li.item div.infor-element span.text-dot-d");
			   Elements link=doc.select("ul.article-list li.item a");
			   Elements title=doc.select("ul.article-list li.item div.infor-element span.title");
			   for(int j=0;j<poster.size();j++)
			   {
				  try
				  {
				   System.out.println("번호:"+k);
				   System.out.println(title.get(j).text());
				   System.out.println(poster.get(j).attr("style"));
				   System.out.println(comment.get(j).text());
				   System.out.println(link.get(j).attr("href"));
				   Document doc2=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
				   /*
				    *   <div class="detail-map-infor"> :eq(0)
				    *     <dl>
				    *     </dl>
				    *   </div>
				    *   <div class="detail-map-infor"> :eq(1)
				    *     <dl>
				    *     </dl>
				    *   </div>
				    *   <div class="detail-map-infor"> :eq(2)
				    *     <dl>
				    *     </dl>
				    *   </div>
				    */
				   Element address=doc2.select("div.detail-map-infor:eq(1) dl dd").get(0);
				   System.out.println("주소:"+address.text());
				   System.out.println("=========================================================");
			       SeoulNatureVO vo=new SeoulNatureVO();
			       vo.setNo(k);
			       vo.setTitle(title.get(j).text());
			       vo.setAddress(address.text());
			       vo.setMsg(comment.get(j).text());
			       String s=poster.get(j).attr("style");
			       s=s.substring(s.indexOf("(")+1,s.lastIndexOf(")"));
			       s="https://korean.visitseoul.net"+s;
			       vo.setPoster(s);
			       dao.seoulNatureInsert(vo);
				   k++;
				  }catch(Exception ex) {}
			   }
			}
		}catch(Exception ex){}
	}

}
