package controller.testinformation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import model.Place.PlaceDAO;
import model.Place.PlaceDTO;

public class PlaceEditController extends HttpServlet{
	
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		String key = req.getParameter("key");
		String postCode = req.getParameter("postCode");
		String district = req.getParameter("district");
		String mihi = req.getParameter("mihi");
		String addr = req.getParameter("addr");
		String latitude = req.getParameter("latitude");
		String longitude = req.getParameter("longitude");
		
		PlaceDTO dto = new PlaceDTO();
		dto.setNo(key);
		dto.setPostCode(postCode);
		dto.setDistrict(district);
		dto.setMihi(mihi);
		dto.setAddr(addr);
		dto.setLatitude(latitude);
		dto.setLongitude(longitude);
		
		PlaceDAO dao = new PlaceDAO(req.getServletContext());
		int affected = dao.edit(dto);
		
		req.getRequestDispatcher("/TestInformation/Place.jsp").forward(req, resp);
	}

}

































































