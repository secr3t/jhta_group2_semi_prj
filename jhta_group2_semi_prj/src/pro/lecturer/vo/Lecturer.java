package pro.lecturer.vo;

import pro.user.vo.User;

public class Lecturer extends User{
	
	private String career;
	private String picture;
	private String permit;
	
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
	
	@Override
	public String toString() {
		return "Lecturer [no : " + getNo() + ", name : " + getName() + ", email : " + getEmail() + ", pwd : " + getPwd() + ", phone : "
				+ getPhone() + ", career : " + career + ", picture : " + picture + ", permit : " + permit + ", type : "
				+getType() + "]";
	}
}
