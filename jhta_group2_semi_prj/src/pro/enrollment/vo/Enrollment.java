package pro.enrollment.vo;

import java.util.Date;

import pro.course.vo.Course;
import pro.student.vo.Student;

public class Enrollment {

	private int no;
	private Date startDate;
	private Student student;
	private Course course;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
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
		return "Enrollment [no : " + no + ", startDate : " + startDate + ", student : " + student + ", course : "
				+ course + "]";
	}	
}
