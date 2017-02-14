package model.Place;

public class PlaceDTO {

	private String no;
	private String postCode;
	private String district;
	private String mihi;
	private String addr;
	private String postName;
	private String latitude;   //위도
	private String longitude;  //경도
	
	public PlaceDTO() {	}
	
	public PlaceDTO(String no, String postCode, String district, String mihi, String addr, String postName,
			String latitude, String longitude) {
		super();
		this.no = no;
		this.postCode = postCode;
		this.district = district;
		this.mihi = mihi;
		this.addr = addr;
		this.postName = postName;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getMihi() {
		return mihi;
	}
	public void setMihi(String mihi) {
		this.mihi = mihi;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
	
}
