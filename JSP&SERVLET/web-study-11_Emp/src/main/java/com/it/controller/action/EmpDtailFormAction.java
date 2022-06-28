package com.it.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.EmpDAO;
import com.it.dto.EmpVO;

public class EmpDtailFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/emp/empDetail.jsp";
		String id = request.getParameter("id");
		
		EmpDAO dao = EmpDAO.getinstance();
		EmpVO vo = dao.SelectOneEmp(id);
		
		request.setAttribute("emp", vo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
