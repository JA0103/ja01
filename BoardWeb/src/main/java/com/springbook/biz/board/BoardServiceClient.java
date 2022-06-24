package com.springbook.biz.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BoardServiceClient {

	public static void main(String[] args) {
		//1. Spring 컨테이너를 구동한다.
		AbstractApplicationContext container = 
				new GenericXmlApplicationContext("applicationContext.xml");

		//2. Spring 컨테이너로부터 BoardServiceImpl 객체를 Lookup 한다.
		BoardService boardService = (BoardService)container.getBean("boardService");
		
		BoardVO vo = new BoardVO();
		vo.setSeq(100);
		vo.setTitle("스프링");
		vo.setWriter("홍길동7");
		vo.setContent("임시 내용~~~~~~~,,,,");
		boardService.insertBoard(vo);
		
		List<BoardVO> list = boardService.getBoardList(vo);
		for(BoardVO board : list)
			System.out.println(board);
		
		
		container.close();
		
		
		
		
	}

}
