package com.springbook.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;


@Controller
public class LogoutController  {

	@RequestMapping("logout.do")
	public String handleRequest(HttpSession session ) {
		
		System.out.println("로그아웃처리");
        
        session.invalidate();
    	
        return("login.jsp");
		
	}

}
