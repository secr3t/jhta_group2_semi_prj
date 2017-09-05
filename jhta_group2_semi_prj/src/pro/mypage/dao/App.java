package pro.mypage.dao;

import java.sql.SQLException;

import pro.student.vo.Student;

public class App {
	
	public static void main(String[] args) throws SQLException {
		
		Student student = MypageStudentDao.getInstance().getStudentByNo(1);
		System.out.println(student);
	}
}
