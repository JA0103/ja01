package unit06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CalServlet")
public class CalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
		}catch(Exception e) {
			PrintWriter out = response.getWriter();
			out.print("다시 입력해주십시오."); 
			out.print("<a href= \"web-study-02/CalTest.jsp\"> ");
		}
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		PrintWriter out = response.getWriter();
		out.println("name : " + name);
		out.print("<br>");
		out.println(num1 + " + " + num2 + " = " + (num1+num2));
		out.print("<br>");
		out.println(num1 + " - " + num2 + " = " + (num1-num2));
		out.print("<br>");
		out.println(num1 + " * " + num2 + " = " + (num1*num2));
		out.print("<br>");
		out.println(num1 + " / " + num2 + " = " + (num1/num2));
		out.print("<br>");
		
	}

}
