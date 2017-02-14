package controller.testinformation;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.glass.ui.Application;

import model.Place.PagingUtil;
import model.Place.PlaceDAO;
import model.Place.PlaceDTO;
import model.Place.PostDAO;
import model.Place.PostDTO;

public class PlaceListController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
		
			
			
			
			
			
			
			String searchColumn = req.getParameter("searchColumn");
			String searchWord = req.getParameter("searchWord");
			String postcode = req.getParameter("postcode");   //지역코드
			String pagingString ="";
			PlaceDAO dao = new PlaceDAO(req.getServletContext());  //오라클로딩
			
			//페이지사이즈
			int pageSize = Integer.parseInt(req.getServletContext().getInitParameter("PAGE_SIZE"));
			//블락페이지
			int blockPage = Integer.parseInt(req.getServletContext().getInitParameter("BLOCK_PAGE"));
			int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
			//시작 및 끝 ROWNUM 구하기
			int start = (nowPage-1)*pageSize+1;
			int end = nowPage*pageSize;
			Map parammap = new HashMap();
			
			parammap.put("pageSize", pageSize);
			parammap.put("nowPage", nowPage);
			parammap.put("start", start);
			parammap.put("end",end);
			parammap.put("searchColumn", searchColumn);
			parammap.put("searchWord", searchWord);
			parammap.put("postcode", postcode);
			
			int totalRecordCount = dao.TotalRowCount(parammap);
			int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
			List<PlaceDTO> lists=null;
			
			if(searchColumn != null){
				pagingString=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/Place/List.do?searchColumn="+searchColumn+"&searchWord="+searchWord);
			}
			else{
				pagingString=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/Place/List.do?postcode="+postcode);
			}
			lists = dao.select(parammap); 
			parammap.put("totalPage", totalPage);
			parammap.put("totalRecordCount", totalRecordCount);
			
			req.setAttribute("lists", lists);
			req.setAttribute("map", parammap);
			req.setAttribute("pagingString", pagingString);
			dao.close();	
			
			PostDAO postDAO = new PostDAO(req.getServletContext()); 
			List<PostDTO> postList = postDAO.postSeletAll();
			req.setAttribute("postList", postList);
			postDAO.close();
			
			
			RequestDispatcher dis =	req.getRequestDispatcher("/TestInformation/Place.jsp");
			dis.forward(req, resp);
	}///protected 


	
	
	
	
	
	
	
	
}///////////////////////////////////////////////////////

























