package controller.testinformation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Place.PostDAO;
import model.Place.PostDTO;

public class PlaceMainController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PostDAO dao = new PostDAO(req.getServletContext());
		
		List<PostDTO> postList = dao.postSeletAll();
		dao.close();
		
		req.setAttribute("postList", postList);
	
		req.getRequestDispatcher("/TestInformation/Place.jsp").forward(req, resp);
	}
	
	
}
