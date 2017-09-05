package jhta2.course.vo;

import jhta2.dept.vo.Dept;
import jhta2.lecturer.vo.Lecturer;

public class Course {

	private int no;
	private String name;
	private String summary;
	private String detail;
	private int point;
	private Lecturer lecturer;
	private Dept dept;
	
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Lecturer getLecturer() {
		return lecturer;
	}
	public void setLecturer(Lecturer lecturer) {
		this.lecturer = lecturer;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	
	@Override
	public String toString() {
		return "Course [no : " + no + ", name : " + name + ", summary : " + summary + ", detail : " + detail
				+ ", point : " + point + ", lecturer : " + lecturer + ", dept : " + dept + "]";
	}
}
