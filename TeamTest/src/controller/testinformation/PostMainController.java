package controller.testinformation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Place.PostDAO;
import model.Place.PostDTO;

public class PostMainController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		String insertPostCode	= req.getParameter("insertPostCode");
		String InsertPostName = req.getParameter("InsertPostName");
		String deletePostCode = req.getParameter("deletePostCode");
		
		PostDAO postDAO = new PostDAO(req.getServletContext()); 
		List<PostDTO> postList = postDAO.postSeletAll();
		req.setAttribute("postList", postList);
		
		if(insertPostCode != null){
			int affected =	postDAO.postInsert(insertPostCode, InsertPostName);
		}
		
		if(deletePostCode != null){
			int affected = postDAO.postDelete(deletePostCode);
		}
		
		
		
		postDAO.close();
		
		req.getRequestDispatcher("/TestInformation/post.jsp").forward(req, resp);
	}
	
	
}
