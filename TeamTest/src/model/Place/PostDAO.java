package model.Place;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class PostDAO {


	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	public PostDAO(ServletContext context) {
		
		try{
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/spring/toeic");
			conn=source.getConnection();
		}catch(Exception e){e.printStackTrace();}
	}//////
	
	
	public void close(){
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {e.printStackTrace();}
	}/////////////////
	
	
	public List<PostDTO> postSeletAll(){
		
		List<PostDTO> postList = new ArrayList<PostDTO>();
		
		try{
			String sql="select * from post order by postCode asc";
			psmt = conn.prepareStatement(sql);	
			rs = psmt.executeQuery();
			while(rs.next()){
				PostDTO dto = new PostDTO();
				dto.setPostCode(rs.getString(1));
				dto.setPostName(rs.getString(2));
				postList.add(dto);
			}
			
			
		}catch(Exception e){e.printStackTrace();}
		
		
		return postList;
	}//
	
	
	public int postInsert(String postCode,String postName){
		int affected=0;
		try{
			String sql="insert into post values(?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, postCode);
			psmt.setString(2, postName);
			affected = psmt.executeUpdate();
			
			
		}catch(Exception e){e.printStackTrace();}
		
		return affected;
	}
	
	public int postDelete(String postCode){
		int affected=0;
		try{
			String sql="delete post where postCode=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, postCode);
			affected = psmt.executeUpdate();
			
			
		}
		catch(Exception e){e.printStackTrace();}
		
		return affected;
	}
	
	
	
	
}///
















































































