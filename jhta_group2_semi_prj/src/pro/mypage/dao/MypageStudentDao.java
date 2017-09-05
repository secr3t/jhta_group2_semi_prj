package pro.mypage.dao;

import java.sql.SQLException;

import pro.student.vo.Student;
import pro.utils.IbatisUtils;

public class MypageStudentDao {
	
	private static MypageStudentDao self = new MypageStudentDao();
	private MypageStudentDao() {}
	public static MypageStudentDao getInstance() {
		return self;
	}
	
	public Student getStudentByNo(int studentNo) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("MyPageStudent.getStudentByNo", studentNo);
	}
}
