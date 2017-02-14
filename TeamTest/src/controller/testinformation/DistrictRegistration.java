package controller.testinformation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Place.DistrictDAO;
import model.Place.DistrictDTO;

public class DistrictRegistration extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String postCode = req.getParameter("postCode");
		String districtName = req.getParameter("districtName");
		
		DistrictDTO dto = new DistrictDTO();
		dto.setDistrictName(districtName);
		dto.setPostCode(postCode);
		
		DistrictDAO dao = new DistrictDAO(req.getServletContext());
		
		int affected =	dao.insert(dto);
		
		dao.close();
		
		
		
		
		req.getRequestDispatcher("/TestInformation/District.jsp").forward(req, resp);
	}
	
	
}
