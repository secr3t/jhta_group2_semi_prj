package pro.student.dao;

import java.sql.SQLException;

import pro.student.vo.Student;
import pro.utils.IbatisUtils;

public class StudentDao {

	public Student getStudentByEmail(String email) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("getStudentByEmail",  email);
	}
}
