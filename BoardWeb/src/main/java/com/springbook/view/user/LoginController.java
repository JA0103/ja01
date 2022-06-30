package com.springbook.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;
import com.springbook.view.controller.Controller;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		 //1.클라이언트의 요청 path 정보를 추출한다.
	      String uri = request.getRequestURI();
	      String path = uri.substring(uri.lastIndexOf("/"));
	      System.out.println(path);
	      
	      //2.클라이언트의 요청 path에 따라 적절히 분기처리한다.
	      
	         System.out.println("로그인처리");
	         
	         String id = request.getParameter("id");
	         String password = request.getParameter("password");
	         
	         UserVO vo = new UserVO();
	         vo.setId(id);
	         vo.setPassword(password);
	         
	         UserDAO userDAO = new UserDAO();
	     	UserVO user = userDAO.getUser(vo);
	     	
	     	//3.화면 네비게이션
	     	if(user != null){
	     		return "getBoardList.do";
	     	}else{
	     		return "login";
	     	}
		
	}
	
}
