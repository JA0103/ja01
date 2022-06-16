package com.it.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.EmpDAO;
import com.it.dto.EmpVO;

public class EmpInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String lev = request.getParameter("lev");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		
		EmpVO vo = new EmpVO();
		vo.setId(id);
		vo.setPass(pass);
		vo.setName(name);
		vo.setLev(lev);
		vo.setGender(gender);
		vo.setPhone(phone);
		
		EmpDAO dao = EmpDAO.getinstance();
		dao.insertEmp(vo);
		
		new EmpListAction().execute(request, response);
		
	}

}
