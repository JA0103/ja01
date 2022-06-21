package com.it.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.EmpDAO;
import com.it.dto.EmpVO;

public class EmpListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/emp/empList.jsp";
		
		EmpDAO dao = EmpDAO.getinstance();
		List<EmpVO> emplist = dao.SelectAllEmp();
		request.setAttribute("empList", emplist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
