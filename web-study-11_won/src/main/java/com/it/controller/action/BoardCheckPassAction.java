package com.it.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.*;
import com.it.dto.*;
public class BoardCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String url = null;
		
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");
		
		
		System.out.println("num : " + num);
		System.out.println("pass : " + pass);
		BoardDAO bDao = BoardDAO.getInstance();
		BoardVO bVo = bDao.selectOneBoardByNum(num);
		System.out.println("bVo" + bVo);
		
		if(bVo.getPass().equals(pass)) {
			url="/board/checkSuccess.jsp";
		}else {
			url="/board/boardCheckSuccess.jsp";
			request.setAttribute("message","비밀번호가 틀렸습니다");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
