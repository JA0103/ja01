package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardUpateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setEmail(email);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setPass(pass);
		vo.setNum(num);
		
		System.out.println("content : " + vo.getContent());
		
		BoardDAO dao = BoardDAO.getinstance();
		dao.updateBoard(vo);
		
		new BoardListAction().execute(request, response);
		
	}

}
