package pro.lectureinfo.vo;

public class LectureInfo {
	
	
	private String picture;
	private String summary;
	private String detail;
	private String name;
	private int qty;
	private String deptName;
	private int point;
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	@Override
	public String toString() {
		return "LectureInfo [picture=" + picture + ", summary=" + summary + ", detail=" + detail + ", name=" + name
				+ ", qty=" + qty + ", deptName=" + deptName + "]";
	}
	
	
}
