package pro.lectureinfo.vo;

public class LectureInfo {
	
	private int courseNo;
	private String BoardName;
	private String picture;
	private String summary;
	private String detail;
	private String lecturerName;
	private int qty;
	private String deptName;
	private int point;
	
	
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public String getBoardName() {
		return BoardName;
	}
	public void setBoardName(String boardName) {
		BoardName = boardName;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getLecturerName() {
		return lecturerName;
	}
	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return "LectureInfo [courseNo=" + courseNo + ", BoardName=" + BoardName + ", picture=" + picture + ", summary="
				+ summary + ", detail=" + detail + ", lecturerName=" + lecturerName + ", qty=" + qty + ", deptName="
				+ deptName + ", point=" + point + "]";
	}

	

}
