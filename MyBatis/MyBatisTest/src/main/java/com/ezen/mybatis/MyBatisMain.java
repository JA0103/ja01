package com.ezen.mybatis;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisMain {

	public static void main(String[] args) {
		String resource = "com/ezen/mybatis/mybatis-config.xml";
		InputStream inputStream=null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
			  SqlSession session = sqlSessionFactory.openSession(); 
			  System.out.println("sqlSessionFactory : "+sqlSessionFactory);
			  System.out.println("session : "+session);
			  BoardMethod mapper = session.getMapper(BoardMethod.class);
				
//			  BoardVO vo = mapper.selectOne(1);
			  
//			  mapper.deleteBoard(5);
//			  mapper.insertBoard(vo);
			  
			  BoardVO vo = new BoardVO();
			  vo.setId(5);
			  vo.setName("김진아");
			  vo.setPhone("010-1111-2222");
			  vo.setAddress("경기도 수원시");
			  
			  mapper.updateBoard(vo);
			  
			  session.commit();
			  
			  
			  List<BoardVO> list = mapper.selectAllMember();
			  for( BoardVO vo2 : list)
				  System.out.println(vo2.toString());
			  
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
