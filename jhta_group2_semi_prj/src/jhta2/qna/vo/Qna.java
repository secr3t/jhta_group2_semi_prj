package jhta2.qna.vo;

import java.util.Date;

import jhta2.course.vo.Course;
import jhta2.student.vo.Student;

public class Qna {
	
	private int no;
	private String title;
	private String quesContent;
	private Date quesDate;
	private String ansContent;
	private Date ansRegdate;
	private String active;
	private Course course;
	private Student student;
	
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
	public String getQuesContent() {
		return quesContent;
	}
	public void setQuesContent(String quesContent) {
		this.quesContent = quesContent;
	}
	public Date getQuesDate() {
		return quesDate;
	}
	public void setQuesDate(Date quesDate) {
		this.quesDate = quesDate;
	}
	public String getAnsContent() {
		return ansContent;
	}
	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}
	public Date getAnsRegdate() {
		return ansRegdate;
	}
	public void setAnsRegdate(Date ansRegdate) {
		this.ansRegdate = ansRegdate;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	@Override
	public String toString() {
		return "Qna [no : " + no + ", title : " + title + ", quesContent : " + quesContent + ", quesDate : " + quesDate
				+ ", ansContent : " + ansContent + ", ansRegdate : " + ansRegdate + ", active : " + active
				+ ", course : " + course + ", student : " + student + "]";
	}
	
}
