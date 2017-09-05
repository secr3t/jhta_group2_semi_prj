package pro.point.vo;

import java.util.Date;

import pro.student.vo.Student;

public class Point {

	private int payment;
	private String history;
	private Date date;
	private Student student;
	
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	@Override
	public String toString() {
		return "Point [payment : " + payment + ", history : " + history + ", date : " + date + ", student : " + student
				+ "]";
	}
}
