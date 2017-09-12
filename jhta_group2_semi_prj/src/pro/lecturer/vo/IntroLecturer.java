package pro.lecturer.vo;

public class IntroLecturer {
	
	private String lecturerPictureUrl;
	private String lecturerName;
	private String lecturerCareer;
	private String lecturerEmail;
	private String deptName;
	private int lecturerNo;
	
	public int getLecturerNo() {
		return lecturerNo;
	}
	public void setLecturerNo(int lecturerNo) {
		this.lecturerNo = lecturerNo;
	}
	
	public String getLecturerPictureUrl() {
		return lecturerPictureUrl;
	}
	public void setLecturerPictureUrl(String lecturerPictureUrl) {
		this.lecturerPictureUrl = lecturerPictureUrl;
	}
	public String getLecturerName() {
		return lecturerName;
	}
	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}
	public String getLecturerCareer() {
		return lecturerCareer;
	}
	public void setLecturerCareer(String lecturerCareer) {
		this.lecturerCareer = lecturerCareer;
	}
	public String getLecturerEmail() {
		return lecturerEmail;
	}
	public void setLecturerEmail(String lecturerEmail) {
		this.lecturerEmail = lecturerEmail;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	@Override
	public String toString() {
		return "IntroLecturer [lecturerPictureUrl=" + lecturerPictureUrl + ", lecturerName=" + lecturerName
				+ ", lecturerCareer=" + lecturerCareer + ", lecturerEmail=" + lecturerEmail + ", deptName=" + deptName
				+ "]";
	}
	
	
}
