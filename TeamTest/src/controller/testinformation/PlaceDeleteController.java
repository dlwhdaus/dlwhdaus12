package controller.testinformation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import model.Place.PlaceDAO;

public class PlaceDeleteController extends HttpServlet{

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
	
		 String no = req.getParameter("delete");
		 
		 PlaceDAO dao = new PlaceDAO(req.getServletContext());
		 
		 int affected =	dao.delete(no);
		 
		 dao.close();
		 
		 RequestDispatcher dis =	req.getRequestDispatcher("/TestInformation/Place.jsp");
	  	 dis.forward(req, resp);
	
	}
	
}
