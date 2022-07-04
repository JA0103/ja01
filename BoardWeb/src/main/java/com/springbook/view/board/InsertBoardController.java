package com.springbook.view.board;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class InsertBoardController{

	@RequestMapping("/insertBoard.do")
	public String handleRequest(BoardVO vo, BoardDAO boardDAO) {
		
		System.out.println("글 등록 처리");

//     	request.setCharacterEncoding("utf-8");
     	
     	boardDAO.insertBoard(vo);
     	return "getBoardList.do";
     	
	}
	
}
