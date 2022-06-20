package com.ezen.mybatis;

import java.io.IOException;
import java.io.InputStream;

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
				
			  BoardVO vo = mapper.selectOne(1);
			  System.out.println(vo.getId());
			  System.out.println(vo.getName());
			  System.out.println(vo.getPhone());
			  System.out.println(vo.getAddress());
			  
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		/*
		 * 
		 */
		
	}

}
