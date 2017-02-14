package controller.testinformation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class aaController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		System.out.println(req.getParameter("subject"));
		System.out.println(req.getParameter("contents"));
		
		
		System.out.println("성공");
		
		req.getRequestDispatcher("NewFile.jsp").forward(req, resp);
		
		
		
		
		
	}
	
	
}
