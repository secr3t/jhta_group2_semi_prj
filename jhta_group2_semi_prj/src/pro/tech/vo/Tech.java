package pro.tech.vo;

import java.util.Date;

import pro.student.vo.Student;

public class Tech {
	
	private int no;
	private String title;
	private String quesContent;
	private Date quesRegdate;
	private String ansContent;
	private Date ansRegdate;
	private String active;
	private Student student;
	private int qtypeNo;
	
	
	public int getQtypeNo() {
		return qtypeNo;
	}
	public void setQtypeNo(int qtypeNo) {
		this.qtypeNo = qtypeNo;
	}
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
	public Date getQuesRegdate() {
		return quesRegdate;
	}
	public void setQuesRegdate(Date quesRegdate) {
		this.quesRegdate = quesRegdate;
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
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	@Override
	public String toString() {
		return "Tech [no : " + no + ", title : " + title + ", quesContent : " + quesContent + ", quesRegdate : "
				+ quesRegdate + ", ansContent : " + ansContent + ", ansRegdate : " + ansRegdate + ", active : " + active
				+ ", student : " + student + "]";
	}
}
