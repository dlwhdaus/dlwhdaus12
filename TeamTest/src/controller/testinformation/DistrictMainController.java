package controller.testinformation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Place.DistrictDAO;
import model.Place.DistrictDTO;
import model.Place.PostDAO;
import model.Place.PostDTO;

public class DistrictMainController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		req.setCharacterEncoding("UTF-8");
		
		PostDAO postDAO = new PostDAO(req.getServletContext()); 
		List<PostDTO> postList = postDAO.postSeletAll();
		req.setAttribute("postList", postList);
		postDAO.close();
	
		String postCode = req.getParameter("postCode");
		String districtName = req.getParameter("districtName");
		String pcdt = req.getParameter("pcdt");
		String deleteDistrict = req.getParameter("deleteDistrict");
		
		
		DistrictDAO dao = new DistrictDAO(req.getServletContext());
		
		if(postCode != null){
			DistrictDTO	dto = new DistrictDTO();
			
			dto.setDistrictName(districtName);
			
			dto.setPostCode(postCode);
			
			int affected =	dao.insert(dto);
		}
		
		if(pcdt != null){
			System.out.println("pcdt="+pcdt);
			
			
		}
		
		
		/*
		if(pcdt != null){
			System.out.println("pcdt="+pcdt);
			List<DistrictDTO> pcdtdto = dao.selectDistrict(pcdt);
			req.setAttribute("pcdtdto", pcdtdto);
			
		}
		
		if(deleteDistrict != null){
			
		}*/
		
		dao.close();
		req.getRequestDispatcher("/TestInformation/District.jsp").forward(req, resp);
	}
	
	
}




































