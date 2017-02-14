package controller.testinformation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class NewFileController extends HttpServlet{

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
	
		System.out.println("들어오나요");
		
		
	
		req.getRequestDispatcher("/NewFile.jsp").forward(req, resp);
	}
	
}
