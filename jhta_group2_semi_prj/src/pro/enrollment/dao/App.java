package pro.enrollment.dao;

import java.sql.SQLException;
import java.util.Date;

import pro.course.vo.Course;
import pro.enrollment.vo.Enrollment;
import pro.student.vo.Student;

public class App {
	public static void main(String[] args)throws SQLException {
		
		Student stu = new Student();
		stu.setNo(1);
		Course cour = new Course();
		cour.setNo(1);
		EnrollmentDao eDao = EnrollmentDao.getInstance();
		Enrollment enRo = new Enrollment();
		enRo.setCourse(cour);
		enRo.setStudent(stu);
		
		eDao.addEnrollment(enRo);
		
		
		
	}
}
