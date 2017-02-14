package model.Place;

public class PostDTO {

	private String postCode;
	private String postName;
	
	
	
	public PostDTO() {}



	public PostDTO(String postCode, String postName) {
		this.postCode = postCode;
		this.postName = postName;
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
	
	
	
	
	
	
}
