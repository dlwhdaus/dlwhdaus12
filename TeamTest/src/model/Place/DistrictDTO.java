package model.Place;

public class DistrictDTO {

	private String no;
	private String districtName;
	private String postCode;
	
	
	public DistrictDTO() {}


	public DistrictDTO(String no, String districtName, String postCode) {
		super();
		this.no = no;
		this.districtName = districtName;
		this.postCode = postCode;
	}


	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getDistrictName() {
		return districtName;
	}


	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}


	public String getPostCode() {
		return postCode;
	}


	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	
	
	
	
}
