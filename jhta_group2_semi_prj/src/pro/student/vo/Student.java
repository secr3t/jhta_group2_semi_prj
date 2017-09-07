package pro.student.vo;

import pro.user.vo.User;

public class Student extends User{

	private int point;
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "Student [no : " + getNo() + ", name : " + getName() + ", email : " + getEmail() + ", pwd : " + getPwd() + ", phone : "
				+ getPhone() + ", point : " + point + ", type : " + getType() + "]";
	}
}
