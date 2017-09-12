package pro.introducecourse.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.lecturer.vo.Lecturer;
import pro.utils.IbatisUtils;

public class secondLecturerDao {

	private static secondLecturerDao self = new secondLecturerDao();
	private secondLecturerDao() {}
	public static secondLecturerDao getInstance() {
		return self;
	}
	
	@SuppressWarnings("unchecked")
	public List<Lecturer> getAllLecturers() throws SQLException{
		return IbatisUtils.getSqlMap().queryForList("lecturer.getAlllecturers");
	}
	
	public Lecturer getlecturerByNo(int no) throws SQLException{
		return (Lecturer) IbatisUtils.getSqlMap().queryForObject("lecturer.getlecturerByNo", no);
	}
}
