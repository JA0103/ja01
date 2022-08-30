package com.it.controller.action;

import java.io.IOException;

import com.it.dao.*;
import com.it.dto.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException 
	{
			BoardVO bVo = new BoardVO();
			
			bVo.setName(request.getParameter("name"));
			bVo.setPass(request.getParameter("pass"));
			bVo.setEmail(request.getParameter("email"));
			bVo.setTitle(request.getParameter("title"));
			bVo.setContent(request.getParameter("content"));
			
			BoardDAO bDao = BoardDAO.getInstance();
			bDao.insertBoard(bVo);
			
			new BoardListAction().execute(request, response);
			}

	}


