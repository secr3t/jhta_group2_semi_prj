package pro.lecturer.vo;

public class Lecturer {

	private int no;
	private String name;
	private String email;
	private String pwd;
	private String phone;
	private String career;
	private String picture;
	private String permit;
	private String type;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "Lecturer [no : " + no + ", name : " + name + ", email : " + email + ", pwd : " + pwd + ", phone : "
				+ phone + ", career : " + career + ", picture : " + picture + ", permit : " + permit + ", type : "
				+ type + "]";
	}
}
