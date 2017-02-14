package controller.testinformation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class tr extends HttpServlet{

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {

	
		String arr =	req.getParameter("aa");
		String[] array = arr.split(",");
		System.out.println(array[0]);
		System.out.println(array[1]);
		
		
		
		
		RequestDispatcher dis =	req.getRequestDispatcher("/TestInformation/Place.jsp");
		dis.forward(req, resp);
	}
	
}
