package model.Place;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class PlaceDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	
	
	public PlaceDAO(ServletContext context) {
		try {
			Context ctx = new InitialContext();
			DataSource source= (DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/spring/toeic");
			conn=source.getConnection();
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	
	public void close(){
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {e.printStackTrace();}
	}


	public int insert(PlaceDTO dto){
		int affected=0;

		try{
			String sql="insert into place values(seq_place.nextval,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPostCode());
			psmt.setString(2, dto.getDistrict());
			psmt.setString(3, dto.getMihi());
			psmt.setString(4, dto.getAddr());
			psmt.setString(5, dto.getLatitude());
			psmt.setString(6, dto.getLongitude());
			
			affected = psmt.executeUpdate();
			
		} catch(Exception e){ e.printStackTrace();}
		return affected;
	}/////

	public int delete(String no){
		int affected=0;
		try{
			String sql="delete place where no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected = psmt.executeUpdate();
			
		} catch(Exception e){ e.printStackTrace();}
			
		return affected;
		
	}
	
	public List<PlaceDTO> select(Map parammap){
		List<PlaceDTO> list = new Vector<PlaceDTO>();
		String sql="select * from (select a.*, rownum r from(select no,postname,district,mihi,addr from place e join post t ON e.postcode= t.postcode "; 	
			
		if(parammap.get("searchColumn") != null){
			sql+=" where "+parammap.get("searchColumn")+" like '%"+parammap.get("searchWord")+"%')a)where r between ? and ?";
		}
		else{
			
			sql+=" where e.postcode="+parammap.get("postcode")+")a)where r between ? and ?";
		}
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(parammap.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(parammap.get("end").toString()));
			
			rs = psmt.executeQuery();
			
			while(rs.next()){
				PlaceDTO dto = new PlaceDTO();
				dto.setNo(rs.getString(1));
				dto.setPostName(rs.getString(2));
				dto.setDistrict(rs.getString(3));
				dto.setMihi(rs.getString(4));
				dto.setAddr(rs.getString(5));
				list.add(dto);
			}
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
	}/////
	
	public int edit(PlaceDTO dto){
		int affected = 0;
		
		try{
			String sql="update place set postCode=?,district=?,mihi=?,addr=?,latitude=?,longitude=? where no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPostCode());
			psmt.setString(2, dto.getDistrict());
			psmt.setString(3, dto.getMihi());
			psmt.setString(4, dto.getAddr());
			psmt.setString(5, dto.getLatitude());
			psmt.setString(6, dto.getLongitude());
			psmt.setString(7, dto.getNo());
			
			affected = psmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return affected;
		
	}


	public int TotalRowCount(Map parammap) {
		int totalRecordCount = 0;
		
		try{
			String sql="select count(*) from place e join post t on e.postcode=t.postcode ";
			if(parammap.get("searchColumn") != null){
				
				sql+=" where "+parammap.get("searchColumn")+" like '%"+parammap.get("searchWord")+"%'";
			}
			else{
				sql+=" where e.postcode="+parammap.get("postcode");
			}
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalRecordCount = rs.getInt(1);
		}catch(Exception e){
			e.printStackTrace();
		}
		return totalRecordCount;
	}


	
	
	
	
	
	
	
	
	
	
}
