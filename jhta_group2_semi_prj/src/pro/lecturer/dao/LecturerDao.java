package pro.lecturer.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.lecturer.vo.Lecturer;
import pro.utils.IbatisUtils;

import java.sql.SQLException;
import pro.student.vo.Student;
import pro.utils.IbatisUtils;
public class LecturerDao {
	
	private static LecturerDao self = new LecturerDao();
	public LecturerDao() {}
	public static LecturerDao getInstance() {
		return self;
	}	
	
	public List<Lecturer> getAllLecturers() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("lecturer.getAllLecturers");
	}
	public Lecturer getLecturerByEmail(String email) throws SQLException {
		return (Lecturer) IbatisUtils.getSqlMap().queryForObject("lecturer.getLecturerByEmail",  email);
	}
	
	public Lecturer getLecturerByNo (int no) throws SQLException {
		return (Lecturer) IbatisUtils.getSqlMap().queryForObject("lecturer.getLecturerByNo", no);
	}
	
}
