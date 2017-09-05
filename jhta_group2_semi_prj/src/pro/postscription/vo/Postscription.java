package pro.postscription.vo;

import java.util.Date;

import pro.course.vo.Course;
import pro.student.vo.Student;

public class Postscription {

	private int no;
	private String title;
	private String content;
	private Date regdate;
	private int grade;
	private String active;
	private Student student;
	private Course course;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	@Override
	public String toString() {
		return "Postscription [no : " + no + ", title : " + title + ", content : " + content + ", regdate : " + regdate
				+ ", grade : " + grade + ", active : " + active + ", student : " + student + ", course : " + course
				+ "]";
	}
}
