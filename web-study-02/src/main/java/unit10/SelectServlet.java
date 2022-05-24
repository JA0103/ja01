package unit10;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String job=request.getParameter("job");
		String interest[] = request.getParameterValues("interest");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.println("당신이 선택한 직업 : <b>");
		out.print(job);
		
		out.print("</b><hr>당신이 선택한 관심분야 : <b>");
		if(interest==null) {
			out.println("선택한 항목이 없습니다.");
		}
			
	}
}
