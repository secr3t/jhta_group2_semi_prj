package pro.lecturer.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.lecturer.vo.IntroLecturer;
import pro.lecturer.vo.Lecturer;
import pro.utils.IbatisUtils;

import java.sql.SQLException;
import pro.student.vo.Student;
import pro.utils.IbatisUtils;
public class LecturerDao {
	
	private static LecturerDao self = new LecturerDao();
	private LecturerDao() {}
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
	
	@SuppressWarnings("unchecked")
	public List<IntroLecturer> getAllIntroLecturer() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("lecturer.getAllIntroLecturer");
	}
	
	@SuppressWarnings("unchecked")
	public List<IntroLecturer> getAllIntroLecturerByDeptNo(int deptNo) throws SQLException{
		return IbatisUtils.getSqlMap().queryForList("lecturer.getAllIntroLecturerByDeptNo", deptNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<IntroLecturer> getAllIntroLecturerByLecturerNo(int lecturerNo) throws SQLException{
		return IbatisUtils.getSqlMap().queryForList("lecturer.getAllIntroLecturerByDeptNo", lecturerNo);
	}
	
	public void addLecturer (Lecturer lecturer) throws SQLException {
		IbatisUtils.getSqlMap().insert("lecturer.addLecturer", lecturer);
	}
}
