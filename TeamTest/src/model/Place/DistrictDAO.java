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

public class DistrictDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public DistrictDAO(ServletContext context) {
		try{
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/spring/toeic");
			conn=source.getConnection();
		}catch(Exception e){e.printStackTrace();}
	}///////////////////

	public void close(){
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {e.printStackTrace();}
	}/////////////////
	
	public int insert(DistrictDTO dto ){
		int affected=0;
		try{
			
			String sql="insert into district values(seq_district.nextval,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getDistrictName());
			psmt.setString(2, dto.getPostCode());
			affected = psmt.executeUpdate();
		}catch(Exception e){e.printStackTrace();}
		return affected;	
		
	}//////////////
	
	
	public List<DistrictDTO> selectDistrict(String pcdt){
		List<DistrictDTO> lists = new ArrayList<DistrictDTO>();
		try{
			String sql="select d.districtname from post p join district d on p.postcode= d.postcode where p.postcode=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pcdt);
			rs = psmt.executeQuery();
			while(rs.next()){
				DistrictDTO dto = new DistrictDTO();
				dto.setDistrictName(rs.getString(1));
				lists.add(dto);
			}
			
		}catch(Exception e){e.printStackTrace();}

		return lists;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


























































