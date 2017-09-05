package pro.mypage.dao;

import java.sql.SQLException;

import pro.student.vo.Student;
import pro.utils.IbatisUtils;

public class MypageStudentDao {

	public Student getStudentByNo(int studentNo) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("MyPageStudent.getStudentByNo");
	}
}
